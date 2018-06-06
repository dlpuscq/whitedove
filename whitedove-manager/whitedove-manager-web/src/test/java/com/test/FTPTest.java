package com.test;

import java.io.File;
import java.io.FileInputStream;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.junit.Test;

import com.whitedove.common.utils.FtpUtil;

/**
 * @author 作者
 * @version 创建时间：2018年3月21日 下午4:13:07
 * 类说明
 */
public class FTPTest {
	
	@Test
	public void testFtpClient() throws Exception{
		//创建一个FtpClean对象
		FTPClient ftpClient = new FTPClient();
		//创建ftp连接,默认是21
		ftpClient.connect("192.168.1.4",21);
		//登陆ftp服务器，使用用户名和密码
		ftpClient.login("ftpuser", "ftpuser");
		//上传文件
        ftpClient.enterLocalPassiveMode();
		//修改上传文件的格式,二进制格式
		ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
		//读取本地文件
		FileInputStream inputStream = new FileInputStream(new File("E:\\github.png"));
		//设置上传路径
		ftpClient.changeWorkingDirectory("/home/ftpuser/www/images/");
		//第一个参数，服务器端文件名
		//第二个参数，上传文档的inputStream
		ftpClient.storeFile("github.png", inputStream);
		//关闭链接
		ftpClient.logout();
	}
	
	@Test
	public void testFtpUtil() throws Exception {
		
		FileInputStream inputStream = new FileInputStream(new File("E:\\images\\1.png"));
		FtpUtil.uploadFile("192.168.1.4", 21, "ftpuser", "ftpuser", "/home/ftpuser/www/images", "/2018/4/9", "1.png", inputStream);
	}
}
