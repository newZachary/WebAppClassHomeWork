package cn.sdcet.project.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.sdcet.project.service.ShopCarService;

public class delthing extends HttpServlet {

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
		
		
		HttpSession session= request.getSession();
		int houseid=Integer.valueOf(request.getParameter("houseid"));
		int userid=Integer.valueOf(session.getAttribute("userid").toString());
		String action =request.getParameter("action");
		ShopCarService shopcarserver=new ShopCarService();
		if("u".equals(action)){
			
			shopcarserver.delShopCar(userid, houseid);
			response.sendRedirect("DetailInfo/OrderHouse.jsp");	
		}
		else if("a".equals(action)){
			shopcarserver.endOrder(userid, houseid);
			response.sendRedirect("DetailInfo/AgentHouse.jsp");	
		}
		
	}

}
