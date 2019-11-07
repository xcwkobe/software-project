package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import pojo.Profile;
import pojo.ToDoList;
import pojo.User;
import service.ProfileService;
import service.ToDoListService;
import service.UserService;
import util.Page;

@Controller
public class AdminController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ToDoListService toDoListService;
	
	@Autowired
	ProfileService profileService;
	
	@RequestMapping("admin")
	public String login(Model model,String name,String password,HttpServletRequest request){
		User user = userService.getUserByNP(name, password);
		if (null==user) {
			model.addAttribute("Lmsg", "check your account or password!");
			return "loginAndRegister";
		}
		request.getSession().setAttribute("user", user);
		
		return "selectRole";
	}
	
	@RequestMapping("home")
	public String home(Model model,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("user");
		List<ToDoList> fatherList = toDoListService.toDoListByUserAndType(user.getId(), ToDoListService.fatherType);
		model.addAttribute("fatherList", fatherList);
		List<ToDoList> motherList = toDoListService.toDoListByUserAndType(user.getId(), ToDoListService.motherType);
		model.addAttribute("motherList", motherList);
		List<ToDoList> kidList = toDoListService.toDoListByUserAndType(user.getId(), ToDoListService.kidType);
		model.addAttribute("kidList", kidList);
		
//		Page pagef = new Page();
//		PageHelper.offsetPage(pagef.getStart(),pagef.getCount());
//		int totalf = (int) new PageInfo<>(fatherList).getTotal();
//		pagef.setTotal(totalf);
//		pagef.setParam("&type="+ToDoListService.fatherType);
//		model.addAttribute("pagef", pagef);

		Profile profile = profileService.getProfileByUser(user.getId());
		model.addAttribute("profile", profile);
		return "home";
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpServletResponse response){
		request.getSession().removeAttribute("user");
		request.getSession().removeAttribute("fType");
		request.getSession().removeAttribute("mType");
		request.getSession().removeAttribute("kType");
		return "loginAndRegister";
	}
	
	@RequestMapping("register")
	public String register(Model model,String name,String password){
//		boolean exist = userService.isExist(name);
//		if (exist) {
//			model.addAttribute("Rmsg", "account already exist!");
//			return "loginAndRegister";
//		}
		checkAccount(name);
		User user = new User(name, password);
		userService.addUser(user);
		return "loginAndRegister";
	}
	
	@ResponseBody
	@RequestMapping("checkAccount")
	public String checkAccount(String name){
		String msg=null;
		boolean exist = userService.isExist(name);
		if (exist) {
			msg="account already exist!";
		}else {
			msg="you can use this account";
		}
		return msg;
	}
	
	
}
