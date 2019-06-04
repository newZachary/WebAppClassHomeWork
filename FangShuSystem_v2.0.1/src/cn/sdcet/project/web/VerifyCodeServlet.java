package cn.sdcet.project.web;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VerifyCodeServlet extends HttpServlet {
	public static final char[] CHARS = { '2', '3', '4', '5', '6', '7', '8',
			'9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M',
			'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
	public static int IMAGE_WIDTH = 100;
	public static int IMAGE_HEIGHT = 30;
	public static int NOISE_MAX_NUM = 50;
	
	private Random random = new Random();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//������Ӧ����
		response.setContentType("image/png");
		
		//����ҳ�治����ͼƬ
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		
		//��������ַ���
		String verifyCode = getRandomString();
		//TODO:������ַ��������ڷ�������Session
		HttpSession session=request.getSession();
		session.setAttribute("verifyCode", verifyCode);
		//������֤��ͼƬ
		BufferedImage image = new BufferedImage(IMAGE_WIDTH, IMAGE_HEIGHT, BufferedImage.TYPE_INT_RGB);
		Graphics graphics = image.getGraphics();
		
		//1.��䱳��
		Color color = getRandomColor();
		graphics.setColor(color);
		graphics.fillRect(0, 0,	IMAGE_WIDTH, IMAGE_HEIGHT);
		//2.��������ַ���
		Color reverseColor = getReverseColor(color);
		graphics.setColor(reverseColor);
		graphics.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
		graphics.drawString(verifyCode, 18, 20);
		//3.����������
		//for(int i=0;i<NOISE_MAX_NUM;i++) {
		//	graphics.drawRect(random.nextInt(IMAGE_WIDTH), random.nextInt(IMAGE_HEIGHT), 1, 1);
		//}
		
		graphics.dispose();
		
		//�����֤��ͼƬ���ͻ���
		ServletOutputStream outputStream = response.getOutputStream();
		ImageIO.write(image, "PNG", outputStream);
	}

	/**
	 * ���������ɫ
	 * @return
	 */
	private Color getRandomColor() {
		return new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
	}
	
	/**
	 * �õ�ָ����ɫ�ķ�תɫ
	 * @param c
	 * @return
	 */
	private Color getReverseColor(Color c) {
		return new Color(255-c.getRed(),255-c.getGreen(),255-c.getBlue());
	}
	
	/**
	 * ��������ַ���
	 * @return
	 */
	private String getRandomString() {
		StringBuffer buffer = new StringBuffer();
		for(int i=0;i<5;i++) {
			buffer.append(CHARS[random.nextInt(CHARS.length)]);
		}
		return buffer.toString();
	}
}
