package test;

import java.util.Date;
import java.util.List;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import mapper.CommentsMapper;
import mapper.ProfileMapper;
import mapper.ToDoListMapper;
import mapper.UserMapper;
import pojo.Comments;
import pojo.Moments;
import pojo.Profile;
import pojo.ToDoList;
import pojo.User;
import pojo.UserExample;
import service.CommentsService;
import service.MomentsService;
import service.ToDoListService;
import service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class Test {
    @Autowired
    UserService userService;
    
    @Autowired
    ToDoListService toDoListService;
    
    @Autowired
    CommentsService commentsService;
    
    @Autowired
    UserMapper usermapper;
    
    @Autowired
    ProfileMapper profilemapper;
    
    @Autowired
    MomentsService momentsService;
    
    @org.junit.Test
    public void test(){
    	List<Comments> comments = commentsService.listCommentsByFromToDo("father", 28);
    	for (Comments comments2 : comments) {
    		System.out.println(comments2.getContent());
		}
    }
}
