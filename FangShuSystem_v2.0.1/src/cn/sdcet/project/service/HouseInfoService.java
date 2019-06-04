package cn.sdcet.project.service;

import java.util.ArrayList;
import java.util.List;

import cn.sdcet.project.dao.jdbc.HouseDetailInfoDaoJDBCImpl;
import cn.sdcet.project.dao.jdbc.HouseInfoJDBCImpl;
import cn.sdcet.project.dao.jdbc.PictureDaoJDBCImpl;
import cn.sdcet.project.dao.jdbc.ShopCarDaoJDBCImpl;
import cn.sdcet.project.domain.House;
import cn.sdcet.project.domain.HouseDetailInfo;
import cn.sdcet.project.util.SqlHelper;

public class HouseInfoService {
	public int PAGESIZE=6;
	/**
	 * 获取该省份别墅数量
	 * @param address 省份名称
	 * @return 别墅数量
	 */
	public int getHouseInfoRough(String address) {
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRough(address);
	}
	/**
	 * 根据房子详细地址获取该地区别墅数量
	 * @param VAddress
	 * @param address
	 @return 别墅数量
	 */
	public int getHouseInfoRoughByVagueAddress(String VAddress,String address) {
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRoughByVagueAddress(VAddress,address);
	}
	/**
	 * 根据房子代理人模糊获取该地区别墅数量
	 * @param Agent
	 * @param address
	 @return 别墅数量
	 */
	public int getHouseInfoRoughByVagueAgent(String agentName,String address){
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRoughByVagueAgent(agentName, address);
	}
	/**
	 * 根据房子面积模糊获取该地区别墅数量
	 * @param VArea
	 * @param address
	 * @return
	 */
	public int getHouseInfoRoughByVagueArea(double VArea ,String address){
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRoughByVagueArea(VArea, address);
	}
	/**
	 * 根据房子名称模糊该地区别墅数量
	 * @param VName
	 * @param address
	@return 别墅数量
	 */
	public int getHouseInfoRoughByVagueName(String VName,String address){
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRoughByVagueName(VName, address);
	}
	
	/**
	 * 根据代理人的用户编号编号获取该代理人前四个所代理的房子
	 * @param agentid 代理人的用户编号
	 * @return
	 */
	public List<House> getHouseInfoRoughTop4ByAgentId(int agentid) {
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRoughTop4ByAgentId(agentid);
	}
	
	/**
	 * 根据代理人用户编号获取该代理人所代理的别墅数量
	 * @param agentid
	 @return 别墅数量
	 */
	public int getHouseInfoRoughByAgentId(int agentid) {
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRoughByAgentId(agentid);
	}
	/**
	 * 根据房屋所在省份查询
	 * @param address 省份名称
	 * @return 该省份内的房子
	 */
	public List<House> getHouseInfoRough(String address,int currentPage) {
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		
		int beginIndex=(currentPage-1)*PAGESIZE+1;
		int endIndex=currentPage*PAGESIZE;
		
		return houseInfoDao.getHouseInfoRough(address,beginIndex,endIndex);
	}
	/**
	 * 根据房子地址模糊获取房屋大体信息
	 * @param VAddress
	 * @param address
	 * @return
	 */
	public List<House> getHouseInfoRoughByVagueAddress(String VAddress,String address,int currentPage) {
		int beginIndex=(currentPage-1)*PAGESIZE+1;
		int endIndex=currentPage*PAGESIZE;
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRoughByVagueAddress(VAddress,address,beginIndex,endIndex);
	}
	/**
	 * 根据房子代理人模糊获取房屋大体信息
	 * @param Agent
	 * @param address
	 * @return
	 */
	public List<House> getHouseInfoRoughByVagueAgent(String agentName,String address,int currentPage){
		int beginIndex=(currentPage-1)*PAGESIZE+1;
		int endIndex=currentPage*PAGESIZE;
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRoughByVagueAgent(agentName, address,beginIndex,endIndex);
	}
	/**
	 * 根据房子面积模糊获取房屋大体信息
	 * @param VArea
	 * @param address
	 * @return
	 */
	public List<House> getHouseInfoRoughByVagueArea(double VArea ,String address,int currentPage){
		int beginIndex=(currentPage-1)*PAGESIZE+1;
		int endIndex=currentPage*PAGESIZE;
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRoughByVagueArea(VArea, address,beginIndex,endIndex);
	}
	/**
	 * 根据房子名称模糊获取房屋大体信息
	 * @param VName
	 * @param address
	 * @return
	 */
	public List<House> getHouseInfoRoughByVagueName(String VName,String address,int currentPage){
		int beginIndex=(currentPage-1)*PAGESIZE+1;
		int endIndex=currentPage*PAGESIZE;
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRoughByVagueName(VName, address,beginIndex,endIndex);
	}
	
	
	/**
	 * 根据代理人用户编号获取该代理人所代理的房子
	 * @param agentid
	 * @return
	 */
	public List<House> getHouseInfoRoughByAgentId(int agentid,int currentPage) {
		int beginIndex=(currentPage-1)*PAGESIZE+1;
		int endIndex=currentPage*PAGESIZE;
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRoughByAgentId(agentid,beginIndex,endIndex);
	}
	
