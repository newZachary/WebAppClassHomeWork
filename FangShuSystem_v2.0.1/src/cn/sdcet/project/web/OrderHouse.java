package cn.sdcet.project.web;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.sdcet.project.service.HouseInfoService;
import cn.sdcet.project.service.ShopCarService;

public class OrderHouse extends HttpServlet {

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
		Object objname=session.getAttribute("username");
		if(objname==null){
			response.sendRedirect("LoginOut/login.jsp");
		}else{
			RequestDispatcher dispatcher=request.getRequestDispatcher("DetailInfo/detail.jsp");
		    int userid=Integer.parseInt(session.getAttribute("userid").toString());
		    int houseid=Integer.parseInt(request.getParameter("houseid"));
		    
		    ShopCarService shopcarService=new ShopCarService();
		    if(!shopcarService.isOrder(userid, houseid)){
		    	 shopcarService.addShopCar(houseid, userid);
		    	 HouseInfoService houseservice=new HouseInfoService();
		    	 houseservice.addHouseOrderCount(houseid);
		    	 request.setAttribute("msg", "预约成功");
				   // response.sendRedirect("DetailInfo/detail.jsp?houseid="+houseid);
		    }
		    else
		    {
		    	
		    	request.setAttribute("msg", "您已经预约过了");
		    }
		    dispatcher.forward(request, response);
		}
	}


}
