package cn.sdcet.project.service;

import java.util.List;
import java.util.Map;

import cn.sdcet.project.dao.jdbc.UserInfoDaoJDBCImpl;
import cn.sdcet.project.domain.UserInfo;
import cn.sdcet.project.domain.Users;

public class UserInfoService {
	/**
	 * 获取该用户详细信息
	 * @param userid 用户名(登陆账号)
	 * @return 姓名电话详细信息等
	 */
	public UserInfo getUserInfo(String loginid) {
		UserInfoDaoJDBCImpl userinfoDao=new UserInfoDaoJDBCImpl();
		return userinfoDao.getUserInfo(loginid);
	}
	/**
	 * 修改个人信息
	 * @param userDetail 用户详细信息
	 * @return 是否成功
	 */
	public boolean updUserInfo(UserInfo userDetail) {
		UserInfoDaoJDBCImpl userinfoDao=new UserInfoDaoJDBCImpl();
		return userinfoDao.updUserInfo(userDetail);
	}
	
	/**
	 * 添加信息
	 * @param user 用户信息
	 * @return
	 */
	public boolean setUserInfo(Users user) {
		UserInfoDaoJDBCImpl userinfoDao=new UserInfoDaoJDBCImpl();
		return userinfoDao.setUserInfo(user);
	}
	
	public boolean updHead(String headaddress,int userid) {
		UserInfoDaoJDBCImpl userinfoDao=new UserInfoDaoJDBCImpl();
		return userinfoDao.updHead(headaddress,userid);
	}
	
	
	/**
	 * 查询最近12个月用户注册情况
	 * @return
	 */
	public List<Map<String,Integer>> countUser(){
		UserInfoDaoJDBCImpl userinfoDao=new UserInfoDaoJDBCImpl();
		return userinfoDao.countUser();
	}
	
	/**
	 * 查询最近12个月用户访问情况
	 * @return
	 */
	public List<Map<String,Integer>> countVisit(){
		UserInfoDaoJDBCImpl userinfoDao=new UserInfoDaoJDBCImpl();
		return userinfoDao.countVisit();
	}
}
