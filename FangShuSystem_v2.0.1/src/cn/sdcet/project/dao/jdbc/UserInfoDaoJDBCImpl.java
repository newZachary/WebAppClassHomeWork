package cn.sdcet.project.dao.jdbc;

import java.util.*;

import cn.sdcet.project.dao.UserInfoDao;
import cn.sdcet.project.domain.UserInfo;
import cn.sdcet.project.domain.Users;
import cn.sdcet.project.util.SqlHelper;

public class UserInfoDaoJDBCImpl implements UserInfoDao {

	@Override
	public UserInfo getUserInfo(String loginid) {
		// TODO Auto-generated method stub
		String sql="select u.PWD, u.LOGINID,u.ID,ui.CARDID,ui.CONTACT,ui.EMAIL,ui.GENDER,ui.HEAD,ui.NAME " +
				"from userinfo ui INNER JOIN USERS u on ui.userid=u.id where u.loginid = ?";
		 Map<String, Object> map = new HashMap<String, Object>();
		List<Object> params=new ArrayList<Object>();
		params.add(loginid);
		map=SqlHelper.returnSimpleResult(sql, params);
		UserInfo info=new UserInfo();
		if(map.size()>0)
		{
			info.setCardid(map.get("CARDID").toString());
			info.setContact(map.get("CONTACT").toString());
			info.setHead(map.get("HEAD").toString());
			info.setName(map.get("NAME").toString());
			info.setEmail(map.get("EMAIL").toString());
			info.setGender(Integer.valueOf(map.get("GENDER").toString()));
			Users user=new Users();
			user.setLoginid(map.get("LOGINID").toString());
			user.setPwd(map.get("PWD").toString());
			info.setUser(user);
		}
		return info;
	}

	@Override
	public boolean updUserInfo(UserInfo userDetail) {
		// TODO Auto-generated method stub
		String sql="update userinfo " +
				"set cardid=?,name=?,gender=?, email=? " +
				"where userid=(select id FROM users WHERE loginid=?)";
		List<Object> list=new ArrayList<Object>();
		list.add(userDetail.getCardid());
		list.add(userDetail.getName());
		list.add(userDetail.getGender());
		list.add(userDetail.getEmail());
		list.add(userDetail.getUser().getLoginid());
		return SqlHelper.Execute(sql, list);
	}

	@Override
	public boolean setUserInfo(Users user) {
		// TODO Auto-generated method stub
		String sql="insert into UserInfo(userid,contact) values(?,?)";
		List<Object> params =new ArrayList<Object>();
		params.add(user.getId());
		params.add(user.getLoginid());
		return SqlHelper.Execute(sql, params);
	}

	@Override
	public boolean updHead(String headaddress,int userid) {
		// TODO Auto-generated method stub
		String sql="update userinfo set head=? where userid=?";
		List<Object> params =new ArrayList<Object>();
		params.add(headaddress);
		params.add(userid);
		return SqlHelper.Execute(sql, params);
	}

	@Override
	public List<Map<String,Integer>> countUser() {
		List<Map<String,Integer>> listReturn=new ArrayList<Map<String,Integer>>();
		
		String sql="select top 12 year(REGISTER) as YEAR," +
				"month(REGISTER) as MONTH," +
				"count(*) as COUNT " +
				"from UserInfo " +
				"group by year(REGISTER), month(REGISTER) " +
				"order by year(REGISTER), month(REGISTER) desc";
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list=SqlHelper.returnMultipleResult(sql, null);
		if(list.size()>0)
		{
			for(Map<String,Object> map:list){
				Map<String,Integer> mapReturn =new HashMap<String,Integer>();
				mapReturn.put("year", Integer.parseInt( map.get("YEAR").toString()));
				mapReturn.put("month", Integer.parseInt( map.get("MONTH").toString()));
				mapReturn.put("count", Integer.parseInt( map.get("COUNT").toString()));
				listReturn.add(mapReturn);
			}
		}
		return listReturn;
		
	}
	
	
	
	
	@Override
	public List<Map<String,Integer>> countVisit() {
		List<Map<String,Integer>> listReturn=new ArrayList<Map<String,Integer>>();
		
		String sql="select top 12 year(DATES) as YEAR," +
				"month(DATES) as MONTH," +
				"sum(VISITNUM) as SUM " +
				"from VisitRecord " +
				"group by year(DATES), month(DATES) " +
				"order by year(DATES), month(DATES) desc";
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list=SqlHelper.returnMultipleResult(sql, null);
		if(list.size()>0)
		{
			for(Map<String,Object> map:list){
				Map<String,Integer> mapReturn =new HashMap<String,Integer>();
				mapReturn.put("year", Integer.parseInt( map.get("YEAR").toString()));
				mapReturn.put("month", Integer.parseInt( map.get("MONTH").toString()));
				mapReturn.put("sum", Integer.parseInt( map.get("SUM").toString()));
				listReturn.add(mapReturn);
			}
		}
		return listReturn;
		
	}

}
