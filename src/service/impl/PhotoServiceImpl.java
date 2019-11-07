package service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.PhotoMapper;
import pojo.Photo;
import service.PhotoService;

@Service
public class PhotoServiceImpl implements PhotoService{
	
	@Autowired
	PhotoMapper photoMapper;

	@Override
	public void updateSelective(Photo photo) {
		photoMapper.updateByPrimaryKeySelective(photo);
	}

	@Override
	public void addPhoto(Photo photo) {
		photoMapper.insert(photo);
	}

	@Override
	public Photo getPhotoByUid(int uid) {
		return photoMapper.getPhotoByUid(uid);
	}
	
	
}
