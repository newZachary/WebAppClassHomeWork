package cn.sdcet.project.util;

import java.util.List;

public class PageHelper<T> {

	/** 当前页码 */
	private int currentPage;
	/** 每页显示的记录数量 */
	private int pageSize;
	/** 总记录数 */
	private int recordCount;
	/** 当前页的数据列表 */
	//private List<T> recordList;

	/** 总页数 */
	private int pageCount;
	/** 页码列表的开始索引（包含） */
	private int beginPageIndex;
	/** 页码列表的结束索引（不包含） */
	private int endPageIndex;

	
	//public PageHelper(int currentPage, int pageSize, int recordCount,List<T> recordList) {
		public PageHelper(int currentPage, int pageSize, int recordCount) {
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.recordCount = recordCount;
		//this.recordList = recordList;
		
		//计算总页数
		pageCount = (recordCount + pageSize - 1) / pageSize;
		
		//计算开始索引和结束索引
		//默认显示10个页码，按照（前4个+ 当前页 + 后5页）的方式
		if(pageCount <= 10) {
			//总页数不多于10页，全部显示
			beginPageIndex = 1;
			endPageIndex = pageCount;
		} else {
			//总页数多于10页
			beginPageIndex = currentPage - 4;
			endPageIndex = currentPage + 5;
			
			if(beginPageIndex < 1) {
				//当前页的前面页码数量不足4个，则显示前10页
				beginPageIndex = 1;
				endPageIndex = 10;
			}
			
			if(endPageIndex > pageCount) {
				//当前页的后面页码数量不足5个，则显示最后10页
				endPageIndex = pageCount;
				beginPageIndex = pageCount - 10 + 1;
			}
		}
		
	}
	
	/**
	 * 下一页的页码 
	 */
	public int nextPage() {
		int nextPage = currentPage;
		nextPage++;
		if(nextPage > pageCount) {
			nextPage = pageCount;
		}
		return nextPage;
	}

	/**
	 * 上一页的页码 
	 */
	public int prevPage() {
		int prevPage = currentPage;
		prevPage--;
		if(prevPage < 1) {
			prevPage = 1;
		}
		return prevPage;
	}
	
	/**
	 * 当前页是否是第一页
	 */
	public boolean isFirstPage() {
		return currentPage == 1;
	}
	
	/**
	 * 当前页是否是最后一页
	 */
	public boolean isLastPage() {
		return currentPage == pageCount;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}

	//public List<T> getRecordList() {
	//	return recordList;
	//}

	//public void setRecordList(List<T> recordList) {
	//	this.recordList = recordList;
	//}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getBeginPageIndex() {
		return beginPageIndex;
	}

	public void setBeginPageIndex(int beginPageIndex) {
		this.beginPageIndex = beginPageIndex;
	}

	public int getEndPageIndex() {
		return endPageIndex;
	}

	public void setEndPageIndex(int endPageIndex) {
		this.endPageIndex = endPageIndex;
	}

}
