package cn.sdcet.project.service;

import java.util.List;

import cn.sdcet.project.dao.jdbc.AgentInfoDaoJDBCImpl;
import cn.sdcet.project.dao.jdbc.UsersDaoJDBCImpl;
import cn.sdcet.project.domain.AgentInfo;
import cn.sdcet.project.domain.Users;

public class AgentInfoService {
	
	/***
	 * �����û��Ƿ�Ϊ������
	 * @param userId
	 * @return �Ƿ�����
	 */
	public boolean isAgent(int userId) {
		AgentInfoDaoJDBCImpl agentDao=new AgentInfoDaoJDBCImpl();
		return agentDao.isAgent(userId);
	}
	/**
	 * ��Ӵ�������Ϣ
	 * @param user �û�����
	 * @return
	 */
	public String addagentinfo(Users user){
		UsersDaoJDBCImpl userdao=new  UsersDaoJDBCImpl();
		if(userdao.isExist(user.getLoginid())){
			int id=userdao.getNewUserId(user.getLoginid());
			user.setId(id);
			AgentInfoDaoJDBCImpl agentinfo=new AgentInfoDaoJDBCImpl();
			if(agentinfo.setAgentInfo(user)){
				return "��ӳɹ�";	
			}else{
				return "��ѽ ϵͳ������";
			}
		}else {
			return "���û��������볢����������";
		}
			
	}
	
	/**
	 * ��ȡȫ��������id
	 * @return 
	 */
	public List<AgentInfo> selectAgentId() {
		AgentInfoDaoJDBCImpl agentDao=new AgentInfoDaoJDBCImpl();
		return agentDao.selectAgentId();
	}
	
	/**
	 * ��ȡ���ȴ�����
	 * @return
	 */
	public AgentInfo getAgentOfHot(){
		AgentInfoDaoJDBCImpl agentDao=new AgentInfoDaoJDBCImpl();
		
		return agentDao.getAgentOfHot();
		
	}
	/**
	 * ��ȡ�����˵���ǰ����
	 * @return 
	 */
	public List<AgentInfo> selectAgentOfTopFive() {
		AgentInfoDaoJDBCImpl agentDao=new AgentInfoDaoJDBCImpl();
		return agentDao.getAgentOfTopFive();
	}
	
	/**
	 * ɾ�������� ��ɾ��
	 * @param agentId
	 * @return
	 */
	public boolean deleteAgentInfo(int agentId){
		AgentInfoDaoJDBCImpl agentDao=new AgentInfoDaoJDBCImpl();
		return agentDao.deleteAgentById(agentId);
	}
}
