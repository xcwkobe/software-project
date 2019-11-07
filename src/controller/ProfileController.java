package controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import pojo.Profile;
import pojo.User;
import service.ProfileService;
import util.ImageUtil;
import util.UploadedImageFile;

@Controller
public class ProfileController {
	
	@Autowired
	ProfileService profileService;
	
	@RequestMapping("userProfile")
	public String userProfile(Model model,@RequestParam("uid") Integer id){
		Profile profile = profileService.getProfileByUser(id);
		model.addAttribute("profile", profile);
		model.addAttribute("userID", id);
		return "userProfile";
	}
	
	@RequestMapping("updateProfile")
	public String update(Profile profile,Integer uid) throws IllegalStateException, IOException {
		if (null==profileService.getProfileByUser(uid)) {
			profileService.addProfile(profile);
		}
		profileService.updateProfileBySelective(profile);
		return "redirect:userProfile?uid="+uid;
	}
	
	@RequestMapping("updateFamPhoto")
	public String updateFamPhoto(Integer uid,MultipartFile image,HttpSession session) throws IllegalStateException, IOException{
		File imageFolder = new File(session.getServletContext().getRealPath("img/"));
		if (!imageFolder.exists()) {
			imageFolder.mkdirs();
		}
		File file = new File(imageFolder,"No "+uid+".jpg");
		String familyPhoto="No "+uid+".jpg";
		Profile profile = profileService.getProfileByUser(uid);
		if (null==profileService.getProfileByUser(uid)) {
			profile = new Profile();
			profile.setUid(uid);
			profileService.addProfile(profile);
		}
		profile.setHeadphoto(familyPhoto);
		profileService.updateProfileBySelective(profile);
		image.transferTo(file);
		BufferedImage img = ImageUtil.change2jpg(file);
		ImageIO.write(img, "jpg", file);
		return "redirect:userProfile?uid="+uid;
	}
	
}