	/**
	 * 删除房屋信息
	 * @param houseid
	 * @return
	 */
	public boolean delHouseInfo(int houseid){
		int falg=0;
		HouseDetailInfoDaoJDBCImpl housedetDao=new HouseDetailInfoDaoJDBCImpl();
		PictureDaoJDBCImpl picService=new PictureDaoJDBCImpl();
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		ShopCarDaoJDBCImpl shopcarDao=new ShopCarDaoJDBCImpl();
		if(!shopcarDao.delShopCar(houseid)){
			falg++;
		}
		if(!picService.delPicture(houseid)){
			falg++;
		}
		if(!housedetDao.delHouseDetInfo(houseid)){
			falg++;
		}
		
		if(!houseInfoDao.delHouseInfo(houseid)){
			falg++;
		}
		
		
				
		return falg==0;
	}
	

	/**
	 * 获取精品别墅 
	 */
	public List<House> getFineHouse() {
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getFineHouse();
	}
	
	/**
	 * 添加房屋基本和详细信息
	 * @return 运行结果
	 */
	public boolean addHouseInfo(House house,HouseDetailInfo houseDet){
		
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		if(houseInfoDao.insertHouse(house)){
			int id=houseInfoDao.getNewHouseId();
			house.setId(id);
			houseDet.setHouse(house);
			HouseDetailInfoDaoJDBCImpl housedetDao=new HouseDetailInfoDaoJDBCImpl();
			if(housedetDao.insertHouseDetailInfo(houseDet)){
				return true;
			}else{
				System.out.println("插入房屋的详细信息出错了,HouseDetailInfo表添加信息失败");
				return false;
			}
			
		}else{
			System.out.println("插入房屋的基本信息出错了,house表添加信息失败");
			return false;
		}
		
	}
	
	/**
	 * 获取新的房子编号
	 * @return
	 */
	public int getNewHouseId(){
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		int id=houseInfoDao.getNewHouseId();
		return id;
	}
	/**
	 * 获取房屋house的id和name
	 * @return 房屋id和name
	 */
	public List<House> getHouseInfoIdName() {
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoIdName();
	}
	/**
	 * 获取房屋house的info
	 * @return house
	 */
	public List<House> getHouseInfo() {
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfo();
	}
	/**
	 * 获取房屋house的全部信息
	 * @param id house表id
	 * @return 房屋house表的全部信息
	 */
	public House getHouseAllInfo(int id){
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRoughById(id);
	}
	public boolean setFineHouse(int houseid) {
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.setFineHouse(houseid);
	}
	/**
	 * 获取最受欢迎的房子信息
	 * @return
	 */
	public House getHouseOfHot(){
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseOfHot();
	}
	public int getHouseCount() {
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseCount();
	}
	
	
	/**
	 * 增加房屋的浏览量
	 * @return
	 */
	public boolean addHouseVisitRecord(int houseid){
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.addHouseVisitRecord(houseid);
	}
	/**
	 * 增加房屋的预约数量
	 * @return
	 */
	public boolean addHouseOrderCount(int houseid){
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.addHouseOrderCount(houseid);
	}
	
	
	
	
}
