package service;

import java.util.List;

import pojo.ToDoList;

public interface ToDoListService {
	
	String fatherType="fatherType";
	
	String motherType="motherType";
	
	String kidType="kidType";
	
	String doingStatus="doingStatus";
	
	String doneStatus="doneStatus";
	
	void addThings(ToDoList doList);
	
	void deleteThings(int id);
	
	List<ToDoList> toDoListByUser(int uid);
	
	ToDoList toDoListById(int id);
	
	List<ToDoList> toDoListByUserAndType(int uid,String type);
	
	void updateById(int id);
	
	void update(ToDoList toDoList);
	
	List<ToDoList> toDoListByType(String type);
}
