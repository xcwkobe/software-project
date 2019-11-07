package service;

import pojo.Profile;

public interface ProfileService {
	
	Profile getProfileByUser(int uid);
	
	Profile getProfileById(int id);
	
	void updateProfile(Profile profile);
	
	void addProfile(Profile profile);
	
	void updateProfileBySelective(Profile profile);
}
