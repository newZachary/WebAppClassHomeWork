package cn.sdcet.project.web;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.sdcet.project.domain.Users;
import cn.sdcet.project.service.AgentInfoService;
import cn.sdcet.project.service.UsersService;

public class CheckLogin extends HttpServlet {

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
		HttpSession session=request.getSession();
		response.setContentType("text/html");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		Object actionObj=session.getAttribute("action");
		String action="";
		if(actionObj!=null){
			action=actionObj.toString();
		}
		//manager登陆
		if("manager".equals(action) )
		{
			//获取设置好的manager密码
			ServletContext sc=getServletContext();
			String path=sc.getRealPath("Manager/config.properties");
			FileInputStream fis=new FileInputStream(path);
			Properties ps=new Properties();
			ps.load(fis);
			String nameConf=ps.get("username").toString();
			String pwdConf=ps.get("password").toString();
			
			if(username.equals(nameConf)&&password.equals(pwdConf)){
				//跳转
				session.setAttribute("isManager", 1);
				String url= "Manager/index.jsp";
				response.sendRedirect(url);
			}else
			{
				
				String url="LoginOut/login.jsp?msg=1&times=2";
				response.sendRedirect(url);	
			}
		}
		else{
			//用户登陆
			Users user=new Users();
			user.setLoginid(username);
			user.setPwd(password);
			UsersService uservice=new UsersService();
			if(uservice.login(user)){
				int userid=uservice.getNewUserId(username);
				AgentInfoService agentService=new AgentInfoService();
				boolean isagent=agentService.isAgent(userid);
				//存到session中
				
				session.setAttribute("username", username);
				session.setAttribute("userid", userid);
				session.setAttribute("isagent", isagent);
				session.getAttribute("isagent");
			
				
				//跳转
				Object urlobj= session.getAttribute("returnUrl");
				
				if(urlobj==null){
					response.sendRedirect("http://localhost:8080/project/FirstFront/index.jsp");
				}
				else
				{
					response.sendRedirect(urlobj.toString());
				}
			}else{
				
				session.removeAttribute("username");
				session.removeAttribute("userid");
				session.removeAttribute("isagent");
				//String url=session.getAttribute("returnUrl").toString()+"&msg=1";
				String url="LoginOut/login.jsp?msg=1&times=2";
				response.sendRedirect(url);	

			}
		}
	}

}
