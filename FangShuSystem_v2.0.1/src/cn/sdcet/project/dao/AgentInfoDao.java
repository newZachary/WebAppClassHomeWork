package cn.sdcet.project.dao;

import java.util.List;

import cn.sdcet.project.domain.AgentInfo;
import cn.sdcet.project.domain.Users;

public interface AgentInfoDao {

	/**
	 * �����Ϣ
	 * @param agentid ������id
	 * @return
	 */
	public boolean setAgentInfo(Users agentid);
	
	/**
	 * ��ȡȫ��������id
	 * @return ȫ��������id
	 */
	public List<AgentInfo> selectAgentId();
	
	/**
	 * ����Ƿ�Ϊ������
	 * @param userId
	 * @return Ϊ�����˷�����
	 */
	public boolean isAgent(int userId);
	/**
	 * ��ȡ���ȴ�������Ϣ
	 * @return
	 */
	public AgentInfo getAgentOfHot();
	
	/**
	 * ��ȡ��õ�����Ŀ����ǰ���������
	 * @return
	 */
	public List<AgentInfo> getAgentOfTopFive();
	
	public boolean addThumbCount(int agentid);
	public boolean isServiceTheUser(int agentid, int userid);
	
	/**
	 * ɾ����������Ϣ
	 * @param agentId
	 * @return
	 */
	public boolean deleteAgentById(int agentId);
}
