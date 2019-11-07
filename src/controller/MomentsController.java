package controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import pojo.Moments;
import pojo.Photo;
import pojo.User;
import service.MomentsService;
import service.PhotoService;
import service.ToDoListService;
import util.ImageUtil;

@Controller
public class MomentsController {
	
	@Autowired
	PhotoService photoService;
	
	@Autowired
	MomentsService momentsService;
	
	@RequestMapping("familyMoments")
	public String moments(HttpSession session,Model model){
		User user = (User) session.getAttribute("user");
		List<Moments> fMoments = momentsService.momentsByUserMember(user.getId(), ToDoListService.fatherType);
		List<Moments> mMoments = momentsService.momentsByUserMember(user.getId(), ToDoListService.motherType);
		List<Moments> kMoments = momentsService.momentsByUserMember(user.getId(), ToDoListService.kidType);
		model.addAttribute("fMoments", fMoments);
		model.addAttribute("mMoments", mMoments);
		model.addAttribute("kMoments", kMoments);
		model.addAttribute("userID", user.getId());
		Photo photo = photoService.getPhotoByUid(user.getId());
		if (null==photo) {
			photo=new Photo();
			photo.setUid(user.getId());
			photoService.addPhoto(photo);
		}
		model.addAttribute("photo", photo);
		return "familyMoments";
	}
	
	@RequestMapping("addMoments")
	public String addMoments(HttpSession session,String content,int uid) throws ParseException{
		String fType = (String) session.getAttribute("fType");
		String mType = (String) session.getAttribute("mType");
		String kType = (String) session.getAttribute("kType");
		if (null!=fType) {
			Moments moments = new Moments();
			moments.setUid(uid);
			moments.setContent(content);
			moments.setCreatetime(new Date());
			moments.setMember(fType);
			momentsService.addMoments(moments);
		}
		if (null!=mType) {
			Moments moments = new Moments();
			moments.setUid(uid);
			moments.setContent(content);
			moments.setCreatetime(new Date());
			moments.setMember(mType);
			momentsService.addMoments(moments);
		}
		if (null!=kType) {
			Moments moments = new Moments();
			moments.setUid(uid);
			moments.setContent(content);
			moments.setCreatetime(new Date());
			moments.setMember(kType);
			momentsService.addMoments(moments);
		}
		
		return "redirect:familyMoments";
	}
	
	@RequestMapping("updatefHeadPhoto")
	public String fHeadPhoto(HttpSession session,MultipartFile fImage) throws IllegalStateException, IOException{
		File imageFolder = new File(session.getServletContext().getRealPath("img/"));
		if (!imageFolder.exists()) {
			imageFolder.mkdirs();
		}
		User user = (User) session.getAttribute("user");
		String fileName=user.getName()+" "+ToDoListService.fatherType+".jpg";
		File ffile = new File(imageFolder,fileName);
		Photo photo = photoService.getPhotoByUid(user.getId());
		photo.setFheadphoto(fileName);
		photoService.updateSelective(photo);
		fImage.transferTo(ffile);
		BufferedImage fimg = ImageUtil.change2jpg(ffile);
		ImageIO.write(fimg, "jpg", ffile);
		
		return "redirect:familyMoments";
	}
	
	@RequestMapping("updatemHeadPhoto")
	public String mHeadPhoto(HttpSession session,MultipartFile mImage) throws IllegalStateException, IOException{
		File imageFolder = new File(session.getServletContext().getRealPath("img/"));
		if (!imageFolder.exists()) {
			imageFolder.mkdirs();
		}
		User user = (User) session.getAttribute("user");
		String fileName=user.getName()+" "+ToDoListService.motherType+".jpg";
		File ffile = new File(imageFolder,fileName);
		Photo photo = photoService.getPhotoByUid(user.getId());
		photo.setMheadphoto(fileName);
		photoService.updateSelective(photo);
		mImage.transferTo(ffile);
		BufferedImage fimg = ImageUtil.change2jpg(ffile);
		ImageIO.write(fimg, "jpg", ffile);
		
		return "redirect:familyMoments";
	}
	
	@RequestMapping("updatekHeadPhoto")
	public String kHeadPhoto(HttpSession session,MultipartFile kImage) throws IllegalStateException, IOException{
		File imageFolder = new File(session.getServletContext().getRealPath("img/"));
		if (!imageFolder.exists()) {
			imageFolder.mkdirs();
		}
		User user = (User) session.getAttribute("user");
		String fileName=user.getName()+" "+ToDoListService.kidType+".jpg";
		File ffile = new File(imageFolder,fileName);
		Photo photo = photoService.getPhotoByUid(user.getId());
		photo.setKheadphoto(fileName);
		photoService.updateSelective(photo);
		kImage.transferTo(ffile);
		BufferedImage fimg = ImageUtil.change2jpg(ffile);
		ImageIO.write(fimg, "jpg", ffile);
		
		return "redirect:familyMoments";
	}
		
}
