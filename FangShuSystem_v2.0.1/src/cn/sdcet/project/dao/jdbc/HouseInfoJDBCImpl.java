package cn.sdcet.project.dao.jdbc;

import java.util.*;

import cn.sdcet.project.dao.HouseDao;
import cn.sdcet.project.domain.House;
import cn.sdcet.project.util.SqlHelper;

public class HouseInfoJDBCImpl implements HouseDao {

	@Override
	public int getHouseInfoRough(String address) {
		// TODO Auto-generated method stub

		String sql="select count(*) as COUNT from House where H_address=? and flag=1";
		int count = 0;
		List<Object> params =new ArrayList<Object>();
		params.add(address);
		Map<String,Object> map = new HashMap<String,Object>();
		map=SqlHelper.returnSimpleResult(sql, params);

		if(map.size()>0)
		{
			count=Integer.parseInt( map.get("COUNT").toString());
		}
		return count;
	}


	@Override
	public House getHouseInfoRoughById(int houseid) {
		// TODO Auto-generated method stub
		House house=new House();

		String sql="select * from House where id=?";
		List<Object> params =new ArrayList<Object>();
		params.add(houseid);
		Map<String,Object> map = new HashMap<String,Object>();
		map=SqlHelper.returnSimpleResult(sql, params);
		if(map.size()>0)
		{

			house=toHouse(map);

		}

		return house;
	}

	@Override
	public int getHouseInfoRoughByVagueAddress(String VAddress,String address) {
		// TODO Auto-generated method stub

		String sql="select count(*)as COUNT from HouseDetailInfo hi inner join House h on hi.houseid=h.id " +
				"where hi.H_ADDRESSDEL like ? and h.H_ADDRESS=? ";
		int count = 0;
		List<Object> params =new ArrayList<Object>();
		params.add("%"+VAddress+"%");
		params.add(address);
		Map<String,Object> map = new HashMap<String,Object>();
		map=SqlHelper.returnSimpleResult(sql, params);

		if(map.size()>0)
		{
			count=Integer.parseInt( map.get("COUNT").toString());
		}
		return count;

	}

	@Override
	public int getHouseInfoRoughByVagueName(String VName, String address) {
		// TODO Auto-generated method stub
		int count = 0;
		String sql="select count(*) as COUNT from HouseDetailInfo hi inner join House h on hi.houseid=h.id where h.name like ? and h.H_ADDRESS=? ";
		List<Object> params =new ArrayList<Object>();
		params.add("%"+VName+"%");
		params.add(address);
		Map<String,Object> map = new HashMap<String,Object>();
		map=SqlHelper.returnSimpleResult(sql, params);

		if(map.size()>0)
		{
			count=Integer.parseInt( map.get("COUNT").toString());
		}
		return count;
	}

	@Override
	public int getHouseInfoRoughByVagueArea(double VArea, String address) {
		// TODO Auto-generated method stub
		int count = 0;
		double maxArea=VArea+25;
		double minArea=VArea-25;
		String sql="select count(*) as COUNT from HouseDetailInfo hi inner join House h on hi.houseid=h.id where h.area>? and h.area <? and h.H_ADDRESS=? ";
		List<Object> params =new ArrayList<Object>();
		params.add(minArea);
		params.add(maxArea);
		params.add(address);
		Map<String,Object> map = new HashMap<String,Object>();
		map=SqlHelper.returnSimpleResult(sql, params);
		if(map.size()>0)
		{
			count=Integer.parseInt( map.get("COUNT").toString());
		}
		return count;
	}

	@Override
	public int getHouseInfoRoughByVagueAgent(String agentName, String address) {
		// TODO Auto-generated method stub

		String sql="select count(*) as COUNT from HouseDetailInfo hi " +
				"inner join House h on hi.houseid=h.id " +
				"inner join userinfo ui on ui.userid=hi.agentid " +
				"where ui.name like ? and h.H_ADDRESS=? ";
		List<Object> params =new ArrayList<Object>();
		params.add("%"+agentName+"%");
		params.add(address);
		int count = 0;
		Map<String,Object> map = new HashMap<String,Object>();
		map=SqlHelper.returnSimpleResult(sql, params);
		if(map.size()>0)
		{
			count=Integer.parseInt( map.get("COUNT").toString());
		}
		return count;
	}

