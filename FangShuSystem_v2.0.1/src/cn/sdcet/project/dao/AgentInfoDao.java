package cn.sdcet.project.dao;

import java.util.List;

import cn.sdcet.project.domain.AgentInfo;
import cn.sdcet.project.domain.Users;

public interface AgentInfoDao {

	/**
	 * 添加信息
	 * @param agentid 代理人id
	 * @return
	 */
	public boolean setAgentInfo(Users agentid);
	
	/**
	 * 获取全部代理人id
	 * @return 全部代理人id
	 */
	public List<AgentInfo> selectAgentId();
	
	/**
	 * 检测是否为代理人
	 * @param userId
	 * @return 为代理人返回真
	 */
	public boolean isAgent(int userId);
	/**
	 * 获取最热代理人信息
	 * @return
	 */
	public AgentInfo getAgentOfHot();
	
	/**
	 * 获取获得点赞数目最多的前五个代理人
	 * @return
	 */
	public List<AgentInfo> getAgentOfTopFive();
	
	public boolean addThumbCount(int agentid);
	public boolean isServiceTheUser(int agentid, int userid);
	
	/**
	 * 删除代理人信息
	 * @param agentId
	 * @return
	 */
	public boolean deleteAgentById(int agentId);
}
