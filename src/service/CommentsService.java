package service;

import java.util.List;

import pojo.Comments;

public interface CommentsService {
	
	String fromFather="father";
	
	String fromMother="mother";
	
	String fromKid="kid";
	
	List<Comments> listCommentsByToDo(int tid);
	
	void addComments(Comments comments);
	
	void deleteComments(int id);
	
	List<Comments> listCommentsByFrom(String from);
	
	List<Comments> listCommentsByFromToDo(String from,int tid);
	
}
