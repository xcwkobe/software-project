package mapper;

import java.util.List;
import pojo.Moments;
import pojo.MomentsExample;

public interface MomentsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Moments record);

    int insertSelective(Moments record);

    List<Moments> selectByExample(MomentsExample example);

    Moments selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Moments record);

    int updateByPrimaryKey(Moments record);
}