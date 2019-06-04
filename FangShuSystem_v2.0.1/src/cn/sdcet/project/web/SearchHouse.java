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

import cn.sdcet.project.domain.House;
import cn.sdcet.project.service.HouseInfoService;

public class SearchHouse extends HttpServlet {

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
		//request.setCharacterEncoding("utf-8");
		int action=Integer.parseInt(request.getParameter("action"));
		
		String address=request.getParameter("address");
		String question=request.getParameter("question");
		int currentpage=Integer.parseInt( request.getParameter("currentpage"));
		List<House> houseList=new ArrayList<House>();
		int recordCount=0;
		HouseInfoService house = new HouseInfoService();
		switch(action)
		{
		case 1:
			houseList=house.getHouseInfoRough(address,currentpage);
			recordCount=house.getHouseInfoRough(address);
			break;
		case 2:
			houseList=house.getHouseInfoRoughByVagueName(question, address,currentpage);
			recordCount=house.getHouseInfoRoughByVagueName(question, address);
			break;
		case 3:
			houseList=house.getHouseInfoRoughByVagueArea(Integer.parseInt(question), address,currentpage);
			recordCount=house.getHouseInfoRoughByVagueArea(Integer.parseInt(question), address);
			break;
		case 4:
			houseList=house.getHouseInfoRoughByVagueAddress(question,address,currentpage);
			recordCount=house.getHouseInfoRoughByVagueAddress(question, address);
			break;
		case 5:
			houseList=house.getHouseInfoRoughByVagueAgent(question, address,currentpage);
			recordCount=house.getHouseInfoRoughByVagueAgent(question, address);
			break;
		default:
			break;
		}

		request.setAttribute("houseList", houseList);
		request.setAttribute("recordCount", recordCount);
		request.setAttribute("question", question);
		//request.setAttribute("action", action);
		RequestDispatcher dispatcher=request.getRequestDispatcher("/SearchResult/resultinfo.jsp");
		dispatcher.forward(request, response);
	}

}
