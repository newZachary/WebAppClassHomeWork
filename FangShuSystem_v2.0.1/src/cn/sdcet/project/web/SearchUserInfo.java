package cn.sdcet.project.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.sdcet.project.domain.UserInfo;
import cn.sdcet.project.service.UserInfoService;

import com.google.gson.Gson;


public class SearchUserInfo extends HttpServlet {

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

		doPost(request, response);
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

		String phonenum=request.getParameter("phonenum");
		phonenum=phonenum.trim();
		UserInfoService infoService=new UserInfoService();
		UserInfo userInfo = infoService.getUserInfo(phonenum);
		List<UserInfo> list=new ArrayList<UserInfo>();
		
		list.add(userInfo);
		Gson gson = new Gson();
        //在这里转化成json
        String json =gson.toJson(list);
        System.out.print(json);
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().println(json);
		
	}

}
