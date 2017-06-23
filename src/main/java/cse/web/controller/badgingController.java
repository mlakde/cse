package cse.web.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import cse.model.Application;
import cse.model.ApplicationDocument;
import cse.model.ApplicationToken;
import cse.model.ApplicationType;
import cse.model.PersonBiographic;
import cse.model.User;
import cse.model.dao.ApplicationDao;
import cse.model.dao.PersonBiographicDao;
import cse.model.dao.UserDao;
import cse.util.email.MailUtil;


@Controller
public class badgingController {
	
	@Autowired
	private ApplicationDao applicationDao;

	@Autowired
	private PersonBiographicDao personBiographicDao;
	
	@Autowired
	private UserDao userDao;
	
	ObjectMapper mapper = new ObjectMapper();
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				new SimpleDateFormat("M/d/yyyy"), true));
	}

	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String error(ModelMap models) {
		return "error";
	}

	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public String success(ModelMap models) {
		return "success";
	}
	
	@RequestMapping(value = "/forms/form/{token}", method = RequestMethod.GET, produces = "application/json")
	public String form(ModelMap models, @PathVariable String token,HttpServletResponse response) 
			throws IOException, InvalidKeyException, NoSuchAlgorithmException, 
			InvalidKeySpecException, NoSuchPaddingException, InvalidAlgorithmParameterException, 
			IllegalBlockSizeException, BadPaddingException {

		String decyToken = validateApplicationToken(token);
		
		if(decyToken != null ){
			System.out.println("token Pass");
			ApplicationToken applicationToken = new ApplicationToken();
			applicationToken = applicationDao.getApplicationTokenByToken(decyToken);
			
			//check status of Application. if Token generated then send otherwise already Filled.
			Application app = applicationDao.getApplicationByApplicationToken(applicationToken);
			if(app == null){
				Gson gson = new Gson();
				String jsonString = gson.toJson(applicationToken);
		
				models.addAttribute("dataJson",jsonString);
				//models.put("applicationToken", applicationToken);
				return "forms/form";
			}else{
				String message = "You already submitted form. Authorized Signer will review it."; 
				models.put("message", message);
				return "/error";
			}
		}
		
		return "redirect:/error";
	}

	
	
	
	private final String USER_AGENT = "Mozilla/5.0";
	private String validateApplicationToken(String token) throws IOException {
		String url = "http://localhost:8080/tokenWebService/rest/validateToken/" + token + "" ;
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("User-Agent", USER_AGENT);

		int responseCode = con.getResponseCode();
		System.out.println("\nSending 'GET' request to URL : ");
		System.out.println("Response Code : " + responseCode);

		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		String result = response.toString();
		return result;
	}
	
	//Method to insert Applicant form in DB 
	 @RequestMapping(value = "/forms/badge1/test", method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE)
	   public String updateFlightTime(@RequestBody HashMap<String, Object> jsonData,HttpSession session, HttpServletResponse response) {
		System.out.println("JSON DATA - " + jsonData);
		ApplicationToken token = (ApplicationToken) this.JsonConvertor((String)jsonData.get("token") , ApplicationToken.class);
		 	
		if(applicationDao.getApplicationByApplicationToken(token) == null){
			User authorizedSigner  = (User) this.JsonConvertor((String)jsonData.get("authorizedSignerInfo") , User.class);
			authorizedSigner = userDao.getUser(authorizedSigner.getId());
		    ApplicationType applicationType = (ApplicationType) this.JsonConvertor((String)jsonData.get("applicationTypeInfo") , ApplicationType.class);
		    applicationType = applicationDao.getApplicationTypeById(applicationType.getId());
	
			PersonBiographic p = (PersonBiographic) this.JsonConvertor((String) jsonData.get("personBioInfo"), PersonBiographic.class);
			PersonBiographic savedPerson = personBiographicDao.savePersonBiographics(p);
			Application application = new Application();
			application.setPersonBiographic(savedPerson);
			application.setAuthorizedSigner(authorizedSigner);
			application.setApplicationToken(token);
			application.setApplicationStatus(applicationDao.getApplicationStatusByName("approvalRequired"));
			application.setApplicationType(applicationType);
			List<ApplicationDocument> newListDoc = new ArrayList<ApplicationDocument>();
			/*ApplicationDocument a = new ApplicationDocument();
			a.setCountry("India");
			newListDoc.add(a);
			application.setApplicationDocument(newListDoc);*/
			Application savedApp = applicationDao.saveApplication(application);
			System.out.println("inserted");
			
			ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Mail.xml");
	    	MailUtil mm = (MailUtil) context.getBean("mailUtil");
	    	try {
	    		mm.sendNotification("mohitlakde89@gmail.com", "mlakde@birdi-inc.com" , "Urgent! Please Review Application", "Mohit", "FirstNameApplicant", "lastNameApplicant");
			} catch (Exception e) {
				//applicantEmailStatus = "failedEmail";
				System.out.println("The recipitian is not right");
			}
		 }
		 	return "done";
		}
		
		
		private <T> Object  JsonConvertor(String json, Class<T> c){
			   if (json == null)
				      throw new IllegalArgumentException("null cannot be converted to Object");
				    Gson gson = new GsonBuilder().disableHtmlEscaping().setDateFormat("yyyy-MM-dd").create();
				    return gson.fromJson(json, c);
		  }
		
}
