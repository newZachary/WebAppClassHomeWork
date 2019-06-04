package cn.sdcet.project.dao.jdbc;



import java.util.*;

import cn.sdcet.project.dao.HouseDetailInfoDao;
import cn.sdcet.project.domain.*;
import cn.sdcet.project.util.SqlHelper;

public class HouseDetailInfoDaoJDBCImpl implements HouseDetailInfoDao {

	@Override
	public HouseDetailInfo getHouseInfoDetail(int houseId) {
		// TODO Auto-generated method stub
		HouseDetailInfo houseInfo=new HouseDetailInfo();

		String sql="SELECT u.LOGINID,h.AREA,h.PRICE,h.HOUSETYPE,h.name as HOUSENAME,h.H_ADDRESS as H_ADDRESS,hd.HOUSEID," +
				"hd.AGENTID,hd.FRISTPAY,hd.TIME,hd.H_ADDRESSDEL,hd.COREPOINT,hd.DESCRIBE," +
				"hd.RESFAC,hd.SERVICEINTRO,hd.DECDEG,U.loginId,UI.* " +
				"from HOUSE h INNER JOIN HOUSEDETAILINFO hd on h.ID=HD.HOUSEID " +
				"inner join agentinfo ai on ai.id=hd.agentid " +
				"INNER JOIN USERS u on U.id=ai.agentid " +
				"INNER JOIN USERINFO ui on UI.UserId=U.id where hd.houseId=?";
		List<Object> params=new ArrayList<Object>();
		params.add(houseId);
		Map<String, Object> map = new HashMap<String, Object>();
		map=SqlHelper.returnSimpleResult(sql, params);
		if(map.size()>0){
			
			Users user=new Users();
			user.setLoginid(map.get("LOGINID").toString());

			UserInfo agent=new UserInfo();
			agent.setCardid(map.get("CARDID").toString());
			agent.setContact(map.get("CONTACT").toString());
			agent.setEmail(map.get("EMAIL").toString());
			agent.setGender(Integer.valueOf(map.get("GENDER").toString()));
			agent.setHead(map.get("HEAD").toString());
			agent.setId(Integer.valueOf(map.get("ID").toString()));
			agent.setName(map.get("NAME").toString());
			agent.setUser(user);

			House house=new House();
			house.setId(Integer.valueOf(map.get("HOUSEID").toString()));
			house.setArea(Integer.valueOf(map.get("AREA").toString()));
			house.setH_address(map.get("H_ADDRESS").toString());
			house.setHousetype(map.get("HOUSETYPE").toString());
			house.setName(map.get("HOUSENAME").toString());
			house.setPrice(Double.valueOf(map.get("PRICE").toString()));

			houseInfo.setAgent(agent);
			houseInfo.setHouse(house);
			houseInfo.setCorepoint(map.get("COREPOINT").toString());
			houseInfo.setDecdeg(map.get("DECDEG").toString());
			houseInfo.setDescribe(map.get("DESCRIBE").toString());
			houseInfo.setFristpay(Double.valueOf(map.get("FRISTPAY").toString()));
			houseInfo.setH_addressdel(map.get("H_ADDRESSDEL").toString());
			houseInfo.setResfac(map.get("RESFAC").toString());
			houseInfo.setServiceintro(map.get("SERVICEINTRO").toString());
			houseInfo.setTime(map.get("TIME").toString());
		}
		return houseInfo;
	}
	
	@Override
	public boolean insertHouseDetailInfo(HouseDetailInfo houseDet) {
		// TODO Auto-generated method stub
		String sql="INSERT INTO HOUSEDETAILINFO(HOUSEID,AGENTID,FRISTPAY,TIME,H_ADDRESSDEL,COREPOINT,DESCRIBE,RESFAC,SERVICEINTRO,DECDEG)"
+"VALUES(?,?,?,'2019-02-05',?,?,?,?,?,?)";
		List<Object> params =new ArrayList<Object>();
		
		params.add(houseDet.getHouse().getId());
		params.add(houseDet.getAgent().getUser().getId());
		params.add(houseDet.getFristpay());
		//params.add(houseDet.getTime());
		params.add(houseDet.getH_addressdel());
		params.add(houseDet.getCorepoint());
		params.add(houseDet.getDescribe());
		params.add(houseDet.getResfac());
		params.add(houseDet.getServiceintro());
		params.add(houseDet.getDecdeg());
		
		return SqlHelper.Execute(sql, params);
	}

	@Override
	public boolean updHouseDetailInfo(HouseDetailInfo house) {
		// TODO Auto-generated method stub
		String sql="update HouseDetailInfo set " +
				"FRISTPAY=?, AGENTID=?, TIME=?, H_ADDRESSDEL=?, COREPOINT=?, DESCRIBE=?, RESFAC=?, SERVICEINTRO=?, DECDEG=? where houseid=?";
		List<Object> params =new ArrayList<Object>();
		params.add(house.getFristpay());
		params.add(house.getAgent().getUser().getId());
		params.add(house.getTime());
		params.add(house.getH_addressdel());
		params.add(house.getCorepoint());
		params.add(house.getDescribe());
		params.add(house.getResfac());
		params.add(house.getServiceintro());
		params.add(house.getDecdeg());
		params.add(house.getHouse().getId());
		return SqlHelper.Execute(sql, params);
		
		
	}
	@Override
	public boolean delHouseDetInfo(int houseid) {
		// TODO Auto-generated method stub
		String sql="delete from houseDetailInfo where houseid=? ";
		List<Object> params =new ArrayList<Object>();
		params.add(houseid);
		return SqlHelper.Execute(sql, params);
	}

	
}
