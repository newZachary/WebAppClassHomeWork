package cn.sdcet.project.dao;

import java.util.List;
import cn.sdcet.project.domain.*;


public interface HouseDao {


	/**
	 *  获取该省份别墅数量
	 * @param address 省份地址
	 * @return  别墅数量
	 */
	public int getHouseInfoRough(String address);
	/**
	 * 根据房子所在省份获取房屋大体信息
	 * @param address 省份地址
	 * @param beginIndex 开始页码
	 * @param endIndex 结束页码
	 * @return 房屋粗略信息
	 */
	public List<House> getHouseInfoRough(String address,int beginIndex,int endIndex);

	/**
	 * 根据房子编号获取房屋大体信息
	 * @param houseid 房屋编号
	 * @return 房子信息
	 */
	public House getHouseInfoRoughById(int houseid);

	/**
	 * 根据房子详细地址获取该地区别墅数量
	 * @param VAddress 详细地址中的关键字
	 * @param address  省份地址
	 * @return 别墅数量
	 */
	public int getHouseInfoRoughByVagueAddress(String VAddress,String address);

	/**
	 * 根据房子地址模糊获取房屋大体信息
	 * @param VAddress 详细地址中的关键字
	 * @param address 省份地址
	 * @param beginIndex 开始页码
	 * @param endIndex 结束页码
	 * @return 房屋粗略信息
	 */
	public List<House> getHouseInfoRoughByVagueAddress(String VAddress,String address,int beginIndex,int endIndex);


	/**
	 * 根据房子名称模糊获取该地区别墅数量
	 * @param VName 名字中的关键字
	 * @param address 省份地址
	 * @return 别墅数量
	 */
	public int getHouseInfoRoughByVagueName(String VName,String address);
	/**
	 * 根据房子名称模糊获取房屋大体信息
	 * @param VName 模糊查询的姓名
	 * @param address 省份地址
	 * @param beginIndex 开始页码
	 * @param endIndex 结束页码
	 * @return 房屋粗略信息
	 */
	public List<House> getHouseInfoRoughByVagueName(String VName,String address,int beginIndex,int endIndex);

	/**
	 * 根据房子面积模糊获取房屋大体信息
	 * @param VArea
	 * @param address 省份地址
	 * @return 别墅数量
	 */
	public int getHouseInfoRoughByVagueArea(double VArea ,String address);


	/**
	 * 根据房子面积模糊获取房屋大体信息
	 * @param VArea 模糊查询的面积
	 * @param address 省份地址
	 * @param beginIndex 开始页码
	 * @param endIndex 结束页码
	 * @return 房屋粗略信息
	 */
	public List<House> getHouseInfoRoughByVagueArea(double VArea ,String address,int beginIndex,int endIndex);

	/**
	 * 根据房子代理模糊获取房屋大体信息
	 * @param Agent 代理人名字
	 * @param address 省份地址
	 * @return 别墅数量
	 */
	public int getHouseInfoRoughByVagueAgent(String agentName,String address);
	/**
	 * 根据房子代理模糊获取房屋大体信息
	 * @param agentName 代理人名字
	 * @param address 省份地址
	 * @param beginIndex 开始页码
	 * @param endIndex 结束页码
	 * @return 房屋粗略信息
	 */
	public List<House> getHouseInfoRoughByVagueAgent(String agentName,String address,int beginIndex,int endIndex);

	/**
	 * 根据代理人id查找所代理的前四个房子
	 * @param agentid 代理人编号
	 * @return  房屋粗略信息
	 */
	public List<House> getHouseInfoRoughTop4ByAgentId(int agentid);


	/**
	 * 根据代理人id查找所代理别墅的数量
	 * @param agentid 代理人编号
	 * @return 别墅数量
	 */
	public int getHouseInfoRoughByAgentId(int agentid);
	/**
	 *  根据代理人id查找所代理房子
	 * @param agentid 代理人编号
	 * @param beginIndex 开始页码
	 * @param endIndex 结束页码
	 * @return 房屋粗略信息
	 */
	public List<House> getHouseInfoRoughByAgentId(int agentid,int beginIndex,int endIndex);

	/*
	 * 获取精品别墅
	 */
	public List<House> getFineHouse();
	
	
	/**
	 * 添加房屋信息
	 * @return 是否添加成功
	 */
	public boolean insertHouse(House house);
	
	/**
	 * 获取最新添加的
	 * @return
	 */
	public int getNewHouseId();
	
	/**
	 * 获取房屋的id和name
	 * @return
	 */
	public List<House> getHouseInfoIdName();
	
	/**
	 * 获取房屋的info
	 * @return house
	 */
	public List<House> getHouseInfo();
	public boolean updHouse(House house);
	
	public boolean setFineHouse(int houseid);
	/**
	 * 删除房屋信息
	 * @param houseid 房屋id
	 * @return
	 */
	public boolean delHouseInfo(int houseid);
	/**
	 * 获取最热的房屋信息
	 * @return
	 */
	public House getHouseOfHot();
	
	/**
	 * 获取房源总数量
	 * @return
	 */
	public int getHouseCount();
	
	/**
	 * 增加房屋的浏览量
	 * @return
	 */
	public boolean addHouseVisitRecord(int houseid);
	/**
	 * 增加房屋的预约
	 * @return
	 */
	public boolean addHouseOrderCount(int houseid);

	
	
}
