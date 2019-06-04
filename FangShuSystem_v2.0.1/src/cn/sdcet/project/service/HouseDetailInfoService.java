package cn.sdcet.project.service;

import cn.sdcet.project.dao.jdbc.HouseDetailInfoDaoJDBCImpl;
import cn.sdcet.project.dao.jdbc.HouseInfoJDBCImpl;
import cn.sdcet.project.domain.HouseDetailInfo;

public class HouseDetailInfoService {
	public HouseDetailInfo getHouseInfoDetail(int houseId) {
		HouseDetailInfoDaoJDBCImpl houdetDao=new HouseDetailInfoDaoJDBCImpl();
		return houdetDao.getHouseInfoDetail(houseId);
	}	
	public boolean updHouseInfo(HouseDetailInfo houseDetail) {
		HouseDetailInfoDaoJDBCImpl houdetDao=new HouseDetailInfoDaoJDBCImpl();
		HouseInfoJDBCImpl houDao=new HouseInfoJDBCImpl();
		return houdetDao.updHouseDetailInfo(houseDetail)&&houDao.updHouse(houseDetail.getHouse());
	}
}
