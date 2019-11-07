package service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.ProfileMapper;
import pojo.Profile;
import pojo.ProfileExample;
import pojo.ProfileExample.Criteria;
import service.ProfileService;

@Service
public class ProfileServiceImpl implements ProfileService{
	
	@Autowired
	ProfileMapper profileMapper;

	@Override
	public Profile getProfileByUser(int uid) {
		return profileMapper.getProfileByUser(uid);
	}

	@Override
	public Profile getProfileById(int id) {
		return profileMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateProfile(Profile profile) {
		profileMapper.updateByPrimaryKey(profile);
	}

	@Override
	public void addProfile(Profile profile) {
		profileMapper.insert(profile);
	}

	@Override
	public void updateProfileBySelective(Profile profile) {
		profileMapper.updateByPrimaryKeySelective(profile);
	}
	
	
}
