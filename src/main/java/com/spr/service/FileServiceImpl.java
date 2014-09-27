package com.spr.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spr.model.File;
import com.spr.repository.FileRepository;

@Service
public class FileServiceImpl implements FileService {
	
	@Resource
	private FileRepository fileRepository;

	@Override
	public File create(File file) {
		return fileRepository.save(file);
	}

	@Override
	public File delete(int id) {
		fileRepository.delete(id);
		return null;
	}

	@Override
	public List<File> findAll() {
		return fileRepository.findAll();
	}

	@Override
	public File update(File file) {
		return fileRepository.saveAndFlush(file);
	}

	@Override
	public File findById(int id) {
		return fileRepository.findOne(id);
	}

}
