package cn.sdcet.project.web;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.sdcet.project.domain.House;
import cn.sdcet.project.domain.Picture;
import cn.sdcet.project.service.PictureService;
import cn.sdcet.project.service.UserInfoService;

public class UploadPic extends HttpServlet {
	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//����ҳ�治����
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		//�����ϴ�״̬��Ϣ
		String message = "";
		HttpSession session = request.getSession();
		UploadStatus status = (UploadStatus) session.getAttribute("status");
		if(status != null) {
			message = status.getCode() + ";" + status.getDescript() + ";" + status.getProgress();		
		}

		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(message);
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.�ļ��ϴ�Ŀ¼����ʱ�ļ�Ŀ¼
		File uploadFile;
		ServletContext sc = getServletContext();
		String houseid=request.getParameter("houseid");
		String action=request.getParameter("action");
		if("pic".equals(action)){
			
			uploadFile = new File(sc.getRealPath("upload/HousePic/")+houseid);
		}
		else{
			uploadFile = new File(sc.getRealPath("upload/userheader"));
		}

		if(!uploadFile.exists()) {
			uploadFile.mkdirs();
		}
		File tempFile = new File(sc.getRealPath("temp"));
		if(!tempFile.exists()) {
			tempFile.mkdirs();
		}

		//2.�����ļ��ϴ�����
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1*1024*1024);//�趨��ֵ������1M�Ľ���д�뵽��ʱ�ļ�
		factory.setRepository(tempFile);//������ʱĿ¼

		//3.�����ϴ��ļ�������
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");//ָ����ȡʱʹ�õ��ַ���
		upload.setSizeMax(100 * 1024 * 1024);//ָ�������ϴ�����
		upload.setFileSizeMax(20*1024*1024);//�趨�����ļ�����ϴ�����

		//����ϴ����ȼ�����
		UploadStatus status = new UploadStatus();
		status.setCode(UploadStatus.STATUS_UPLOADING);
		HttpSession session = request.getSession();
		session.setAttribute("status", status);
		UploadListener listener = new UploadListener(status);
		upload.setProgressListener(listener);
		
		
		List<String> fileNameList =new ArrayList<String>();
		String fileName ="";
		//4.��������
		try {
			List<FileItem> items = upload.parseRequest(request);
			for(FileItem item : items) {
				if(item.isFormField()) { //��ͨ����
					String name = item.getFieldName(); //������
					String value = item.getString("UTF-8"); //��Ҫָ���ַ�����Ӧ�����ύʱһ��
					System.out.println("[��ͨ����] " + name + "=" + value);
				} else {
					//�ϴ��ļ�
					//String fileName = item.getName(); //�ϴ��ļ�������

					String fileContentType = item.getContentType(); //�ϴ��ļ�������
					String fileType=fileContentType.substring(fileContentType.indexOf("/")+1);
					fileName = UUID.randomUUID().toString()+"."+fileType;
					fileNameList.add(fileName);
					long fileSize = item.getSize(); //�ϴ��ļ��Ĵ�С
					System.out.println("[�ϴ��ļ�]" + fileName + ",������" + fileContentType + ",��СΪ" + fileSize + "��");

					//�����ļ�
					//TODO: 1. �����ļ����� �� 2.�ļ��Ĵ�ţ�����ͬһĿ¼�´�Ų�Ҫ����500���ļ�
					File target = new File(uploadFile, fileName);
					item.write(target);
					//�ϴ��ɹ�
					status.setCode(UploadStatus.STATUS_UPLOAD_SUCCESS);
					if("pic".equals(action)){
						PictureService picService=new PictureService();
						Picture pic=new Picture();
						pic.setPicaddress("upload/HousePic/"+houseid+"/"+fileName);
						House house=new House();
						house.setId(Integer.parseInt(houseid));
						pic.setHouseId(house);
						picService.setPicture(pic);
						
					}
					else {
						//�޸����ݿ��û�ͷ����Ϣ
						UserInfoService userinfoService=new UserInfoService();
						int userid=Integer.valueOf( session.getAttribute("userid").toString());
						if(userinfoService.updHead("upload/userheader/"+fileName, userid)){
							response.sendRedirect("DetailInfo/about.jsp");
						}else{
							response.sendRedirect("DetailInfo/about.jsp?msg=0");
						}
					}

				}
			}
			
		} catch (Exception e) {
			status.setCode(UploadStatus.STATUS_UPLOAD_ERROR);
			status.addMessage(e.getMessage());
			e.printStackTrace();
			throw new RuntimeException("�ϴ��ļ�ʧ�ܣ�" + e.getMessage());
		}

	}

}

