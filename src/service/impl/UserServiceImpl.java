package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.UserMapper;
import pojo.User;
import pojo.UserExample;
import service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper usermapper;
	
	@Override
	public void addUser(User user) {
		usermapper.insert(user);
	}

	@Override
	public void deleteUser(int id) {
		usermapper.deleteByPrimaryKey(id);
	}

	@Override
	public void updateUser(User user) {
		usermapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public User getUserById(int id) {
		return usermapper.selectByPrimaryKey(id);
	}

	@Override
	public User getUserByNP(String name, String password) {
		return usermapper.getUserByNP(name, password);
	}

	@Override
	public List<User> listUser() {
		UserExample example = new UserExample();
		example.setOrderByClause("id desc");
		return usermapper.selectByExample(example);
	}

	@Override
	public boolean isExist(String name) {
		User user = usermapper.getUserByName(name);
		if (null==user) {
			return false;
		}
		return true;
	}

	@Override
	public List<User> searchUser(String name) {
		UserExample example = new UserExample();
		example.createCriteria().andNameLike("%"+name+"%");
		return usermapper.selectByExample(example);
	}

}
