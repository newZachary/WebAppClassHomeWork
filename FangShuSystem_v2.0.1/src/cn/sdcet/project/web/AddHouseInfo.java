package cn.sdcet.project.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.sdcet.project.domain.House;
import cn.sdcet.project.domain.HouseDetailInfo;
import cn.sdcet.project.domain.UserInfo;
import cn.sdcet.project.domain.Users;
import cn.sdcet.project.service.HouseInfoService;

public class AddHouseInfo extends HttpServlet {

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
		
		request.setCharacterEncoding("utf-8");
		
		String housename=request.getParameter("housename");
		String address=request.getParameter("address");
		String addressdet=request.getParameter("addressdet");
		String pri=request.getParameter("price");
		double price=Double.parseDouble(pri);
		String housetype=request.getParameter("housetype");
		String are=request.getParameter("area");
		int area=Integer.parseInt(are);
		String fp=request.getParameter("firstpay");
		int firstpay=Integer.parseInt(fp);
		String agid=request.getParameter("agentid");
		int agentid=Integer.parseInt(agid);
		//String uploadimg=request.getParameter("uploadimg");
		String time=request.getParameter("time");
		String resfac=request.getParameter("resfac");
		String decdeg=request.getParameter("decdeg");
		String serviceintro=request.getParameter("serviceintro");
		String corepoint=request.getParameter("corepoint");
		String describe=request.getParameter("describe");
		
		if(housename!=null&&addressdet!=null&&pri!=null&&are!=null){
			House house=new House();
			house.setName(housename);
			//house.setOnePicAdd(uploadimg);
			house.setPrice(price);
			house.setHousetype(housetype);
			house.setArea(area);
			house.setH_address(address);
			
			HouseDetailInfo houseinfo=new HouseDetailInfo();
			houseinfo.setH_addressdel(addressdet);
			houseinfo.setFristpay(firstpay);
			
			//agentid
			Users users=new Users();
			users.setId(agentid);
			UserInfo userinfo=new UserInfo();
			userinfo.setUser(users);
			houseinfo.setAgent(userinfo);
			
			houseinfo.setTime(time);
			//houseid
			
			//houseinfo.setHouse(House house);
			houseinfo.setCorepoint(corepoint);
			houseinfo.setDescribe(describe);
			houseinfo.setResfac(resfac);
			houseinfo.setServiceintro(serviceintro);
			houseinfo.setDecdeg(decdeg);
			
			HouseInfoService info=new HouseInfoService();
			boolean falg=info.addHouseInfo(house,houseinfo);
			if(falg)
			{
				int houseid=info.getNewHouseId();
				HttpSession session=request.getSession();
				session.setAttribute("houseid", houseid);
				//response.sendRedirect("Manager/uploadPicture.jsp?houseid="+houseid);
			}
			else{
				response.sendRedirect("Manager/addhouse.jsp?info=1");
			}
		}else{
			response.sendRedirect("Manager/addhouse.jsp?info=1");
		}
		
	}

}