	@Override
	public List<House> getHouseInfoRoughTop4ByAgentId(int agentid) {
		// TODO Auto-generated method stub
		List<House> houseList=new ArrayList<House>();
		String sql="select top 4 h.* from HouseDetailInfo hi inner " +
				"join House h on hi.houseid=h.id " +
				"inner join AgentInfo ag on hi.AGENTID=ag.ID" +
				" where ag.agentid=? ";
		List<Object> params =new ArrayList<Object>();
		params.add(agentid);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list=SqlHelper.returnMultipleResult(sql, params);
		if(list.size()>0)
		{
			for(Map<String,Object> map:list){
				House house=new House();
				house=toHouse(map);
				houseList.add(house);
			}
		}
		return houseList;
	}

	@Override
	public int getHouseInfoRoughByAgentId(int agentid) {
		// TODO Auto-generated method stub
		String sql="select count(*) as COUNT from HouseDetailInfo hi inner join House h " +
				"on hi.houseid=h.id where hi.agentid=?";
		List<Object> params =new ArrayList<Object>();
		params.add(agentid);
		int count = 0;
		Map<String,Object> map = new HashMap<String,Object>();
		map=SqlHelper.returnSimpleResult(sql, params);
		if(map.size()>0)
		{
			count=Integer.parseInt( map.get("COUNT").toString());
		}
		return count;
	}

	@Override
	public List<House> getHouseInfoRough(String address, int beginIndex,
			int endIndex) {
		// TODO Auto-generated method stub
		List<House> houseInAdderss=new ArrayList<House>();
		//String sql="select * from (select rownum as r,house.* from house where H_address=?)where  r>=? and r<=?";

		String sql="select * from( select ROW_NUMBER() OVER(ORDER BY ID ASC) as rownum, * from  House where H_address = ? and flag=1 ) as tb  where flag=1 and rownum between ? and ?";
		List<Object> params =new ArrayList<Object>();
		params.add(address);
		params.add(beginIndex);
		params.add(endIndex);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list=SqlHelper.returnMultipleResult(sql, params);
		if(list.size()>0)
		{
			for(Map<String,Object> map:list){
				House house=new House();
				house=toHouse(map);
				houseInAdderss.add(house);
			}
		}
		return houseInAdderss;
	}
	private House toHouse(Map<String,Object> map){
		House house=new House();
		PictureDaoJDBCImpl picDao=new PictureDaoJDBCImpl();
		house.setId(Integer.valueOf( map.get("ID").toString()));
		house.setOnePicAdd(picDao.selectPictureFirst(house.getId()));
		house.setH_address(map.get("H_ADDRESS").toString());
		house.setArea(Integer.valueOf(map.get("AREA").toString()));
		house.setHousetype(map.get("HOUSETYPE").toString());
		house.setName(map.get("NAME").toString());
		house.setPrice(Double.valueOf(map.get("PRICE").toString()));
		int flag=Integer.valueOf(map.get("FINEFLAG").toString());
		house.setFineFlag(Integer.valueOf(map.get("FINEFLAG").toString()));
		house.setVisitCount(Double.valueOf(map.get("VISITCOUNT").toString()));
		house.setOrderCount(Double.valueOf(map.get("ORDERCOUNT").toString()));
		return house;
	}
	@Override
	public List<House> getHouseInfoRoughByVagueAddress(String VAddress,
			String address, int beginIndex, int endIndex) {
		// TODO Auto-generated method stub
		List<House> houseList=new ArrayList<House>();
		String sql="select * from (select ROW_NUMBER() OVER(ORDER BY h.ID ASC) as r," +
				"h.* from HouseDetailInfo hi inner join House h on hi.houseid=h.id  " +
				"where hi.H_ADDRESSDEL like ? and h.H_ADDRESS=? ) tb where r>=? and r<=? ";
		List<Object> params =new ArrayList<Object>();
		params.add("%"+VAddress+"%");
		params.add(address);
		params.add(beginIndex);
		params.add(endIndex);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list=SqlHelper.returnMultipleResult(sql, params);
		if(list.size()>0)
		{
			for(Map<String,Object> map:list){
				House house=new House();
				house=toHouse(map);
				houseList.add(house);
			}
		}
		return houseList;
	}

