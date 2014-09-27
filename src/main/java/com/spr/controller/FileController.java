package com.spr.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.spr.model.File;
import com.spr.service.FileService;

@Controller
@RequestMapping("/file")
public class FileController {

	@Autowired
	private FileService filerService;

	@RequestMapping(method = RequestMethod.POST)
	public Integer createFile(@ModelAttribute File file) {
		filerService.create(file);

		return null;
	}

	@RequestMapping(value = "/allFiles", method = RequestMethod.GET)
	public @ResponseBody List<File> allFiles() {
		return filerService.findAll();
	}

}
