package com.spr.service;

import java.util.List;
import com.spr.model.File;

public interface FileService {
	
	public File create(File file);
	public File delete(int id);
	public List<File> findAll();
	public File update(File file);
	public File findById(int id);

}
