package cn.sdcet.project.dao;

public interface OrderItemsDao {

	/**
	 * 在订单中添加条目
	 * @param orderid 订单编号
	 * @param houseid 房子编号
	 * @return 是否成功
	 */
	public boolean setOrderItems(int orderid,int houseid);
	
	
}
