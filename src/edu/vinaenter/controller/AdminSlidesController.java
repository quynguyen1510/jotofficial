package edu.vinaenter.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.constant.Defines;
import edu.vinaenter.dao.Slides_Dao;
import edu.vinaenter.model.Slides;

@Controller
@RequestMapping("/admin/slides")
public class AdminSlidesController {
	@Autowired
	private Slides_Dao slidesDao;
	@Autowired
	private Defines defines;
	
	@RequestMapping("")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("arItems", slidesDao.getItems());
		return "admin.slides.index";
	}
	
	@RequestMapping(value="/add" , method = RequestMethod.GET)
	public String addItems(ModelMap modelMap) {
		return "admin.slides.add";
	}
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String addItems(HttpServletRequest request,@RequestParam("hinhanh") CommonsMultipartFile img,RedirectAttributes ra) {
		String fileName = img.getOriginalFilename();
		if("".equals(fileName)) {
			ra.addFlashAttribute("error", "Hãy thêm hình ảnh");
			return "redirect:/admin/slides/add";
		}
		String appPath = request.getServletContext().getRealPath("");
		String dirPath = appPath + "uploads";
		File dir = new File(dirPath);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		String headName = "slides_";
		String extendName = FilenameUtils.getExtension(fileName);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		String nameNew = headName + sdf.format(new Date()) + "." + extendName;
		String filePath = dirPath + File.separator + nameNew;
		Slides objSlides = new Slides(0, nameNew);
		if(slidesDao.addItems(objSlides) > 0) {
			try {
				img.transferTo(new File(filePath));
				ra.addFlashAttribute("msg", defines.SUCCESS);
				return "redirect:/admin/slides";
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			ra.addFlashAttribute("msg", defines.ERROR);
			return "redirect:/admin/slides";
		}
		return	"redirect:/admin/slides";
	}
	
	@RequestMapping("/delete/{id_slide}")
	public String delete(HttpServletRequest request,RedirectAttributes ra,ModelMap modelMap,@PathVariable("id_slide") int id_slide) {
		String appPath = request.getServletContext().getRealPath("");
		String dirPath = appPath + "uploads";
		File dir = new File(dirPath);
		String urlDelPicture = dirPath + File.separator + slidesDao.getItem(id_slide).getHinhanh();
		if(!dir.exists()) {
			dir.mkdirs();
		}
		if(slidesDao.deletItem(id_slide) > 0) {
			File delFile = new File(urlDelPicture);
			delFile.delete();
			ra.addFlashAttribute("msg", defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", defines.ERROR);
		}
		return "admin.slides.index";
	}
}
