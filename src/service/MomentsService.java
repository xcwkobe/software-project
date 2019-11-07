package service;

import java.util.List;

import pojo.Moments;

public interface MomentsService {
	
	void addMoments(Moments moments);
	
	List<Moments> memberMoments(String member);
	
	List<Moments> momentsByUserMember(int uid,String member);
}
