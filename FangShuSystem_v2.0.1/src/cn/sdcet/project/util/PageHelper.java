package cn.sdcet.project.util;

import java.util.List;

public class PageHelper<T> {

	/** ��ǰҳ�� */
	private int currentPage;
	/** ÿҳ��ʾ�ļ�¼���� */
	private int pageSize;
	/** �ܼ�¼�� */
	private int recordCount;
	/** ��ǰҳ�������б� */
	//private List<T> recordList;

	/** ��ҳ�� */
	private int pageCount;
	/** ҳ���б�Ŀ�ʼ������������ */
	private int beginPageIndex;
	/** ҳ���б�Ľ����������������� */
	private int endPageIndex;

	
	//public PageHelper(int currentPage, int pageSize, int recordCount,List<T> recordList) {
		public PageHelper(int currentPage, int pageSize, int recordCount) {
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.recordCount = recordCount;
		//this.recordList = recordList;
		
		//������ҳ��
		pageCount = (recordCount + pageSize - 1) / pageSize;
		
		//���㿪ʼ�����ͽ�������
		//Ĭ����ʾ10��ҳ�룬���գ�ǰ4��+ ��ǰҳ + ��5ҳ���ķ�ʽ
		if(pageCount <= 10) {
			//��ҳ��������10ҳ��ȫ����ʾ
			beginPageIndex = 1;
			endPageIndex = pageCount;
		} else {
			//��ҳ������10ҳ
			beginPageIndex = currentPage - 4;
			endPageIndex = currentPage + 5;
			
			if(beginPageIndex < 1) {
				//��ǰҳ��ǰ��ҳ����������4��������ʾǰ10ҳ
				beginPageIndex = 1;
				endPageIndex = 10;
			}
			
			if(endPageIndex > pageCount) {
				//��ǰҳ�ĺ���ҳ����������5��������ʾ���10ҳ
				endPageIndex = pageCount;
				beginPageIndex = pageCount - 10 + 1;
			}
		}
		
	}
	
	/**
	 * ��һҳ��ҳ�� 
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
	 * ��һҳ��ҳ�� 
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
	 * ��ǰҳ�Ƿ��ǵ�һҳ
	 */
	public boolean isFirstPage() {
		return currentPage == 1;
	}
	
	/**
	 * ��ǰҳ�Ƿ������һҳ
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
