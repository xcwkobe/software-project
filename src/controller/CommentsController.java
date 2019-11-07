package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import pojo.Comments;
import pojo.ToDoList;
import pojo.User;
import service.CommentsService;
import service.ToDoListService;
import util.Page;

@Controller
public class CommentsController {
	
	@Autowired
	CommentsService commentsService;
	
	@Autowired
	ToDoListService toDoListService;
	
	@RequestMapping("CommentsThing")
	public String list(Model model,Page page,@RequestParam("tid") int id){
		model.addAttribute("tid",id);
//		PageHelper.offsetPage(page.getStart(),5);
//		List<Comments> comments = commentsService.listCommentsByToDo(tid);
//		int total = (int) new PageInfo<>(comments).getTotal();
//		page.caculateLast(total);
//		model.addAttribute("page", page);
//		model.addAttribute("comments",comments);
		return "comments";
	}
	
	@RequestMapping("Scontent")
	public String scontent(Model model,Comments comments,@RequestParam("tid") int tid,HttpSession session){
		String fType = (String) session.getAttribute("fType");
		String mType = (String) session.getAttribute("mType");
		String kType = (String) session.getAttribute("kType");
		if (null!=fType) {
			comments.setFrom(CommentsService.fromFather);
		}
		if (null!=mType) {
			comments.setFrom(CommentsService.fromMother);
		}
		if (null!=kType) {
			comments.setFrom(CommentsService.fromKid);
		}
//		ToDoList toDoList = toDoListService.toDoListById(tid);
//		comments.setToDoList(toDoList);
		comments.setTid(tid);
		commentsService.addComments(comments);
		return "redirect:home";
	}
	
	@RequestMapping("CommentsList")
	public String commentsList(Model model,int uid,HttpSession session){
		String fType = (String) session.getAttribute("fType");
		String mType = (String) session.getAttribute("mType");
		String kType = (String) session.getAttribute("kType");
		if (null!=fType) {
			List<Comments> fromFather=new ArrayList<>();
			List<Comments> fromMother=new ArrayList<>();
			List<Comments> fromKid=new ArrayList<>();
			List<ToDoList> fatherToDoList = toDoListService.toDoListByUserAndType(uid, ToDoListService.fatherType);
			for (ToDoList fatherToDo : fatherToDoList) {
				Integer fid = fatherToDo.getId();
				List<Comments> fComments = commentsService.listCommentsByFromToDo(CommentsService.fromFather, fid);
				for (Comments c : fComments) {
					fromFather.add(c);
				}
				List<Comments> mComments = commentsService.listCommentsByFromToDo(CommentsService.fromMother, fid);
				for (Comments c : mComments) {
					fromMother.add(c);
				}
				List<Comments> kComments = commentsService.listCommentsByFromToDo(CommentsService.fromKid, fid);
				for (Comments c : kComments) {
					fromKid.add(c);
				}
			}
			model.addAttribute("fromFather", fromFather);
			model.addAttribute("fromMother", fromMother);
			model.addAttribute("fromKid", fromKid);
		}
		if (null!=mType) {
			List<Comments> fromFather=new ArrayList<>();
			List<Comments> fromMother=new ArrayList<>();
			List<Comments> fromKid=new ArrayList<>();
			List<ToDoList> motherToDoList = toDoListService.toDoListByUserAndType(uid, ToDoListService.motherType);
			for (ToDoList motherToDo : motherToDoList) {
				Integer mid = motherToDo.getId();
				List<Comments> fComments = commentsService.listCommentsByFromToDo(CommentsService.fromFather, mid);
				for (Comments c : fComments) {
					fromFather.add(c);
				}
				List<Comments> mComments = commentsService.listCommentsByFromToDo(CommentsService.fromMother, mid);
				for (Comments c : mComments) {
					fromMother.add(c);
				}
				List<Comments> kComments = commentsService.listCommentsByFromToDo(CommentsService.fromKid, mid);
				for (Comments c : kComments) {
					fromKid.add(c);
				}
			}
			model.addAttribute("fromFather", fromFather);
			model.addAttribute("fromMother", fromMother);
			model.addAttribute("fromKid", fromKid);
		}
		if (null!=kType) {
			List<Comments> fromFather=new ArrayList<>();
			List<Comments> fromMother=new ArrayList<>();
			List<Comments> fromKid=new ArrayList<>();
			List<ToDoList> kidToDoList = toDoListService.toDoListByUserAndType(uid, ToDoListService.kidType);
			for (ToDoList kidToDo : kidToDoList) {
				Integer kid = kidToDo.getId();
				List<Comments> fComments = commentsService.listCommentsByFromToDo(CommentsService.fromFather, kid);
				for (Comments c : fComments) {
					fromFather.add(c);
				}
				List<Comments> mComments = commentsService.listCommentsByFromToDo(CommentsService.fromMother, kid);
				for (Comments c : mComments) {
					fromMother.add(c);
				}
				List<Comments> kComments = commentsService.listCommentsByFromToDo(CommentsService.fromKid, kid);
				for (Comments c : kComments) {
					fromKid.add(c);
				}
			}
			model.addAttribute("fromFather", fromFather);
			model.addAttribute("fromMother", fromMother);
			model.addAttribute("fromKid", fromKid);
		}
		
		return "commentsList";
	}
	
}
