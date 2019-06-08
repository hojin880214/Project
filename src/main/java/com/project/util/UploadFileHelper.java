package com.project.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileHelper {
    private static Logger log = LoggerFactory.getLogger(UploadFileHelper.class);

    public static String makeFileName(String uploadPath,String originalName, byte[] fileData) throws Exception{
        UUID uuid=UUID.randomUUID();
        
        String saveName=uuid.toString()+"_"+originalName;
        String savePath=calcPath(uploadPath);
       
        File targetObj=new File(uploadPath+savePath,saveName);
        FileCopyUtils.copy(fileData, targetObj);
        
        String formatName
        =originalName.substring(originalName.lastIndexOf(".")+1);
        String uploadFileName=null;
        
        if(MediaUtils.getMediaType(formatName)!=null) {
            uploadFileName
            =makeThumbNail(uploadPath,savePath,saveName);
        }else {
            uploadFileName
            =makeFileIcon(uploadPath,savePath,saveName);
        }
                
        return uploadFileName;
    }

    private static String makeFileIcon(String uploadPath, String savePath, String saveName) {
        String iconName=uploadPath+savePath+File.separator+saveName;
        return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
    }

    private static String makeThumbNail(String uploadPath, String savePath, String saveName) throws Exception{
        BufferedImage srcImg
            =ImageIO.read(new File(uploadPath+savePath,saveName));
        BufferedImage destImg
            =Scalr.resize(srcImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 150,150);
        String thumbNailName=uploadPath+savePath+File.separator+"s_"+saveName;
        
        File newFile=new File(thumbNailName);
        String formatName=saveName.substring(saveName.lastIndexOf(".")+1);
        
        ImageIO.write(destImg, formatName.toUpperCase(), newFile);
        return thumbNailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
    }

    private static String calcPath(String uploadPath) {
        Calendar cal=Calendar.getInstance();
        String yearPath=File.separator+cal.get(Calendar.YEAR);
        String monthPath=yearPath
                +File.separator
                +new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
        String datePath=monthPath
                +File.separator
                +new DecimalFormat("00").format(cal.get(Calendar.DATE));
        makeDir(uploadPath,yearPath,monthPath,datePath);
        log.info("datePath : "+datePath);
        return datePath;
    }

    private static void makeDir(String uploadPath, String... paths) {
        if(new File(paths[paths.length-1]).exists()) {
            return;
        }
        for(String path: paths) {
            File dirPath = new File(uploadPath+path);
            if(!dirPath.exists()) {
                dirPath.mkdir();
            }
        }
    }
}
