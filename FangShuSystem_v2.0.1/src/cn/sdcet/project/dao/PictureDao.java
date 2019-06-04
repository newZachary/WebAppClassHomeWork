package cn.sdcet.project.dao;

import java.util.List;

import cn.sdcet.project.domain.*;

public interface PictureDao {
	/**
	 * ��ȡ����ͼƬ
	 * @param houseid
	 * @return ����ͼƬ���󼯺�
	 */
	public List<Picture> getPicture(int houseid);
	
	/**
	 * ��ȡ����ͼƬ
	 * @param houseid
	 * @return ����ͼƬ��ַ�ַ�������
	 */
	public List<String> selectPictures(int houseId);
	
	/**
	 * ��ȡһ�ű���ͼƬ
	 * @param houseId
	 * @return ����ͼƬ��ַ�ַ���
	 */
	public String selectPictureFirst(int houseId);
	
	/**
	 * ��ӷ���ͼƬ
	 * @param houseid
	 * @return
	 */
	public boolean setPicture(Picture picture);
	public boolean delPicture(int houseid);
}
