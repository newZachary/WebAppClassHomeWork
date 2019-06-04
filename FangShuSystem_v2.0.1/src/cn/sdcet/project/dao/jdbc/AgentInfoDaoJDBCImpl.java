package cn.sdcet.project.dao.jdbc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.sdcet.project.dao.AgentInfoDao;
import cn.sdcet.project.domain.AgentInfo;
import cn.sdcet.project.domain.Users;
import cn.sdcet.project.util.SqlHelper;

public class AgentInfoDaoJDBCImpl implements AgentInfoDao {
	@Override
	public boolean isAgent(int userId) {
		// TODO Auto-generated method stub
		String sql="select count(*) as COUNT from agentinfo where agentid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(userId);
		boolean flag=false;
		Map<String,Object> count=SqlHelper.returnSimpleResult(sql, params);
		if(count.size()>0){
			if(Integer.parseInt(count.get("COUNT").toString())==1){
				flag=true;
			}
		}
		return flag;
		
	}

	@Override
	public boolean setAgentInfo(Users user) {
		String sql="insert into AgentInfo(agentid) values(?)";
		List<Object> params =new ArrayList<Object>();
		params.add(user.getId());
		return SqlHelper.Execute(sql, params);
	}

	private AgentInfo toAgent(Map<String,Object> map){
		AgentInfo agent=new AgentInfo();
		agent.setId(Integer.valueOf( map.get("ID").toString()));
		agent.setName(map.get("NAME").toString());
		Users user=new Users();
		user.setId(Integer.valueOf(map.get("AGENTID").toString()));
		agent.setAgentId(user);
		agent.setContact(map.get("CONTACT").toString());
		return agent;
	}
	
	@Override
	public List<AgentInfo> selectAgentId() {
		List<AgentInfo> agentList=new ArrayList<AgentInfo>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		String sql="select ai.ID,ai.AGENTID,ai.THUMBCOUNT,ui.NAME,ui.CONTACT " +
				"from AgentInfo ai inner join UserInfo ui on ai.AGENTID=ui.USERID where flag=1";
		List<Object> params=new ArrayList<Object>();
		list=SqlHelper.returnMultipleResult(sql, params);
		if(list.size()>0){
			for(Map<String,Object> map:list){
				AgentInfo agent=new AgentInfo();
				agent=toAgent(map);
				agentList.add(agent);
			}
		}
		return agentList;
	}

	@Override
	public AgentInfo getAgentOfHot() {
		String sql="select top 1 u.HEAD,u.NAME,a.THUMBCOUNT,a.AGENTID,count(h.AGENTID)as HOUSECOUNT from " +
				"AgentInfo a inner join HouseDetailInfo h on a.ID=h.AGENTID " +
				"inner join UserInfo u on u.USERID=a.AGENTID " +
				"group by u.HEAD,a.THUMBCOUNT,a.AGENTID ,u.NAME order by a.THUMBCOUNT desc";
		Map<String,Object> map=SqlHelper.returnSimpleResult(sql, null);
		AgentInfo agent=new AgentInfo();
		if(map.size()>0){
			Users user=new Users();
			user.setId(Integer.valueOf(map.get("AGENTID").toString()));
			agent.setAgentId(user);
			agent.setHouseCount(Integer.valueOf(map.get("HOUSECOUNT").toString()));
			agent.setHead(map.get("HEAD").toString());
			agent.setThumbCount(Integer.valueOf(map.get("THUMBCOUNT").toString()));
			agent.setName(map.get("NAME").toString());
		}
		return agent;
	}

	@Override
	public List<AgentInfo> getAgentOfTopFive() {
		String sql="select top 5 * from AgentInfo a inner join UserInfo u " +
				"on a.AGENTID=u.USERID order by a.THUMBCOUNT desc ";
		List<AgentInfo> agentList=new ArrayList<AgentInfo>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list=SqlHelper.returnMultipleResult(sql, null);
		if(list.size()>0){
			for(Map<String,Object> map:list){
				AgentInfo agent=new AgentInfo();
				agent=toAgent(map);
				agent.setHead(map.get("HEAD").toString());
				agent.setThumbCount(Integer.valueOf(map.get("THUMBCOUNT").toString()));
				agent.setName(map.get("NAME").toString());
				agent.setContact(map.get("CONTACT").toString());
				agentList.add(agent);
			}
		}
		return agentList;
	}

	@Override
	public boolean addThumbCount(int agentid) {
		String sql="update AgentInfo set THUMBCOUNT=THUMBCOUNT+1 where AGENTID=?";
		List<Object> params =new ArrayList<Object>();
		params.add(agentid);
		return SqlHelper.Execute(sql, params);
		
	}

	@Override
	public boolean isServiceTheUser(int agentid, int userid) {
		
		String sql="select count(*) as COUNT from ShopCar s " +
					"inner join HouseDetailInfo h on s.HOUSEID=h.HOUSEID " +
					"where s.STATUS=1 and h.AGENTID=? and s.USERID=?";
			
		List<Object> params =new ArrayList<Object>();
		params.add(agentid);
		params.add(userid);
		Map<String,Object> map=new HashMap<String,Object>();
		map=SqlHelper.returnSimpleResult(sql, params);
		int count=Integer.parseInt( map.get("COUNT").toString());
		if(count>0)
		{
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteAgentById(int agentId) {
		String sql="update agentinfo set flag=0 where agentId=? ";
		List<Object> params =new ArrayList<Object>();
		params.add(agentId);
		return SqlHelper.Execute(sql, params);
	}
}
