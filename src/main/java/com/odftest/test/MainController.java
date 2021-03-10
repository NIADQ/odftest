package com.odftest.test;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.odftest.service.FileUtilsService;

@Controller
@RequestMapping("/")
public class MainController {
	
	@Autowired 
	private FileUtilsService service;

	@RequestMapping("")
	public String main(){
		return "home";
	}
	
	@RequestMapping("odftest_hwp")
	public String odftest_hwp(){
		return "odf_test_page_hwp";
	}
	@RequestMapping("odftest_manual")
	public String odftest_manual(){
		return "odftest_manual";
	}
	
	//hwp
	// 파일선택
	@RequestMapping(value = "odfFileSelect_hwp", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> odfFileSelect_hwp(@RequestParam("fileupload") MultipartFile[] files,
		      Model model) throws Exception{
		
		HashMap<String, Object> result = service.odfFileInfo(files);
	
		return result;
	}
	
	// 파일진단
	@RequestMapping(value = "odfFileTestStart_hwp", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> odfFileTestStart_hwp2(@RequestParam("fileupload") MultipartFile[] files,
			Model model) throws Exception{
		
		HashMap<String, Object> result = service.odfFileTest2(files);
		
		return result;
	}
}
