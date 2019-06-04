package cn.sdcet.project.dao;

import java.util.List;
import cn.sdcet.project.domain.*;

public interface ShopCarDao {
	
	/**
	 * ɾ�����ﳵ��ָ����Ϣ\���㹺�ﳵ
	 * @param userid �û���(��½�˺�)
	 * @param houseid
	 * @return �Ƿ�ɾ���ɹ�
	 */
	public boolean delShopCar(int userid,int houseid);
	
	
	public boolean delShopCar(int houseid);
	/**
	 * ��ӵ����ﳵ
	 * @param houseid ����id
	 * @param userid �û���(��½�˺�)
	 * @return �Ƿ���ӳɹ�
	 */
	public boolean addShopCar(int houseid,int userid);
	
	
	/**
	 * ��ȡ���ﳵ��Ϣ
	 * @param userid �û���(��½�˺�)
	 * @return ���ﳵ��Ϣ
	 */
	public List<House> getShopCar(int userid);
	
	
	public boolean isOrder(int userid,int houseid);
	
	public boolean endOrder(int userid,int houseid);
	
	/**
	 * ��ȡ�����˵�ǰδ����Ķ���
	 * @return
	 */
	public List<House> getHouseInfoOfOrdered(int agentid);
}
