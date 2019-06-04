package cn.sdcet.project.dao.jdbc;


import java.util.*;

import cn.sdcet.project.dao.UsersDao;
import cn.sdcet.project.domain.Users;
import cn.sdcet.project.util.*;;

public class UsersDaoJDBCImpl implements UsersDao {


	@Override
	public boolean CheckPwdAndLoginId(Users user) {
		List<Object> params =new ArrayList<Object>();
		boolean flag=false;
		params.add(user.getLoginid());
		params.add(user.getPwd());
		String sql="select count(*) as COUNT from users where Loginid=? and pwd=?";
		Map<String,Object> count=SqlHelper.returnSimpleResult(sql, params);
		int counts=Integer.parseInt(count.get("COUNT").toString());
		if(counts==1){
			flag=true;
		}
		return flag;

	}

	@Override
	public boolean updPWD(Users user) {
		// TODO Auto-generated method stub
		String sql="update users set pwd=? where loginid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(user.getPwd());
		params.add(user.getLoginid());
		
		return SqlHelper.Execute(sql, params);
	}

	@Override
	public boolean insertUser(Users user) {
		// TODO Auto-generated method stub
		String sql="insert into USERS(LOGINID,pwd) VALUES(?,?)";
		List<Object> params=new ArrayList<Object>();
		params.add(user.getLoginid());
		params.add(user.getPwd());
		return SqlHelper.Execute(sql, params);
	}

	@Override
	public boolean isExist(String loginId) {
		// TODO Auto-generated method stub
		List<Object> params =new ArrayList<Object>();
		String  sql="select count(*) as COUNT from users where Loginid=? ";
		boolean flag=false;
		params.add(loginId);
		Map<String,Object> count=SqlHelper.returnSimpleResult(sql, params);
		if(count.size()>0){
			if(Integer.parseInt(count.get("COUNT").toString())==1){
				flag=true;
			}
		}
		return flag;
	}
	@Override
	public int getNewUserId(String loginid) {
		// TODO Auto-generated method stub
		int id=0;
		String sql="select ID from users where loginid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(loginid);
		Map<String, Object> map = new HashMap<String, Object>();
		map=SqlHelper.returnSimpleResult(sql, params);
		if(map.size()>0)
		{
			id=Integer.valueOf( map.get("ID").toString());
		}
		return id;
	}



}
