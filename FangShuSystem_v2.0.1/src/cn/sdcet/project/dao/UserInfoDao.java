package cn.sdcet.project.dao;


import java.util.List;
import java.util.Map;

import cn.sdcet.project.domain.UserInfo;
import cn.sdcet.project.domain.Users;

public interface UserInfoDao {

	/**
	 * 获取该用户详细信息
	 * @param loginid 用户名(登陆账号)
	 * @return 姓名电话详细信息等
	 */
	public UserInfo getUserInfo(String loginid);
	
	/**
	 * 添加信息
	 * @param user 用户信息
	 * @return
	 */
	public boolean setUserInfo(Users user);
	
	/**
	 * 修改个人信息
	 * @param userDetail 用户详细信息
	 * @return 是否成功
	 */
	public boolean updUserInfo(UserInfo userDetail);
	
	/***
	 * 修改头像
	 * @param headaddress 头像上传地址
	 * @param userid 用户编号
	 * @return 是否修改成功
	 */
	public boolean updHead(String headaddress,int userid);
	
	
	/**
	 * 获取每年每月注册人数
	 * @return
	 */
	public List<Map<String,Integer>> countUser();
	
	/**
	 * 获取每年每月访问人数
	 * @return
	 */
	public List<Map<String,Integer>> countVisit();

}
