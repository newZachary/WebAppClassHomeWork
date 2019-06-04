package cn.sdcet.project.dao;


import cn.sdcet.project.domain.HouseDetailInfo;

public interface HouseDetailInfoDao {
	/***
	 * 获取房屋详细信息
	 * @param houseId 房子id
	 * @return 房屋详细信息
	 */
	public HouseDetailInfo getHouseInfoDetail(int houseId);
	/**
	 * 添加房屋详细数据
	 * @param house 
	 * @return
	 */
	public boolean insertHouseDetailInfo(HouseDetailInfo house);
	/**
	 * 删除详细信息
	 * @param houseid
	 * @return
	 */
	public boolean delHouseDetInfo(int houseid);

	
	public boolean updHouseDetailInfo(HouseDetailInfo house);
}
