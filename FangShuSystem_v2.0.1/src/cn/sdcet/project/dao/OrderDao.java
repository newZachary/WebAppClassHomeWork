package cn.sdcet.project.dao;

import java.util.List;

import cn.sdcet.project.domain.*;


public interface OrderDao {


	/**
	 * ��ȡ���û�ȫ������
	 * @param userid �û���(��½�˺�)
	 * @return ���ݱ�š��û�����(ΪNULL��û������)
	 */
	public List<Orders> getAllOrderByUserId(int userid); 
	
	/**
	 * �޸Ķ���״̬
	 * @param orderid ����id
	 * @return �Ƿ�ɹ�
	 */
	public boolean updOrderStatus(int orderid);
	
	/**
	 * ɾ������״̬
	 * @param orderid ����id
	 * @return �Ƿ�ɹ�
	 */
	public boolean delOrderStatus(int orderid);
}
