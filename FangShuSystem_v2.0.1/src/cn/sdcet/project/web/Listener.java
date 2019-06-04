package cn.sdcet.project.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import cn.sdcet.project.service.ConfService;
public class Listener extends HttpServlet implements HttpSessionListener {
	//public static int count=500;
	@Override
	public void sessionCreated(HttpSessionEvent hse) {
		// TODO Auto-generated method stub
		//count++;
		//ServletContext context = hse.getSession().getServletContext();
		//context.setAttribute("count", new Integer(count));
		//context.log("当前在线人数：" + count + "人");
		ConfService conf=new ConfService();
		conf.updVisitCount();
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		
	}

}
