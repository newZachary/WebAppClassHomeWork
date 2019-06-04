package cn.sdcet.project.dao;

import java.util.List;

import cn.sdcet.project.domain.*;


public interface OrderDao {


	/**
	 * 获取该用户全部订单
	 * @param userid 用户名(登陆账号)
	 * @return 房屋编号、用户评论(为NULL则没有评论)
	 */
	public List<Orders> getAllOrderByUserId(int userid); 
	
	/**
	 * 修改订单状态
	 * @param orderid 订单id
	 * @return 是否成功
	 */
	public boolean updOrderStatus(int orderid);
	
	/**
	 * 删除订单状态
	 * @param orderid 订单id
	 * @return 是否成功
	 */
	public boolean delOrderStatus(int orderid);
}
