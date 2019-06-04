package cn.sdcet.project.service;

import java.util.List;
import java.util.Map;

import cn.sdcet.project.dao.jdbc.UserInfoDaoJDBCImpl;
import cn.sdcet.project.domain.UserInfo;
import cn.sdcet.project.domain.Users;

public class UserInfoService {
	/**
	 * ��ȡ���û���ϸ��Ϣ
	 * @param userid �û���(��½�˺�)
	 * @return �����绰��ϸ��Ϣ��
	 */
	public UserInfo getUserInfo(String loginid) {
		UserInfoDaoJDBCImpl userinfoDao=new UserInfoDaoJDBCImpl();
		return userinfoDao.getUserInfo(loginid);
	}
	/**
	 * �޸ĸ�����Ϣ
	 * @param userDetail �û���ϸ��Ϣ
	 * @return �Ƿ�ɹ�
	 */
	public boolean updUserInfo(UserInfo userDetail) {
		UserInfoDaoJDBCImpl userinfoDao=new UserInfoDaoJDBCImpl();
		return userinfoDao.updUserInfo(userDetail);
	}
	
	/**
	 * �����Ϣ
	 * @param user �û���Ϣ
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
	 * ��ѯ���12�����û�ע�����
	 * @return
	 */
	public List<Map<String,Integer>> countUser(){
		UserInfoDaoJDBCImpl userinfoDao=new UserInfoDaoJDBCImpl();
		return userinfoDao.countUser();
	}
	
	/**
	 * ��ѯ���12�����û��������
	 * @return
	 */
	public List<Map<String,Integer>> countVisit(){
		UserInfoDaoJDBCImpl userinfoDao=new UserInfoDaoJDBCImpl();
		return userinfoDao.countVisit();
	}
}
