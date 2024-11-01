package com.ps.tp.utils;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class ImageUtils {
	    private static final String UPLOAD_DIR = "/tpps/comu/imageresource/"; // 저장할 경로 설정

	    public static String saveImage(MultipartFile image) {
	        // 저장할 파일명 생성
	        String fileName = System.currentTimeMillis() + "_" + image.getOriginalFilename();
	        File uploadDir = new File(UPLOAD_DIR);

	        // 디렉토리가 없으면 생성
	        if (!uploadDir.exists()) {
	            uploadDir.mkdirs();
	        }

	        // 파일 객체 생성
	        File file = new File(uploadDir, fileName);
	        try {
	            // 파일 저장
	            image.transferTo(file);
	            // 저장된 파일의 상대 경로 반환
	            return "/imageresource/" + fileName; // 실제 경로에 맞게 수정
	        } catch (IOException e) {
	            e.printStackTrace();
	            return null; // 저장 실패 시 null 반환
	        }
	    }
	}

