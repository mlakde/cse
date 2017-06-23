package cse.web.controller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.taglibs.standard.lang.jstl.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import cse.model.Application;
import cse.model.ApplicationStatus;
import cse.model.ApplicationToken;
import cse.model.PersonBiographic;
import cse.model.User;
import cse.model.dao.ApplicationDao;
import cse.util.email.MailUtil;


@Controller
public class AuthorizedSignerController {
	
	@Autowired
	private ApplicationDao applicationDao;
	
	ObjectMapper mapper = new ObjectMapper();
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				new SimpleDateFormat("M/d/yyyy"), true));
	}
	
	 //Method to generate Application Code
	 @RequestMapping(value= "/getNewApplication", method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE)
	  public void saveMessage(@RequestBody String jsonData, HttpServletResponse response, HttpSession session) throws IOException, ParseException{
		Gson gson = new Gson();
		
		ApplicationToken appToken = gson.fromJson(jsonData, ApplicationToken.class);
		
		User loggedInUser = (User) session.getAttribute("authenticatedUser");
		appToken.setAuthorizedSigner(loggedInUser);
		
		String applicationType = appToken.getApplicationType().getType();
		
		String token = generateApplicationToken();
		appToken.setApplicationToken(token);
		appToken.setActive(true);
		appToken.setCreatedDate(new Date());
		appToken.setExpiryDate(getExpiryDate());
		appToken.setApplicationType(applicationDao.getApplicationTypeByName(applicationType));

		String jsonInString = null;
		ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Mail.xml");
	    MailUtil mm = (MailUtil) context.getBean("mailUtil");  
	    try {
			JavaMailSenderImpl sender = (JavaMailSenderImpl) context.getBean("mailSenderToken");
			mm.setMailSender(sender);
    		mm.sendTokenNotification(sender.getUsername(), appToken.getEmailAddress_Primary() , "Your Badge Application Submitted to LAWA", 
    				appToken.getFirstName(), appToken.getLastName(), appToken.getCompanyName(), appToken.getSocialSecurityNumber(), token);
    		ApplicationToken savedAppToken  = applicationDao.saveApplicationToken(appToken);
			jsonInString= "Submitted Successfully!!";
		} catch (Exception e) {
			System.out.println("The recipient is not right");
			jsonInString= "Please Check Email you entered.";
		}
		PrintWriter out= response.getWriter();
		out.println(jsonInString); 
	  }

	 
	//Method to generate the expiry of Token
	private Date getExpiryDate() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, 30);
		Date formattedDate = cal.getTime();
		return formattedDate;	
	}
	
	//Method to get forms which are filled my applicant for review- authorized Signer Clicked on id
	@RequestMapping(value = "/forms/form.html", method = RequestMethod.GET)
	public String form(ModelMap models,HttpServletResponse response, @RequestParam(required = false) Long id) 
	{
		Application application = applicationDao.getApplication(id);
		
		PersonBiographic personBiographic = application.getPersonBiographic();
		/*models.put("personBiographic", personBiographic);*/
		
		Gson gson = new Gson();
		String jsonString = gson.toJson(personBiographic);

		models.addAttribute("test",jsonString);
		return "forms/form";
	}

	//Method to get Applications which are sent to Applicant
	@RequestMapping(value = "/getTokenGeneratedApplications", method = RequestMethod.POST)
	private @ResponseBody List<ApplicationToken> getTokenGeneratedApplications(@RequestBody String companyDetailObj, HttpSession session, HttpServletResponse response) throws IOException{
		System.out.println(companyDetailObj);
		Gson gson = new Gson();
		JsonObject jobj = new Gson().fromJson(companyDetailObj, JsonObject.class);
		
		String companyName = jobj.get("companyName").getAsString();
		String companyDivision = jobj.get("companyDivision").getAsString();
		String tabName = jobj.get("tabName").getAsString();
		User loggedInUser = (User) session.getAttribute("authenticatedUser");
		List<ApplicationToken> newApplicationsTokenGenerated = new ArrayList<ApplicationToken>();
		List<ApplicationToken> tempList = applicationDao.getApplicationTokenByUser(loggedInUser,companyName,companyDivision);
		
		if(tempList != null){
			for(ApplicationToken a : tempList){
				if(applicationDao.getApplicationByApplicationToken(a) == null && a.getActive() == true){
					System.out.println(a.getExpiryDate());
					newApplicationsTokenGenerated.add(a);
				} 
			}
		}
		
		return newApplicationsTokenGenerated;
	}


	//Method to get Applications which area Under Reviewed
	@RequestMapping(value = "/getApplicationsUnderReview", method = RequestMethod.POST)
	private @ResponseBody List<Application> getApplicationsUnderReview(@RequestBody String companyDetailObj, HttpSession session, HttpServletResponse response) throws IOException{
		System.out.println(companyDetailObj);
		Gson gson = new Gson();
		JsonObject jobj = new Gson().fromJson(companyDetailObj, JsonObject.class);
		
		String companyName = jobj.get("companyName").getAsString();
		String companyDivision = jobj.get("companyDivision").getAsString();
		String tabName = jobj.get("tabName").getAsString();
		User loggedInUser = (User) session.getAttribute("authenticatedUser");
		
		List<Application> newApplicationsUnderReview = new ArrayList<Application>();
		ApplicationStatus appStatus = applicationDao.getApplicationStatusByName("approvalRequired");
		newApplicationsUnderReview = applicationDao.getApplicationByAuthorizedSignerAndStatus(loggedInUser, appStatus, companyName,companyDivision);
		return newApplicationsUnderReview;
	}
	
	//Method to get Applications Approved By Authorized Signer
	@RequestMapping(value = "/getSignerApprovedApplications", method = RequestMethod.POST)
	private @ResponseBody List<Application> getSignerApprovedApplications(@RequestBody String companyDetailObj,HttpSession session, HttpServletResponse response) throws IOException{
		System.out.println(companyDetailObj);
		Gson gson = new Gson();
		JsonObject jobj = new Gson().fromJson(companyDetailObj, JsonObject.class);
		
		String companyName = jobj.get("companyName").getAsString();
		String companyDivision = jobj.get("companyDivision").getAsString();
		String tabName = jobj.get("tabName").getAsString();

		User loggedInUser = (User) session.getAttribute("authenticatedUser");
		List<Application> newApplicationsUnderReview = new ArrayList<Application>();
		ApplicationStatus appStatus = applicationDao.getApplicationStatusByName("signerApproved");
		newApplicationsUnderReview = applicationDao.getApplicationByAuthorizedSignerAndStatus(loggedInUser, appStatus,companyName,companyDivision);
		return newApplicationsUnderReview;
	}
	
	//Method to get Applications Approved By Agent
	@RequestMapping(value = "/getAgentApprovedApplications", method = RequestMethod.POST)
	private @ResponseBody List<Application> getAgentApprovedApplications(@RequestBody String companyDetailObj, HttpSession session, HttpServletResponse response) throws IOException{
		System.out.println(companyDetailObj);
		
		Gson gson = new Gson();
		JsonObject jobj = new Gson().fromJson(companyDetailObj, JsonObject.class);
		
		String companyName = jobj.get("companyName").getAsString();
		String companyDivision = jobj.get("companyDivision").getAsString();
		String tabName = jobj.get("tabName").getAsString();

		User loggedInUser = (User) session.getAttribute("authenticatedUser");
		List<Application> newApplicationsApprovedByAgent = new ArrayList<Application>();
		ApplicationStatus appStatus = applicationDao.getApplicationStatusByName("agentApproved");
		newApplicationsApprovedByAgent = applicationDao.getApplicationByAuthorizedSignerAndStatus(loggedInUser, appStatus,companyName,companyDivision);
		return newApplicationsApprovedByAgent;
	}

	//Method to get Applications Rejected By Signer
	@RequestMapping(value = "/getSignerRejectedApplications", method = RequestMethod.POST)
	private @ResponseBody List<Application> getSignerRejectedApplications(@RequestBody String companyDetailObj, HttpSession session, HttpServletResponse response) throws IOException{
		System.out.println(companyDetailObj);
		
		Gson gson = new Gson();
		JsonObject jobj = new Gson().fromJson(companyDetailObj, JsonObject.class);
		
		String companyName = jobj.get("companyName").getAsString();
		String companyDivision = jobj.get("companyDivision").getAsString();
		String tabName = jobj.get("tabName").getAsString();

		User loggedInUser = (User) session.getAttribute("authenticatedUser");
		List<Application> newApplicationsRejectedBySigner = new ArrayList<Application>();
		ApplicationStatus appStatus = applicationDao.getApplicationStatusByName("signerRejected");
		newApplicationsRejectedBySigner = applicationDao.getApplicationByAuthorizedSignerAndStatus(loggedInUser, appStatus,companyName,companyDivision);
		return newApplicationsRejectedBySigner;
	}


	//Method to get Applications Denied By Agent
	@RequestMapping(value = "/getAgentDeniedApplications", method = RequestMethod.POST)
	private @ResponseBody List<Application> getAgentDeniedApplications(@RequestBody String companyDetailObj, HttpSession session, HttpServletResponse response) throws IOException{
		System.out.println(companyDetailObj);
		
		Gson gson = new Gson();
		JsonObject jobj = new Gson().fromJson(companyDetailObj, JsonObject.class);
		
		String companyName = jobj.get("companyName").getAsString();
		String companyDivision = jobj.get("companyDivision").getAsString();
		String tabName = jobj.get("tabName").getAsString();

		User loggedInUser = (User) session.getAttribute("authenticatedUser");
		List<Application> newApplicationsDeniedByAgent = new ArrayList<Application>();
		ApplicationStatus appStatus = applicationDao.getApplicationStatusByName("agentDenied");
		newApplicationsDeniedByAgent = applicationDao.getApplicationByAuthorizedSignerAndStatus(loggedInUser, appStatus,companyName,companyDivision);
		return newApplicationsDeniedByAgent;
	}
	
	private final String USER_AGENT = "Mozilla/5.0";
	private String generateApplicationToken() throws IOException {
		String url = "http://localhost:8080/tokenWebService/rest/generateToken";
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		// optional default is GET
		con.setRequestMethod("GET");

		//add request header
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
		String token = response.toString();
		return token;
	}


}
