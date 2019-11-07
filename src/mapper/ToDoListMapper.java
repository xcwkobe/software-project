package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.ToDoList;
import pojo.ToDoListExample;

public interface ToDoListMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ToDoList record);

    int insertSelective(ToDoList record);

    List<ToDoList> selectByExample(ToDoListExample example);

    ToDoList selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ToDoList record);

    int updateByPrimaryKey(ToDoList record);
    
    List<ToDoList> toDoListByUserAndType(@Param("uid")int uid,@Param("type")String type);
}