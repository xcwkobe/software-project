package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.ToDoListMapper;
import pojo.ToDoList;
import pojo.ToDoListExample;
import service.ToDoListService;

@Service
public class ToDoListServiceImpl implements ToDoListService{
	
	@Autowired
	ToDoListMapper toDoListMapper;
	
	@Override
	public void addThings(ToDoList doList) {
		toDoListMapper.insert(doList);
	}

	@Override
	public void deleteThings(int id) {
		toDoListMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<ToDoList> toDoListByUser(int uid) {
		ToDoListExample example = new ToDoListExample();
		example.createCriteria().andUidEqualTo(uid);
		example.setOrderByClause("id desc");
		return toDoListMapper.selectByExample(example);
	}

	@Override
	public List<ToDoList> toDoListByUserAndType(int uid,String type) {
		return toDoListMapper.toDoListByUserAndType(uid,type);
	}

	@Override
	public ToDoList toDoListById(int id) {
		return toDoListMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateById(int id) {
		ToDoList listById = toDoListById(id);
		toDoListMapper.updateByPrimaryKey(listById);
	}

	@Override
	public void update(ToDoList toDoList) {
		toDoListMapper.updateByPrimaryKeySelective(toDoList);
	}

	@Override
	public List<ToDoList> toDoListByType(String type) {
		ToDoListExample example = new ToDoListExample();
		example.createCriteria().andTypeEqualTo(type);
		return toDoListMapper.selectByExample(example);
	}

}
