package cn.sdcet.project.web;


import java.io.UnsupportedEncodingException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;



public class MyRequestWrapper extends HttpServletRequestWrapper {
	
	private HttpServletRequest request;

	public MyRequestWrapper(HttpServletRequest request) {
		super(request);
		this.request = request;
	}

	@Override
	public String getParameter(String name) {
		String value = request.getParameter(name);
		try {
			if(value!=null)
			{
				value = new String(value.getBytes("ISO-8859-1"), "UTF-8");
				
				
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return value;
	}

	@Override
	public String[] getParameterValues(String name) {
		String[] values = request.getParameterValues(name);
		for(int i=0;i<values.length;i++) {
			try {
				if(values[i]!=null)
				{
					values[i] = new String(values[i].getBytes("ISO-8859-1"),"UTF-8");
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		return values;
	}
}
