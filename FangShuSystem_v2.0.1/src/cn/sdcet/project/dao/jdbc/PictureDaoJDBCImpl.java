package cn.sdcet.project.dao.jdbc;

import java.util.*;

import cn.sdcet.project.dao.PictureDao;
import cn.sdcet.project.domain.Picture;
import cn.sdcet.project.util.SqlHelper;

public class PictureDaoJDBCImpl implements PictureDao {

	@Override
	public List<Picture> getPicture(int houseid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> selectPictures(int houseId) {
		// TODO Auto-generated method stub
		List<String> picList=new ArrayList<String>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		String sql="select * from picture where houseid=? order by id";
		List<Object> params=new ArrayList<Object>();
		params.add(houseId);
		list=SqlHelper.returnMultipleResult(sql, params);
		if(list.size()>0){
			for(Map<String,Object> map:list){
				picList.add(map.get("PICADDRESS").toString());
			}
		}
		return picList;
	}

	@Override
	public String selectPictureFirst(int houseId) {
		// TODO Auto-generated method stub
		String address="";
		List<Object> params=new ArrayList<Object>();
		params.add(houseId);
		String sql="select TOP 1 * from picture where houseid=?";
		//String sql="select * from picture where houseid=? and ROWNUM<=1";
		Map<String,Object> map=new HashMap<String,Object>();
		
		map=SqlHelper.returnSimpleResult(sql, params);
		if(map.size()>0){
			address=map.get("PICADDRESS").toString();
		}else{
			address="images/defult.jpg";
		}
		return address;
	}

	@Override
	public boolean setPicture(Picture picture) {
		// TODO Auto-generated method stub
		String sql="insert into PICTURE(houseid,PICADDRESS) values(?,?)";
		List<Object> params=new ArrayList<Object>();
		params.add(picture.getHouseId().getId());
		params.add(picture.getPicaddress());
		return SqlHelper.Execute(sql, params);
		
	}

	@Override
	public boolean delPicture(int houseid) {
		// TODO Auto-generated method stub
		String sql="delete from picture where houseid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(houseid);
		return SqlHelper.Execute(sql, params);
	}

}
