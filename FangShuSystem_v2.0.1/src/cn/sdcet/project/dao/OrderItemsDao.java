package cn.sdcet.project.dao;

public interface OrderItemsDao {

	/**
	 * �ڶ����������Ŀ
	 * @param orderid �������
	 * @param houseid ���ӱ��
	 * @return �Ƿ�ɹ�
	 */
	public boolean setOrderItems(int orderid,int houseid);
	
	
}
