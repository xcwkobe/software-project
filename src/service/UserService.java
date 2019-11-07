package service;

import java.util.List;

import pojo.User;

public interface UserService {
	void addUser(User user);
	
	void deleteUser(int id);
	
	void updateUser(User user);
	
	User getUserById(int id);
	
	User getUserByNP(String name,String password);
	
	List<User> listUser();
	
	boolean isExist(String name);
	
	List<User> searchUser(String name);
}
