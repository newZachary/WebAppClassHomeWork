package cn.sdcet.project.service;

import java.util.ArrayList;
import java.util.List;

import cn.sdcet.project.dao.jdbc.ShopCarDaoJDBCImpl;
import cn.sdcet.project.domain.House;
import cn.sdcet.project.util.SqlHelper;

public class ShopCarService {
	/**
	 * ��ȡ���ﳵ��ߵķ�����Ϣ
	 * @param userid �û���
	 * @return �����б�
	 */
	public List<House> getShopCar(int userid) {
		
		List<House> shopCarList=new ArrayList<House>();
		ShopCarDaoJDBCImpl shopCarDao=new ShopCarDaoJDBCImpl();
		shopCarList=shopCarDao.getShopCar(userid);
		return shopCarList;
	}
	
	/**
	 * ��ӵ����ﳵ��
	 * @param houseid ����id
	 * @param userid  �û�id
	 * @return �Ƿ���ӳɹ�
	 */
	public boolean addShopCar(int houseid, int userid) {
		ShopCarDaoJDBCImpl shopCarDao=new ShopCarDaoJDBCImpl();
		return shopCarDao.addShopCar(houseid, userid);
	}
	/**
	 * ɾ��һ�����ﳵ��Ŀ
	 * @param userid �û����
	 * @return �Ƿ�ɹ�
	 */
	public boolean delShopCar(int userid, int houseid) {
		ShopCarDaoJDBCImpl shopCarDao=new ShopCarDaoJDBCImpl();
		return shopCarDao.delShopCar(userid, houseid);
	}
	
	/**
	 * �ǲ����Ѿ�ԤԼ��
	 * @param userid
	 * @param houseid
	 * @return ԤԼ������
	 */
	public boolean isOrder(int userid, int houseid) {
		ShopCarDaoJDBCImpl shopCarDao=new ShopCarDaoJDBCImpl();
		return shopCarDao.isOrder(userid, houseid);
	}
	
	public boolean endOrder(int userid, int houseid) {
		// TODO Auto-generated method stub
		ShopCarDaoJDBCImpl shopCarDao=new ShopCarDaoJDBCImpl();
		return shopCarDao.endOrder(userid, houseid);
	}
}
