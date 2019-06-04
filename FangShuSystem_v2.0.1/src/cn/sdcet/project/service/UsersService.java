package cn.sdcet.project.service;

import cn.sdcet.project.dao.jdbc.*;
import cn.sdcet.project.domain.Users;

public class UsersService {

	/**
	 * 登陆
	 * @param user
	 * @return 是否注册成功
	 */
	public boolean login(Users user){
		UsersDaoJDBCImpl userdao=new  UsersDaoJDBCImpl();
		return userdao.CheckPwdAndLoginId(user);
	}
	/**
	 * 注册
	 * @param user
	 * @return 反馈信息
	 */
	public String register(Users user){
		UsersDaoJDBCImpl userdao=new  UsersDaoJDBCImpl();
		if(userdao.isExist(user.getLoginid())){
			return "该手机号码已被注册";
		}else {
			if(	userdao.insertUser(user))
			{
				int userid=userdao.getNewUserId(user.getLoginid());
				user.setId(userid);
				UserInfoDaoJDBCImpl infoDao=new UserInfoDaoJDBCImpl();
				if(infoDao.setUserInfo(user)){
					return "注册成功";	
				}else{
					return "哎呀 系统生病了";
				}
			}else
			{
				return "哎呀 系统生病了";
			}
		}	
	}
	
	/**
	 * 忘记密码修改密码
	 * @param user
	 * @return
	 */
	public boolean forgerPwd(Users user)
	{
		UsersDaoJDBCImpl userdao=new  UsersDaoJDBCImpl();
		if(userdao.updPWD(user)){
			return true;
		}
		else
		{
			return false;
		}
	}
	
	/**
	 * 修改密码
	 * @param user  user 登陆信息
	 * @param newPwd 新密码
	 * @return 反馈信息
	 */
	public String updPwd(Users user,String newPwd){
		UsersDaoJDBCImpl userdao=new  UsersDaoJDBCImpl();
		
		if(userdao.CheckPwdAndLoginId(user))
		{
			user.setPwd(newPwd);
			if(userdao.updPWD(user)){
				return "修改成功";
			}
			else{
				return "哎呀，系统生病了";
			}
		}else{
			return "密码错误";
		}
		
	}
	
	/**
	 * 获取刚刚插入的用户的编号（id）
	 * @param loginid 用户登录名
	 * @return 用户编号（id）
	 */
	public int getNewUserId(String loginid) {
		UsersDaoJDBCImpl userdao=new  UsersDaoJDBCImpl();
		return userdao.getNewUserId(loginid);
	}
	
}
