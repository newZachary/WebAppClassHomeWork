package cn.sdcet.project.dao;


import cn.sdcet.project.domain.HouseDetailInfo;

public interface HouseDetailInfoDao {
	/***
	 * ��ȡ������ϸ��Ϣ
	 * @param houseId ����id
	 * @return ������ϸ��Ϣ
	 */
	public HouseDetailInfo getHouseInfoDetail(int houseId);
	/**
	 * ��ӷ�����ϸ����
	 * @param house 
	 * @return
	 */
	public boolean insertHouseDetailInfo(HouseDetailInfo house);
	/**
	 * ɾ����ϸ��Ϣ
	 * @param houseid
	 * @return
	 */
	public boolean delHouseDetInfo(int houseid);

	
	public boolean updHouseDetailInfo(HouseDetailInfo house);
}
