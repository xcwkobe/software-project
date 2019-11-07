package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.MomentsMapper;
import pojo.Moments;
import pojo.MomentsExample;
import service.MomentsService;

@Service
public class MomentsServiceImpl implements MomentsService{
	
	@Autowired
	MomentsMapper momentsMapper;
	
	@Override
	public void addMoments(Moments moments) {
		momentsMapper.insertSelective(moments);
	}

	@Override
	public List<Moments> memberMoments(String member) {
		MomentsExample example = new MomentsExample();
		example.createCriteria().andMemberEqualTo(member);
		return momentsMapper.selectByExample(example);
	}

	@Override
	public List<Moments> momentsByUserMember(int uid, String member) {
		MomentsExample example = new MomentsExample();
		example.createCriteria().andUidEqualTo(uid).andMemberEqualTo(member);
		return momentsMapper.selectByExample(example);
	}

}
