package cn.sdcet.project.dao;


import java.util.List;
import java.util.Map;

import cn.sdcet.project.domain.UserInfo;
import cn.sdcet.project.domain.Users;

public interface UserInfoDao {

	/**
	 * ��ȡ���û���ϸ��Ϣ
	 * @param loginid �û���(��½�˺�)
	 * @return �����绰��ϸ��Ϣ��
	 */
	public UserInfo getUserInfo(String loginid);
	
	/**
	 * �����Ϣ
	 * @param user �û���Ϣ
	 * @return
	 */
	public boolean setUserInfo(Users user);
	
	/**
	 * �޸ĸ�����Ϣ
	 * @param userDetail �û���ϸ��Ϣ
	 * @return �Ƿ�ɹ�
	 */
	public boolean updUserInfo(UserInfo userDetail);
	
	/***
	 * �޸�ͷ��
	 * @param headaddress ͷ���ϴ���ַ
	 * @param userid �û����
	 * @return �Ƿ��޸ĳɹ�
	 */
	public boolean updHead(String headaddress,int userid);
	
	
	/**
	 * ��ȡÿ��ÿ��ע������
	 * @return
	 */
	public List<Map<String,Integer>> countUser();
	
	/**
	 * ��ȡÿ��ÿ�·�������
	 * @return
	 */
	public List<Map<String,Integer>> countVisit();

}
