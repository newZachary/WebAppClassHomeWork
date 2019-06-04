package cn.sdcet.project.dao;

import java.util.List;

import cn.sdcet.project.domain.*;

public interface PictureDao {
	/**
	 * 获取房屋图片
	 * @param houseid
	 * @return 房屋图片对象集合
	 */
	public List<Picture> getPicture(int houseid);
	
	/**
	 * 获取房屋图片
	 * @param houseid
	 * @return 房屋图片地址字符串集合
	 */
	public List<String> selectPictures(int houseId);
	
	/**
	 * 获取一张别墅图片
	 * @param houseId
	 * @return 房屋图片地址字符串
	 */
	public String selectPictureFirst(int houseId);
	
	/**
	 * 添加房屋图片
	 * @param houseid
	 * @return
	 */
	public boolean setPicture(Picture picture);
	public boolean delPicture(int houseid);
}
