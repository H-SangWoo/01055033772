package org.planngo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.planngo.util.MediaUtils;
import org.planngo.util.UploadFileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class PackageUploadController {

	private static final Logger logger = LoggerFactory.getLogger(PackageUploadController.class);

	@Resource(name = "uploadPath1")
	private String uploadPath;

	/*
	 * !!!!!!!!!!!!!!!!!!! 서버 업로드 path !!!!!!!!!!!!!!!!!!!!!!!!
	 * 
	 * @Resource(name = "uploadPath2") private String uploadPath;
	 */

	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {

		// 한국어 이미지 파일 이름 안깨지게 해줌.
		// String origName = new String(file.getOriginalFilename().getBytes("8859_1"),
		// "UTF-8");

		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("이미지 inputsteam " + file.getInputStream());

		logger.info("이미지 in byte [] " + file.getBytes());

		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
	}

	@ResponseBody
	@RequestMapping("/displayFile")
	// imgsrc =
	// http://localhost:8080/displayFile?fileName=/s_3584fd35-463e-4c19-812c-3eb2b3c803f7_%EC%9D%B4%EC%A0%A0%EC%BB%B4%ED%93%A8%ED%84%B0%ED%95%99%EC%9B%90%20%EB%B0%94%ED%83%95%ED%99%94%EB%A9%B4%20(%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD%20%EC%95%88%EB%82%B4).jpg
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		try {

			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + fileName);

			if (mType != null) {
				headers.setContentType(mType);

			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {

		logger.info("delete file: " + fileName);

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		MediaType mType = MediaUtils.getMediaType(formatName);

		if (mType != null) {

			new File(uploadPath.replace('/', File.separatorChar)).delete();
		}

		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

}
