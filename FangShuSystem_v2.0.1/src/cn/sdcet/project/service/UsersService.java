package cn.sdcet.project.service;

import cn.sdcet.project.dao.jdbc.*;
import cn.sdcet.project.domain.Users;

public class UsersService {

	/**
	 * ��½
	 * @param user
	 * @return �Ƿ�ע��ɹ�
	 */
	public boolean login(Users user){
		UsersDaoJDBCImpl userdao=new  UsersDaoJDBCImpl();
		return userdao.CheckPwdAndLoginId(user);
	}
	/**
	 * ע��
	 * @param user
	 * @return ������Ϣ
	 */
	public String register(Users user){
		UsersDaoJDBCImpl userdao=new  UsersDaoJDBCImpl();
		if(userdao.isExist(user.getLoginid())){
			return "���ֻ������ѱ�ע��";
		}else {
			if(	userdao.insertUser(user))
			{
				int userid=userdao.getNewUserId(user.getLoginid());
				user.setId(userid);
				UserInfoDaoJDBCImpl infoDao=new UserInfoDaoJDBCImpl();
				if(infoDao.setUserInfo(user)){
					return "ע��ɹ�";	
				}else{
					return "��ѽ ϵͳ������";
				}
			}else
			{
				return "��ѽ ϵͳ������";
			}
		}	
	}
	
	/**
	 * ���������޸�����
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
	 * �޸�����
	 * @param user  user ��½��Ϣ
	 * @param newPwd ������
	 * @return ������Ϣ
	 */
	public String updPwd(Users user,String newPwd){
		UsersDaoJDBCImpl userdao=new  UsersDaoJDBCImpl();
		
		if(userdao.CheckPwdAndLoginId(user))
		{
			user.setPwd(newPwd);
			if(userdao.updPWD(user)){
				return "�޸ĳɹ�";
			}
			else{
				return "��ѽ��ϵͳ������";
			}
		}else{
			return "�������";
		}
		
	}
	
	/**
	 * ��ȡ�ող�����û��ı�ţ�id��
	 * @param loginid �û���¼��
	 * @return �û���ţ�id��
	 */
	public int getNewUserId(String loginid) {
		UsersDaoJDBCImpl userdao=new  UsersDaoJDBCImpl();
		return userdao.getNewUserId(loginid);
	}
	
}
