package service;

import pojo.Photo;

public interface PhotoService {
	
	void updateSelective(Photo photo);
	
	void addPhoto(Photo photo);
	
	Photo getPhotoByUid(int uid);
}
