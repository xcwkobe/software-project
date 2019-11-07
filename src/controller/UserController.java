package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import pojo.User;
import service.UserService;
import util.Page;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
//	@RequestMapping("list")
//	public String list(Model model,Page page){
//		PageHelper.offsetPage(page.getStart(),5);
//		List<User> users = userService.listUser();
//		int total = (int) new PageInfo<>(users).getTotal();
//		page.caculateLast(total);
//		model.addAttribute("page", page);
//		model.addAttribute("users",users);
//		return "userList";
//	}
	
	@RequestMapping("addUser")
	public String add(Model model,@RequestParam("name") String name,@RequestParam("password") String password){
		boolean exist = userService.isExist(name);
		if (exist) {
			model.addAttribute("msg", "UserName already exist!");
			return "addUser";
		}
		User user = new User();
		user.setName(name);
		user.setPassword(password);
		userService.addUser(user);
		return "redirect:list";
	}
	
	@RequestMapping("deleteUser")
	public String delete(Model model,@RequestParam("uid") int id){
		userService.deleteUser(id);
		return "redirect:list";
	}
	
	@RequestMapping("editUser")
	public String edit(Model model,@RequestParam("uid") int id){
		User user = userService.getUserById(id);
		model.addAttribute("user", user);
		return "editUser";
	}
	
	@RequestMapping("updateUser")
	public String update(Model model,@RequestParam("uid") int id,String name,String password ){
		User user = userService.getUserById(id);
		user.setName(name);
		user.setPassword(password);
		userService.updateUser(user);
		
		return "redirect:list";
	}
	
//	@RequestMapping("searchUser")
//	public String search(Model model,String keyword,Page page){
//		PageHelper.offsetPage(page.getStart(),10);
//		List<User> users = userService.searchUser(keyword);
//		int total = (int) new PageInfo<>(users).getTotal();
//		page.caculateLast(total);
//		model.addAttribute("page", page);
//		model.addAttribute("users", users);
//		model.addAttribute("keyword", keyword);
//		return "searchResult";
//	}
	
}