	@Override
	public List<House> getHouseInfoRoughByVagueName(String VName,
			String address, int beginIndex, int endIndex) {
		// TODO Auto-generated method stub
		List<House> houseList=new ArrayList<House>();
		/*String sql="select * from" +
				"(select rownum as r,h.* from HouseDetailInfo hi " +
				"inner join House h on hi.houseid=h.id" +
				" where h.name like ? and h.H_ADDRESS=? )" +
				" where r>=? and r<=? ";*/
		String sql="select * from " +
				"(select ROW_NUMBER() OVER(ORDER BY h.ID ASC) as r,h.* " +
				"from HouseDetailInfo hi inner join House h on hi.houseid=h.id " +
				"where  h.H_ADDRESS=? and h.name like ? and flag=1  ) tb " +
				"where r>=? and r<=? ";
		List<Object> params =new ArrayList<Object>();
		
		params.add(address);
		params.add("%"+VName+"%");
		params.add(beginIndex);
		params.add(endIndex);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list=SqlHelper.returnMultipleResult(sql, params);
		if(list.size()>0)
		{
			for(Map<String,Object> map:list){
				House house=new House();
				house=toHouse(map);
				houseList.add(house);
			}
		}
		return houseList;
	}

	@Override
	public List<House> getHouseInfoRoughByVagueArea(double VArea,
			String address, int beginIndex, int endIndex) {
		// TODO Auto-generated method stub
		List<House> houseList=new ArrayList<House>();
		double maxArea=VArea+25;
		double minArea=VArea-25;
		String sql="select * from " +
				"(select ROW_NUMBER() OVER(ORDER BY h.ID ASC) as r,h.* from HouseDetailInfo hi " +
				"inner join House h on hi.houseid=h.id" +
				" where h.area>? and h.area <? and h.H_ADDRESS=?  )tb " +
				" where r>=? and r<=?";
		List<Object> params =new ArrayList<Object>();
		params.add(minArea);
		params.add(maxArea);
		params.add(address);
		params.add(beginIndex);
		params.add(endIndex);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list=SqlHelper.returnMultipleResult(sql, params);
		if(list.size()>0)
		{
			for(Map<String,Object> map:list){
				House house=new House();
				house=toHouse(map);
				houseList.add(house);
			}
		}
		return houseList;
	}

	@Override
	public List<House> getHouseInfoRoughByVagueAgent(String agentName,
			String address, int beginIndex, int endIndex) {
		// TODO Auto-generated method stub
		List<House> houseList=new ArrayList<House>();
		String sql="select * from " +
				"(select ROW_NUMBER() OVER(ORDER BY h.ID ASC) as r,h.* from HouseDetailInfo hi " +
				"inner join House h on hi.houseid=h.id " +
				"inner join userinfo ui on ui.userid=hi.agentid " +
				"where ui.name like ? and h.H_ADDRESS=? ) tb" +
				" where r>=? and r<=?";
		List<Object> params =new ArrayList<Object>();
		params.add("%"+agentName+"%");
		params.add(address);
		params.add(beginIndex);
		params.add(endIndex);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list=SqlHelper.returnMultipleResult(sql, params);
		if(list.size()>0)
		{
			for(Map<String,Object> map:list){
				House house=new House();
				house=toHouse(map);
				houseList.add(house);
			}
		}
		return houseList;
	}

	@Override
	public List<House> getHouseInfoRoughByAgentId(int agentid, int beginIndex,
			int endIndex) {
		// TODO Auto-generated method stub
		List<House> houseList=new ArrayList<House>();
		String sql="select * from (select ROW_NUMBER() OVER(ORDER BY h.ID ASC) as r,h.* " +
				"from HouseDetailInfo hi inner join House h on hi.houseid=h.id " +
				"inner join AgentInfo ag on hi.AGENTID=ag.ID " +
				"where ag.agentid=?) tb where tb.r>=? and tb.r<=?";
		
		List<Object> params =new ArrayList<Object>();
		params.add(agentid);
		params.add(beginIndex);
		params.add(endIndex);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list=SqlHelper.returnMultipleResult(sql, params);
		if(list.size()>0)
		{
			for(Map<String,Object> map:list){
				House house=new House();
				house=toHouse(map);
				houseList.add(house);
			}
		}
		return houseList;
	}


	@Override
	public List<House> getFineHouse() {
		// TODO Auto-generated method stub
		List<House> FineHouse=new ArrayList<House>();
		String sql="select * from house where flag=1 and fineflag=1";
		//String sql="select * from  House where H_address=? and rownum>=? and rownum<=?";
		List<Object> params =new ArrayList<Object>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list=SqlHelper.returnMultipleResult(sql, params);
		if(list.size()>0)
		{
			for(Map<String,Object> map:list){
				House house=new House();
				house=toHouse(map);
				FineHouse.add(house);
			}
		}
		return FineHouse;
	}

