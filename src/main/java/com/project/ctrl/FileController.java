package com.project.ctrl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
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

import com.project.util.MediaUtils;
import com.project.util.UploadFileHelper;

@Controller
public class FileController {
    private static Logger log = LoggerFactory.getLogger(FileController.class);
    @Resource(name = "uploadPath")
    private String uploadPath;

    @ResponseBody
    @RequestMapping(value = "/uploadAjax",
        method = RequestMethod.POST,
        produces="text/plain;charset=UTF-8")
    public ResponseEntity<String> uploadFile(MultipartFile file) throws IOException, Exception {
        log.info("originalFileName : " + file.getOriginalFilename());
        log.info("size : " + file.getSize());
        log.info("contentType : " + file.getContentType());

        ResponseEntity<String> entity;
        entity = new ResponseEntity<String>(
                UploadFileHelper.makeFileName(
                        uploadPath, 
                        file.getOriginalFilename(), 
                        file.getBytes()),HttpStatus.CREATED);
        return entity;

    }
    
    @ResponseBody
    @RequestMapping(value="/deleteFile", method=RequestMethod.POST)
    public ResponseEntity<String> deleteFile(String fileName){
        log.info(">>> deleteFile() >>>" + fileName);
        String formatName=fileName.substring(fileName.lastIndexOf(".")+1);
        MediaType mType=MediaUtils.getMediaType(formatName);
        
        if(mType != null) {
            String front=fileName.substring(0, 12);
            String end=fileName.substring(14);
            new File(uploadPath+(front+end)
                    .replace('/', File.separatorChar)).delete();
        }
        new File(uploadPath+fileName
                .replace('/', File.separatorChar)).delete();
        return new ResponseEntity<String>("delete_success",HttpStatus.OK);
    }
    
    @ResponseBody
    @RequestMapping("/displayFile")
    public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
        InputStream in=null;
        ResponseEntity<byte[]> entity=null;
        log.info(">>>fileName : " + fileName);
        
        try {
            String formatName=fileName.substring(fileName.lastIndexOf(".")+1);
            MediaType mType=MediaUtils.getMediaType(formatName);
            in=new FileInputStream(uploadPath+fileName);
            
            HttpHeaders headers=new HttpHeaders();
            
            if(mType!=null) {
                headers.setContentType(mType);
            }else {
                fileName=fileName.substring(fileName.indexOf("_")+1);
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                headers.add("Content-Disposition", 
                        "attachment; filename=\""
                        + new String(fileName.getBytes("UTF-8"),
                                "ISO-8859-1")+"\"");
            }
            entity=new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
        } catch (Exception e) {
            log.error("displayFile",e.getStackTrace());
            entity=new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
            in.close();
        }
        return entity;
    }
}
