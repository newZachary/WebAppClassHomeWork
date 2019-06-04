package cn.sdcet.project.dao;

import java.util.List;
import cn.sdcet.project.domain.*;


public interface HouseDao {


	/**
	 *  ��ȡ��ʡ�ݱ�������
	 * @param address ʡ�ݵ�ַ
	 * @return  ��������
	 */
	public int getHouseInfoRough(String address);
	/**
	 * ���ݷ�������ʡ�ݻ�ȡ���ݴ�����Ϣ
	 * @param address ʡ�ݵ�ַ
	 * @param beginIndex ��ʼҳ��
	 * @param endIndex ����ҳ��
	 * @return ���ݴ�����Ϣ
	 */
	public List<House> getHouseInfoRough(String address,int beginIndex,int endIndex);

	/**
	 * ���ݷ��ӱ�Ż�ȡ���ݴ�����Ϣ
	 * @param houseid ���ݱ��
	 * @return ������Ϣ
	 */
	public House getHouseInfoRoughById(int houseid);

	/**
	 * ���ݷ�����ϸ��ַ��ȡ�õ�����������
	 * @param VAddress ��ϸ��ַ�еĹؼ���
	 * @param address  ʡ�ݵ�ַ
	 * @return ��������
	 */
	public int getHouseInfoRoughByVagueAddress(String VAddress,String address);

	/**
	 * ���ݷ��ӵ�ַģ����ȡ���ݴ�����Ϣ
	 * @param VAddress ��ϸ��ַ�еĹؼ���
	 * @param address ʡ�ݵ�ַ
	 * @param beginIndex ��ʼҳ��
	 * @param endIndex ����ҳ��
	 * @return ���ݴ�����Ϣ
	 */
	public List<House> getHouseInfoRoughByVagueAddress(String VAddress,String address,int beginIndex,int endIndex);


	/**
	 * ���ݷ�������ģ����ȡ�õ�����������
	 * @param VName �����еĹؼ���
	 * @param address ʡ�ݵ�ַ
	 * @return ��������
	 */
	public int getHouseInfoRoughByVagueName(String VName,String address);
	/**
	 * ���ݷ�������ģ����ȡ���ݴ�����Ϣ
	 * @param VName ģ����ѯ������
	 * @param address ʡ�ݵ�ַ
	 * @param beginIndex ��ʼҳ��
	 * @param endIndex ����ҳ��
	 * @return ���ݴ�����Ϣ
	 */
	public List<House> getHouseInfoRoughByVagueName(String VName,String address,int beginIndex,int endIndex);

	/**
	 * ���ݷ������ģ����ȡ���ݴ�����Ϣ
	 * @param VArea
	 * @param address ʡ�ݵ�ַ
	 * @return ��������
	 */
	public int getHouseInfoRoughByVagueArea(double VArea ,String address);


	/**
	 * ���ݷ������ģ����ȡ���ݴ�����Ϣ
	 * @param VArea ģ����ѯ�����
	 * @param address ʡ�ݵ�ַ
	 * @param beginIndex ��ʼҳ��
	 * @param endIndex ����ҳ��
	 * @return ���ݴ�����Ϣ
	 */
	public List<House> getHouseInfoRoughByVagueArea(double VArea ,String address,int beginIndex,int endIndex);

	/**
	 * ���ݷ��Ӵ���ģ����ȡ���ݴ�����Ϣ
	 * @param Agent ����������
	 * @param address ʡ�ݵ�ַ
	 * @return ��������
	 */
	public int getHouseInfoRoughByVagueAgent(String agentName,String address);
	/**
	 * ���ݷ��Ӵ���ģ����ȡ���ݴ�����Ϣ
	 * @param agentName ����������
	 * @param address ʡ�ݵ�ַ
	 * @param beginIndex ��ʼҳ��
	 * @param endIndex ����ҳ��
	 * @return ���ݴ�����Ϣ
	 */
	public List<House> getHouseInfoRoughByVagueAgent(String agentName,String address,int beginIndex,int endIndex);

	/**
	 * ���ݴ�����id�����������ǰ�ĸ�����
	 * @param agentid �����˱��
	 * @return  ���ݴ�����Ϣ
	 */
	public List<House> getHouseInfoRoughTop4ByAgentId(int agentid);


	/**
	 * ���ݴ�����id�������������������
	 * @param agentid �����˱��
	 * @return ��������
	 */
	public int getHouseInfoRoughByAgentId(int agentid);
	/**
	 *  ���ݴ�����id������������
	 * @param agentid �����˱��
	 * @param beginIndex ��ʼҳ��
	 * @param endIndex ����ҳ��
	 * @return ���ݴ�����Ϣ
	 */
	public List<House> getHouseInfoRoughByAgentId(int agentid,int beginIndex,int endIndex);

	/*
	 * ��ȡ��Ʒ����
	 */
	public List<House> getFineHouse();
	
	
	/**
	 * ��ӷ�����Ϣ
	 * @return �Ƿ���ӳɹ�
	 */
	public boolean insertHouse(House house);
	
	/**
	 * ��ȡ������ӵ�
	 * @return
	 */
	public int getNewHouseId();
	
	/**
	 * ��ȡ���ݵ�id��name
	 * @return
	 */
	public List<House> getHouseInfoIdName();
	
	/**
	 * ��ȡ���ݵ�info
	 * @return house
	 */
	public List<House> getHouseInfo();
	public boolean updHouse(House house);
	
	public boolean setFineHouse(int houseid);
	/**
	 * ɾ��������Ϣ
	 * @param houseid ����id
	 * @return
	 */
	public boolean delHouseInfo(int houseid);
	/**
	 * ��ȡ���ȵķ�����Ϣ
	 * @return
	 */
	public House getHouseOfHot();
	
	/**
	 * ��ȡ��Դ������
	 * @return
	 */
	public int getHouseCount();
	
	/**
	 * ���ӷ��ݵ������
	 * @return
	 */
	public boolean addHouseVisitRecord(int houseid);
	/**
	 * ���ӷ��ݵ�ԤԼ
	 * @return
	 */
	public boolean addHouseOrderCount(int houseid);

	
	
}
