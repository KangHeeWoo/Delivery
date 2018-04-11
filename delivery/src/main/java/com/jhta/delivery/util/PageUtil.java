package com.jhta.delivery.util;

public class PageUtil {
	private int pageNum;		//����������
	private int startRow;		//�������ȣ
	private int endRow;			//�����ȣ
	private int totalPageCount;	//��ü������ ����
	private int startPageNum;	//������������ȣ
	private int endPageNum;		//����������ȣ
	private int rowBlockCount;	//���������� ������ ���� ����
	private int pageBlockCount;	//���������� ������ ������ ����
	private int totalRowCount;	//��ü���� ����
	
	public PageUtil() {}
	public PageUtil(int pageNum, int rowBlockCount, int pageBlockCount, int totalRowCount) {
		this.pageNum = pageNum;
		this.rowBlockCount = rowBlockCount;
		this.pageBlockCount = pageBlockCount;
		this.totalRowCount = totalRowCount;
		
		startRow = (pageNum-1) * rowBlockCount + 1;
		endRow = startRow + rowBlockCount -1;
		totalPageCount = (int)Math.ceil(totalRowCount/(double)rowBlockCount);
		if(totalPageCount == 0) totalPageCount = 1;
		startPageNum = (pageNum-1)/pageBlockCount*pageBlockCount + 1;
		endPageNum = startPageNum + pageBlockCount - 1;
		if(endPageNum > totalPageCount) endPageNum = totalPageCount;
	}
	public int getPageNum() {
		return pageNum;
	}
	public int getStartRow() {
		return startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public int getEndPageNum() {
		return endPageNum;
	}
	public int getRowBlockCount() {
		return rowBlockCount;
	}
	public int getPageBlockCount() {
		return pageBlockCount;
	}
	public int getTotalRowCount() {
		return totalRowCount;
	}
	@Override
	public String toString() {
		return "PageUtil [pageNum=" + pageNum + ", startRow=" + startRow + ", endRow=" + endRow + ", totalPageCount="
				+ totalPageCount + ", startPageNum=" + startPageNum + ", endPageNum=" + endPageNum + ", rowBlockCount="
				+ rowBlockCount + ", pageBlockCount=" + pageBlockCount + ", totalRowCount=" + totalRowCount + "]";
	}
}