	@Override
	public boolean insertHouse(House house) {
		String sql="insert into HOUSE(H_ADDRESS,NAME,AREA,HOUSETYPE,PRICE) VALUES(?,?,?,?,?)";
		List<Object> params=new ArrayList<Object>();
		params.add(house.getH_address());
		params.add(house.getName());
		params.add(house.getArea());
		params.add(house.getHousetype());
		params.add(house.getPrice());
		
		return SqlHelper.Execute(sql, params);
		
	}
	
	@Override
	public int getNewHouseId() {
		// TODO Auto-generated method stub
		String sql="select ID from house order by ID desc";
		List<Object> params=new ArrayList<Object>();
		List<Map<String,Object>> map = new ArrayList<Map<String,Object>>();
		map=SqlHelper.returnMultipleResult(sql,params);
		int id=Integer.valueOf( map.get(0).get("ID").toString());
		return id;
	}

	@Override
	public List<House> getHouseInfoIdName() {
		// TODO Auto-generated method stub
		List<House> house=new ArrayList<House>();

		String sql="select ID,NAME,FLAG from House";
		List<Object> params =new ArrayList<Object>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list=SqlHelper.returnMultipleResult(sql, params);
		if(list.size()>0)
		{
			for(Map<String,Object> map:list){
				House houseinfo=new House();
				houseinfo.setId(Integer.valueOf( map.get("ID").toString()));
				houseinfo.setName(map.get("NAME").toString());
				houseinfo.setFlag(map.get("FLAG").toString());
				house.add(houseinfo);
			}
		}
		return house;
	}
	@Override
	public List<House> getHouseInfo() {
		// TODO Auto-generated method stub
		List<House> house=new ArrayList<House>();

		String sql="select * from House where flag=1";
		List<Object> params =new ArrayList<Object>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list=SqlHelper.returnMultipleResult(sql, params);
		if(list.size()>0)
		{
			for(Map<String,Object> map:list){
				House houseinfo=new House();
				houseinfo=toHouse(map);
				house.add(houseinfo);
			}
		}
		return house;
	}

	@Override
	public boolean updHouse(House house) {
		String sql="update house set NAME=?,HOUSETYPE=?,PRICE=? ," +
				"H_ADDRESS=?,  AREA=? where id=? ";
		List<Object> params =new ArrayList<Object>();
		params.add(house.getName());
		params.add(house.getHousetype());
		params.add(house.getPrice());
		params.add(house.getH_address());
		params.add(house.getArea());
		params.add(house.getId());
		
		return SqlHelper.Execute(sql, params);
	}


	@Override
	public boolean setFineHouse(int houseid) {
		// TODO Auto-generated method stub
		String sql="update house set flag=1 where id=? ";
		List<Object> params =new ArrayList<Object>();
		params.add(houseid);
		return SqlHelper.Execute(sql, params);
		
	}
	@Override
	public boolean delHouseInfo(int houseid) {
		// TODO Auto-generated method stub
		String sql="delete from house where id=? ";
		List<Object> params =new ArrayList<Object>();
		params.add(houseid);
		return SqlHelper.Execute(sql, params);
	}


	@Override
	public House getHouseOfHot() {
		// TODO Auto-generated method stub
		String sql="select top 1 * from Picture  p " +
				"inner join  house  h on h.ID=p.HOUSEID " +
				"where  p.PICADDRESS like '%default%' " +
				"and FLAG=1 order by h.ordercount desc ";
		House house=new House();
		Map<String,Object> map=SqlHelper.returnSimpleResult(sql, null);
		if(map!=null){
			house=toHouse(map);
			house.setOnePicAdd(map.get("PICADDRESS").toString());
		}
		else{
			house=null;
		}
		
		return house;
	}


	@Override
	public int getHouseCount() {
		String sql="select count(*) as COUNTS from house where FLAG=1";
		Map<String, Object> map = new HashMap<String, Object>(); 
		map=SqlHelper.returnSimpleResult(sql, null);
		if(map.size()>0){
			return Integer.parseInt( map.get("COUNTS").toString());
		}
		return 0;
	}


	@Override
	public boolean addHouseVisitRecord(int houseid) {
		List<Object> params =new ArrayList<Object>();
		params.add(houseid);
		String sql="update house set VISITCOUNT=VISITCOUNT+1 where ID=? ";
		return SqlHelper.Execute(sql, params);
		
	}


	@Override
	public boolean addHouseOrderCount(int houseid) {
		List<Object> params =new ArrayList<Object>();
		params.add(houseid);
		String sql="update house set ORDERCOUNT=ORDERCOUNT+1 where ID=? ";
		return SqlHelper.Execute(sql, params);		
	}
 


}
