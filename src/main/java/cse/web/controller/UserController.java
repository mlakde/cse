package cse.web.controller;


import java.io.IOException;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import cse.model.User;
import cse.model.dao.UserDao;

@Controller
public class UserController {
	@Autowired
	private UserDao userDao;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value = { "/login", "index.html" } , method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam String email,
			@RequestParam String password, HttpSession session, ModelMap models) {
		User user = userDao.getUser(email);
		//here we need to check the AD user and validate.
		//If he is AS, redirect accordingly. 
		
		if (user == null || !user.getPassword().equals(password))
			return "redirect:/login";
		
		session.setAttribute("authenticatedUser", user);
		if (user.isAdmin()) {
			logger.info(user.getEmail() + " logged in.");
			return "redirect:admin";
		} else if (user.isAs()){
			logger.info(user.getEmail() + " logged in.");
			return "redirect:home";
		} else
			return "redirect:login";
	}


	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(ModelMap models,HttpSession session) {
		return "admin";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpSession session, ModelMap models) throws IOException{
		return "home";
	}
	
	

}
