package cn.sdcet.project.service;

import java.util.List;

import cn.sdcet.project.dao.jdbc.AgentInfoDaoJDBCImpl;
import cn.sdcet.project.dao.jdbc.UsersDaoJDBCImpl;
import cn.sdcet.project.domain.AgentInfo;
import cn.sdcet.project.domain.Users;

public class AgentInfoService {
	
	/***
	 * 检测该用户是否为代理人
	 * @param userId
	 * @return 是返回真
	 */
	public boolean isAgent(int userId) {
		AgentInfoDaoJDBCImpl agentDao=new AgentInfoDaoJDBCImpl();
		return agentDao.isAgent(userId);
	}
	/**
	 * 添加代理人信息
	 * @param user 用户集合
	 * @return
	 */
	public String addagentinfo(Users user){
		UsersDaoJDBCImpl userdao=new  UsersDaoJDBCImpl();
		if(userdao.isExist(user.getLoginid())){
			int id=userdao.getNewUserId(user.getLoginid());
			user.setId(id);
			AgentInfoDaoJDBCImpl agentinfo=new AgentInfoDaoJDBCImpl();
			if(agentinfo.setAgentInfo(user)){
				return "添加成功";	
			}else{
				return "哎呀 系统生病了";
			}
		}else {
			return "该用户不存在请尝试其他号码";
		}
			
	}
	
	/**
	 * 获取全部代理人id
	 * @return 
	 */
	public List<AgentInfo> selectAgentId() {
		AgentInfoDaoJDBCImpl agentDao=new AgentInfoDaoJDBCImpl();
		return agentDao.selectAgentId();
	}
	
	/**
	 * 获取最热代理人
	 * @return
	 */
	public AgentInfo getAgentOfHot(){
		AgentInfoDaoJDBCImpl agentDao=new AgentInfoDaoJDBCImpl();
		
		return agentDao.getAgentOfHot();
		
	}
	/**
	 * 获取代理人点赞前五名
	 * @return 
	 */
	public List<AgentInfo> selectAgentOfTopFive() {
		AgentInfoDaoJDBCImpl agentDao=new AgentInfoDaoJDBCImpl();
		return agentDao.getAgentOfTopFive();
	}
	
	/**
	 * 删除代理人 假删除
	 * @param agentId
	 * @return
	 */
	public boolean deleteAgentInfo(int agentId){
		AgentInfoDaoJDBCImpl agentDao=new AgentInfoDaoJDBCImpl();
		return agentDao.deleteAgentById(agentId);
	}
}
