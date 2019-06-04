package cn.sdcet.project.service;

import java.util.ArrayList;
import java.util.List;

import cn.sdcet.project.dao.jdbc.ShopCarDaoJDBCImpl;
import cn.sdcet.project.domain.House;
import cn.sdcet.project.util.SqlHelper;

public class ShopCarService {
	/**
	 * 获取购物车里边的房子信息
	 * @param userid 用户名
	 * @return 房子列表
	 */
	public List<House> getShopCar(int userid) {
		
		List<House> shopCarList=new ArrayList<House>();
		ShopCarDaoJDBCImpl shopCarDao=new ShopCarDaoJDBCImpl();
		shopCarList=shopCarDao.getShopCar(userid);
		return shopCarList;
	}
	
	/**
	 * 添加到购物车中
	 * @param houseid 房子id
	 * @param userid  用户id
	 * @return 是否添加成功
	 */
	public boolean addShopCar(int houseid, int userid) {
		ShopCarDaoJDBCImpl shopCarDao=new ShopCarDaoJDBCImpl();
		return shopCarDao.addShopCar(houseid, userid);
	}
	/**
	 * 删除一条购物车条目
	 * @param userid 用户编号
	 * @return 是否成功
	 */
	public boolean delShopCar(int userid, int houseid) {
		ShopCarDaoJDBCImpl shopCarDao=new ShopCarDaoJDBCImpl();
		return shopCarDao.delShopCar(userid, houseid);
	}
	
	/**
	 * 是不是已经预约了
	 * @param userid
	 * @param houseid
	 * @return 预约返回真
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
