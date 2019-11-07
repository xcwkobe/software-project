package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import pojo.ToDoList;
import pojo.User;
import service.ToDoListService;
import service.UserService;
import util.Page;

@Controller
public class ToDoController {
	
	@Autowired
	ToDoListService toDoListService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping("selectType")
	public String selectType(Model model,String type,HttpServletRequest request){
		if (type.equals(ToDoListService.fatherType)) {
			request.getSession().setAttribute("fType", "fatherType");
			request.getSession().removeAttribute("mType");
			request.getSession().removeAttribute("kType");
		}
		if (type.equals(ToDoListService.motherType)) {
			request.getSession().setAttribute("mType", "motherType");
			request.getSession().removeAttribute("fType");
			request.getSession().removeAttribute("kType");
		}
		if (type.equals(ToDoListService.kidType)) {
			request.getSession().setAttribute("kType", "kidType");
			request.getSession().removeAttribute("mType");
			request.getSession().removeAttribute("fType");
		}
		
//		PageHelper.offsetPage(page.getStart(),5);
//		int total = (int) new PageInfo<>(listThings).getTotal();
//		page.caculateLast(total);
//		model.addAttribute("page", page);
//		model.addAttribute("listThings",listThings);
		return "redirect:home";
	}
	
	@RequestMapping("addToDo")
	public String addThing(Model model,String start,String end,HttpServletRequest request,ToDoList toDoList) throws ParseException{
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		toDoList.setUid(user.getId());
		Date s = new SimpleDateFormat("yyyy/MM/dd HH:mm").parse(start);
		Date e = new SimpleDateFormat("yyyy/MM/dd HH:mm").parse(end);
		toDoList.setStarttime(s);
		toDoList.setEndtime(e);
		String fType = (String) session.getAttribute("fType");
		String mType = (String) session.getAttribute("mType");
		String kType = (String) session.getAttribute("kType");
		if (null!=fType) {
			toDoList.setType(ToDoListService.fatherType);
		}
		if (null!=mType) {
			toDoList.setType(ToDoListService.motherType);
		}
		if (null!=kType) {
			toDoList.setType(ToDoListService.kidType);
		}
		toDoListService.addThings(toDoList);
		return "redirect:home";
	}

	@ResponseBody
	@RequestMapping("editThing")
	public ToDoList edit(Model model,@RequestParam("tid") int id){
		ToDoList thing = toDoListService.toDoListById(id);
		return thing;
	}
	
	@RequestMapping("updateThing")
	public String update(HttpSession session,String start,String end,ToDoList toDoList) throws ParseException{
//		toDoList.setUid(id);
//		Date s = new SimpleDateFormat("yyyy/MM/dd HH:mm").parse(start);
//		Date e = new SimpleDateFormat("yyyy/MM/dd HH:mm").parse(end);
//		toDoList.setStarttime(s);
//		toDoList.setEndtime(e);
		String fType = (String) session.getAttribute("fType");
		String mType = (String) session.getAttribute("mType");
		String kType = (String) session.getAttribute("kType");
		if (null!=fType) {
			toDoList.setType(ToDoListService.fatherType);
		}
		if (null!=mType) {
			toDoList.setType(ToDoListService.motherType);
		}
		if (null!=kType) {
			toDoList.setType(ToDoListService.kidType);
		}
		toDoListService.update(toDoList);
		return "redirect:home";
	}
	
}
