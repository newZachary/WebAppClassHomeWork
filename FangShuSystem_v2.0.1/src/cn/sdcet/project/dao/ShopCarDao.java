package cn.sdcet.project.dao;

import java.util.List;
import cn.sdcet.project.domain.*;

public interface ShopCarDao {
	
	/**
	 * 删除购物车内指定信息\结算购物车
	 * @param userid 用户名(登陆账号)
	 * @param houseid
	 * @return 是否删除成功
	 */
	public boolean delShopCar(int userid,int houseid);
	
	
	public boolean delShopCar(int houseid);
	/**
	 * 添加到购物车
	 * @param houseid 房屋id
	 * @param userid 用户名(登陆账号)
	 * @return 是否添加成功
	 */
	public boolean addShopCar(int houseid,int userid);
	
	
	/**
	 * 获取购物车信息
	 * @param userid 用户名(登陆账号)
	 * @return 购物车信息
	 */
	public List<House> getShopCar(int userid);
	
	
	public boolean isOrder(int userid,int houseid);
	
	public boolean endOrder(int userid,int houseid);
	
	/**
	 * 获取代理人当前未处理的订单
	 * @return
	 */
	public List<House> getHouseInfoOfOrdered(int agentid);
}
