package mapper;

import java.util.List;
import pojo.Profile;
import pojo.ProfileExample;

public interface ProfileMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Profile record);

    int insertSelective(Profile record);

    List<Profile> selectByExample(ProfileExample example);

    Profile selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Profile record);

    int updateByPrimaryKey(Profile record);
    
    Profile getProfileByUser(int uid);
    
//    void updateProfile(Profile profile);
}