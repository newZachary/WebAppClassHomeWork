package cn.sdcet.project.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.sdcet.project.domain.Users;
import cn.sdcet.project.service.UsersService;

public class SignUpServlet extends HttpServlet {

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
		String verify=request.getParameter("verifycode");
		String phonenum=request.getParameter("phonenum");
		HttpSession session=request.getSession();
		String sessionVerify=session.getAttribute("verifyCode").toString();
		if(verify.equalsIgnoreCase(sessionVerify))
		{
			
			String pwd=request.getParameter("password");

			Users user=new Users();
			user.setLoginid(phonenum);
			user.setPwd(pwd);
			UsersService userservice=new UsersService();

			String registinfo=userservice.register(user);
			if("该手机号码已被注册".equals(registinfo)){
				response.sendRedirect("LoginOut/sign-up.jsp?info=1");
			}else if("注册成功".equals(registinfo)){
				int userid=userservice.getNewUserId(phonenum);

				session.setAttribute("username", phonenum);
				session.setAttribute("userid", userid);
				//跳转
				String url= session.getAttribute("returnUrl").toString();
				response.sendRedirect(url);
			}
		}
		else
		{
			response.sendRedirect("LoginOut/sign-up.jsp?info=2&phonenum="+phonenum);
		}
		

	}

}
