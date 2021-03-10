package com.odftest.service;

import java.io.IOException;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;


public interface IFileUtilsService {
	
	public HashMap<String, Object> odfFileInfo(MultipartFile[] files) throws IllegalStateException, IOException;
	public HashMap<String, Object> odfFileTest2(MultipartFile[] files) throws IllegalStateException, IOException;
}
