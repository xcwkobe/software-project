package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.User;
import pojo.UserExample;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User getUserByNP(@Param("name") String name,@Param("password") String password);
    
    User getUserByName(String name);
}