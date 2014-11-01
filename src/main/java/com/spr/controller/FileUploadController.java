package com.spr.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spr.service.FileService;
import com.spr.session.UserSession;

@Controller
@RequestMapping("/file")
public class FileUploadController {

	@Autowired
	private FileService fileService;
	
	@Autowired
	private UserSession userSession;
	
	private static final int BUFFER_SIZE = 4096;
	
	
	@RequestMapping(value = "/download/{projectId}/{filePath}/{format}", method = RequestMethod.GET)
	public void doDownload(@PathVariable Integer projectId,
			@PathVariable String filePath,
			@PathVariable String format,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		String folderFix = "C:\\TCC\\";
//		
		String filePath2 = folderFix+projectId+"\\"+ filePath +"."+format;
		
//		String filePath2 = "C:\\TCC\\2\\Alex_Miratan_Capitulo_5_v_5.docx";

		// get absolute path of the application
		ServletContext context = request.getServletContext();
//		String appPath = context.getRealPath("");
//		System.out.println("appPath = " + appPath);

		// construct the complete absolute path of the file
		String fullPath = filePath2;
		File downloadFile = new File(fullPath);
		FileInputStream inputStream = new FileInputStream(downloadFile);

		// get MIME type of the file
		String mimeType = context.getMimeType(fullPath);
		if (mimeType == null) {
			// set to binary type if MIME mapping not found
			mimeType = "application/octet-stream";
		}
		System.out.println("MIME type: " + mimeType);

		// set content attributes for the response
		response.setContentType(mimeType);
		response.setContentLength((int) downloadFile.length());

		// set headers for the response
		String headerKey = "Content-Disposition";
		String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
		response.setHeader(headerKey, headerValue);

		// get output stream of the response
		OutputStream outStream = response.getOutputStream();

		byte[] buffer = new byte[BUFFER_SIZE];
		int bytesRead = -1;

		// write bytes read from the input stream into the output stream
		while ((bytesRead = inputStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, bytesRead);
		}

		inputStream.close();
		outStream.close();
		
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public @ResponseBody ModelAndView handleFileUpload(@RequestParam(value = "file") CommonsMultipartFile file,
			@RequestParam(value="description", required=false) String description,
			@RequestParam(value="name", required=false) String name,
			@RequestParam(value="projectId", required=false) Integer projectId) {
		if (!file.isEmpty()) {
			
			String filePathToSave = "C:\\TCC\\"+projectId+"\\"+file.getFileItem().getName();
			File folder = new File("C:\\TCC\\"+projectId);
			folder.mkdirs();
			
			byte[] bFile = new byte[(int) file.getSize()];
			try {
				FileInputStream fileInputStream = (FileInputStream) file.getInputStream();
				fileInputStream.read(bFile);
				fileInputStream.close();
				
				File f = new File(filePathToSave);
				f.createNewFile();
				FileOutputStream fileOutputStream = new FileOutputStream(f);
				fileOutputStream.write(bFile);
				fileOutputStream.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			com.spr.model.File fileTCC = new com.spr.model.File();
			fileTCC.setFilePath(filePathToSave);
			fileTCC.setUserCreator(userSession.getUserLogado().getName());
			fileTCC.setDescription(description);
			fileTCC.setNameFile(name);
			fileTCC.setDateCreated(getCurrentDate());
			fileTCC.setProjectId(projectId);
			
			fileService.create(fileTCC);
	 
			ModelAndView mav = new ModelAndView("myProjects");
			mav.setViewName("myProjects");
			return mav;

		}
		//TRATAR SE DER ERRO NO ARQUIVO..
		ModelAndView mav = new ModelAndView("myProjects");
		mav.setViewName("myProjects");
		return mav;
	}
	
	public String getCurrentDate(){
		java.text.DateFormat dateFormat = new java.text.SimpleDateFormat("yyyy/MM/dd");
		java.util.Date date = new java.util.Date();
		String today = dateFormat.format(date);
		String dt[] = today.split("/");
		String ano = dt[0];
		String mes = dt[1];
		String dia = dt[2];
		return dia+"/"+mes+"/"+ano;
	}

}
