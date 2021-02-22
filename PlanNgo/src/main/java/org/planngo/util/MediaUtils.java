package org.planngo.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

//이미지파일 이미지 확장자 구분 하기위해만듦
public class MediaUtils {

	private static Map <String, MediaType> mediaMap;
	
	//mediaMap 에 
	static {
		
		mediaMap = new HashMap<String , MediaType> ();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	
		
	}
	
	//UploadFileUtils 에서 불르면 이미지파일의 확장자를 가져옴
	public static MediaType getMediaType(String type) {
		return mediaMap.get(type.toUpperCase());		
	}
}
