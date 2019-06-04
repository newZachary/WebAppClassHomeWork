package cn.sdcet.project.dao.jdbc;

import java.util.*;

import cn.sdcet.project.dao.ShopCarDao;
import cn.sdcet.project.domain.House;

import cn.sdcet.project.util.SqlHelper;

public class ShopCarDaoJDBCImpl implements ShopCarDao {

	@Override
	public boolean delShopCar(int userid, int houseid) {
		// TODO Auto-generated method stub
		String sql="delete from shopcar where houseid=? and userid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(houseid);
		params.add(userid);
		
		return SqlHelper.Execute(sql, params);
	}
	

	@Override
	public boolean addShopCar(int houseid, int userid) {
		// TODO Auto-generated method stub
		String sql="insert into shopcar(houseid,userid) values(?,?)";
		List<Object> params=new ArrayList<Object>();
		params.add(houseid);
		params.add(userid);
		return SqlHelper.Execute(sql, params);
		
	}

	@Override
	public List<House> getShopCar(int userid) {
		// TODO Auto-generated method stub
		List<House> shopCarList=new ArrayList<House>();
		HouseInfoJDBCImpl houseDao=new HouseInfoJDBCImpl();
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		String sql="select HOUSEID from shopcar where userid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(userid);
		list=SqlHelper.returnMultipleResult(sql, params);
		if(list.size()>0)
		{
			for(Map<String,Object> map:list)
			{
				House house=new House();
				
				house = houseDao.getHouseInfoRoughById(Integer.valueOf(map.get("HOUSEID").toString()));
				shopCarList.add(house);
			}
			
		}
		return shopCarList;
	}

	@Override
	public boolean isOrder(int userid, int houseid) {
		// TODO Auto-generated method stub
		List<Object> params =new ArrayList<Object>();
		String  sql="select count(*) as COUNT from ShopCar  where userid=? and houseid=?";
		boolean flag=false;
		params.add(userid);
		params.add(houseid);
		Map<String,Object> count=SqlHelper.returnSimpleResult(sql, params);
		if(count.size()>0){
			if(Integer.parseInt(count.get("COUNT").toString())==1){
				flag=true;
			}
		}
		return flag;
		
	}


	@Override
	public boolean delShopCar(int houseid) {
		// TODO Auto-generated method stub
		String sql="delete from shopcar where houseid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(houseid);
		return SqlHelper.Execute(sql, params);
	}


	@Override
	public boolean endOrder(int userid, int houseid) {
		// TODO Auto-generated method stub
		String sql="update shopcar set status=1 where houseid=? and userid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(houseid);
		params.add(userid);
	
		
		return SqlHelper.Execute(sql, params);
	}


	@Override
	public List<House> getHouseInfoOfOrdered(int agentid) {
		String sql="exec proc_agent_house_order ?";
		List<Object> params=new ArrayList<Object>();
		params.add(agentid);
		
		
		
		return null;
	}

}
