package org.planngo.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {

		UUID uid = UUID.randomUUID();

		String savedName = uid.toString() + "_" + originalName;

		// new File(String parent, String child): 첫번째 매개변수에 디렉터리의 경로를, 두번째 매개변수에
		// 그 하위 파일명을 지정하여 File 객체를 target 이라는 이름으로 생성.
		File target = new File(uploadPath, savedName);

		// Util copy ==> 바이트로 주어진 내용을 특정한 output file 에 복사한다. UUID 만 붙은 이미지를 경로에저장. 
		FileCopyUtils.copy(fileData, target);

		// 이미지의 확장자 타입만 가지고 있음.
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);

		String uploadedFileName = null;
		
		//파일 확장자가 jpg, gif, png 가 맞으면 
		if (MediaUtils.getMediaType(formatName) != null) {
			uploadedFileName = makeThumnail(uploadPath, savedName);

		} else {
			//파일 확장자가 jpg, gif, png 가 아니면 
			uploadedFileName = makeIcon(uploadPath, savedName);
		}

		return uploadedFileName;
	}

	
	private static String makeThumnail(String uploadPath, String savedName) throws IOException {
		// Returns a BufferedImage as the result of decoding a supplied URL
		// with an ImageReader chosen automatically from among those currently
		// registered.
		// 자동으로 분할된 ImageReader 가 전달된 url 을 해독하여 BuffereedImage 로 리턴을 해준다.
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath, savedName));

		// 디코딩 된 url 을 scalr.resize (src, scalingMethod, resizeMode, targetSize,
		// targetSize, ops);
		/*
		 * 
		 * targetSize = The target width and height (square) that you wish the image to
		 * fit within
		 * 
		 * ops = <code>0</code> or more optional image operations (e.g.sharpen, blur,
		 * etc.) that can be applied to the final result before returning the image.
		 */
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 200);

		// 썸내일 으로 등록된 이미지들은 s_ 가 붙는다.
		//file.sparator = 
		//윈도우는 "data\\ "d.txt"
		//리눅스는 "Data/"d.txt"
		//data + file.separator + d.txt 를 쓰면 됨. 
		String thumbnailName = uploadPath + File.separator + "s_" + savedName;

		// 썸네일 등록된 이미지 URL file 객체화
		File newFile = new File(thumbnailName);

		// 이미지 확장자
		String formatName = savedName.substring(savedName.lastIndexOf(".") + 1);

		// write(rendered image, formatName, output)
		// 이미지를 uploadPath 에 생성한다.
		//!!!!!!!!!!!!!!!!!!!!!!!!이거 uncomment 하면 /s_ 시작하는 이름으로 파일업로드 하나 더됨 !!!!!!!!!!!!!!!!!!!!!!!!!!!
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);

		// ~ /S_파일이름 으로 저장된 이미지 파일 이름만 리턴 
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	
	//확장자가 jpg, gif, png 가 아닌경우 
	private static String makeIcon(String uploadPath, String savedName) {
		
		
		String iconName = uploadPath + File.separator + savedName;
		
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

}
