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
	 * ��ȡ��ʡ�ݱ�������
	 * @param address ʡ������
	 * @return ��������
	 */
	public int getHouseInfoRough(String address) {
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRough(address);
	}
	/**
	 * ���ݷ�����ϸ��ַ��ȡ�õ�����������
	 * @param VAddress
	 * @param address
	 @return ��������
	 */
	public int getHouseInfoRoughByVagueAddress(String VAddress,String address) {
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRoughByVagueAddress(VAddress,address);
	}
	/**
	 * ���ݷ��Ӵ�����ģ����ȡ�õ�����������
	 * @param Agent
	 * @param address
	 @return ��������
	 */
	public int getHouseInfoRoughByVagueAgent(String agentName,String address){
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRoughByVagueAgent(agentName, address);
	}
	/**
	 * ���ݷ������ģ����ȡ�õ�����������
	 * @param VArea
	 * @param address
	 * @return
	 */
	public int getHouseInfoRoughByVagueArea(double VArea ,String address){
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRoughByVagueArea(VArea, address);
	}
	/**
	 * ���ݷ�������ģ���õ�����������
	 * @param VName
	 * @param address
	@return ��������
	 */
	public int getHouseInfoRoughByVagueName(String VName,String address){
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRoughByVagueName(VName, address);
	}
	
	/**
	 * ���ݴ����˵��û���ű�Ż�ȡ�ô�����ǰ�ĸ�������ķ���
	 * @param agentid �����˵��û����
	 * @return
	 */
	public List<House> getHouseInfoRoughTop4ByAgentId(int agentid) {
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRoughTop4ByAgentId(agentid);
	}
	
	/**
	 * ���ݴ������û���Ż�ȡ�ô�����������ı�������
	 * @param agentid
	 @return ��������
	 */
	public int getHouseInfoRoughByAgentId(int agentid) {
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoRoughByAgentId(agentid);
	}
	/**
	 * ���ݷ�������ʡ�ݲ�ѯ
	 * @param address ʡ������
	 * @return ��ʡ���ڵķ���
	 */
	public List<House> getHouseInfoRough(String address,int currentPage) {
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		
		int beginIndex=(currentPage-1)*PAGESIZE+1;
		int endIndex=currentPage*PAGESIZE;
		
		return houseInfoDao.getHouseInfoRough(address,beginIndex,endIndex);
	}
	/**
	 * ���ݷ��ӵ�ַģ����ȡ���ݴ�����Ϣ
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
	 * ���ݷ��Ӵ�����ģ����ȡ���ݴ�����Ϣ
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
	 * ���ݷ������ģ����ȡ���ݴ�����Ϣ
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
	 * ���ݷ�������ģ����ȡ���ݴ�����Ϣ
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
	 * ���ݴ������û���Ż�ȡ�ô�����������ķ���
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
	 * ɾ��������Ϣ
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
	 * ��ȡ��Ʒ���� 
	 */
	public List<House> getFineHouse() {
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getFineHouse();
	}
	
	/**
	 * ��ӷ��ݻ�������ϸ��Ϣ
	 * @return ���н��
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
				System.out.println("���뷿�ݵ���ϸ��Ϣ������,HouseDetailInfo�������Ϣʧ��");
				return false;
			}
			
		}else{
			System.out.println("���뷿�ݵĻ�����Ϣ������,house�������Ϣʧ��");
			return false;
		}
		
	}
	
	/**
	 * ��ȡ�µķ��ӱ��
	 * @return
	 */
	public int getNewHouseId(){
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		int id=houseInfoDao.getNewHouseId();
		return id;
	}
	/**
	 * ��ȡ����house��id��name
	 * @return ����id��name
	 */
	public List<House> getHouseInfoIdName() {
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfoIdName();
	}
	/**
	 * ��ȡ����house��info
	 * @return house
	 */
	public List<House> getHouseInfo() {
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.getHouseInfo();
	}
	/**
	 * ��ȡ����house��ȫ����Ϣ
	 * @param id house��id
	 * @return ����house���ȫ����Ϣ
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
	 * ��ȡ���ܻ�ӭ�ķ�����Ϣ
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
	 * ���ӷ��ݵ������
	 * @return
	 */
	public boolean addHouseVisitRecord(int houseid){
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.addHouseVisitRecord(houseid);
	}
	/**
	 * ���ӷ��ݵ�ԤԼ����
	 * @return
	 */
	public boolean addHouseOrderCount(int houseid){
		HouseInfoJDBCImpl houseInfoDao=new HouseInfoJDBCImpl();
		return houseInfoDao.addHouseOrderCount(houseid);
	}
	
	
	
	
}
