package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import util.UploadedImageFile;

@Controller
public class PageController {
	
	@RequestMapping("addUserPage")
	public String list(){
		return "addUser";
	}
	
	@RequestMapping("loginPage")
	public String login(){
		return "loginAndRegister";
	}
	
	@RequestMapping("warning")
	public String warning(){
		return "warningPage";
	}
	
	@RequestMapping("registerPage")
	public String register(){
		return "register";
	}
	
//	@RequestMapping("editProfilePage")
//	public String editProfile(int uid){
//		return "editProfile"+"uid="+uid;
//	} 
	
	@RequestMapping("addThing")
	public String addThing(){
		return "addThing";
	}
	

	
}
