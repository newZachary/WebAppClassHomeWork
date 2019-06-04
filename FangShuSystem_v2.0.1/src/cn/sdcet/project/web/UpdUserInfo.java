package cn.sdcet.project.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.sdcet.project.domain.UserInfo;
import cn.sdcet.project.domain.Users;
import cn.sdcet.project.service.UserInfoService;
import cn.sdcet.project.service.UsersService;

public class UpdUserInfo extends HttpServlet {

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

		doPost(request,response);
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

		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		String action=request.getParameter("action");
		if("1".equals(action)){
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String loginid=session.getAttribute("username").toString();
			int gender=Integer.valueOf(request.getParameter("gender"));
			String idcard=request.getParameter("idcard");
			UserInfo userDetail=new UserInfo();
			userDetail.setCardid(idcard);
			userDetail.setEmail(email);
			userDetail.setGender(gender);
			userDetail.setName(name);
			Users user=new Users();
			user.setLoginid(loginid);
			userDetail.setUser(user);
			UserInfoService userInfoService=new UserInfoService();
			userInfoService.updUserInfo(userDetail);
			response.sendRedirect(request.getHeader("referer"));
		}
		else if("2".equals(action))
		{
			String loginId=request.getParameter("phonenum");
			String pwd=request.getParameter("password");
			Users user=new Users();
			user.setLoginid(loginId);
			user.setPwd(pwd);
			UsersService userService=new UsersService();
			if(userService.forgerPwd(user))
			{
				session.setAttribute("username", loginId);
				int id=userService.getNewUserId(loginId);
				session.setAttribute("userid", id);
				String returnUrl=session.getAttribute("returnUrl").toString();
				response.sendRedirect(returnUrl);
			}
		}
		
	}

}
