package cn.sdcet.project.web;

/**
 * 保存上传文件的信息
 */
public class UploadStatus {
	public static final int STATUS_UPLOADING = 1; // 正在上传
	public static final int STATUS_UPLOAD_SUCCESS = 2; // 上传成功
	public static final int STATUS_UPLOAD_ERROR = 3; // 上传失败

	/** 已经读取的字节数 */
	private long bytesRead;
	/** 文件总长度 */
	private long contentLength;
	/** 正在保存第几个文件 */
	private int items;

	/** 上传状态代码 */
	private int code;

	/** 上传状态描述 */
	private String descript;

	/** 已经完成的百分比 */
	private int progress;

	public long getBytesRead() {
		return bytesRead;
	}

	public void setBytesRead(long bytesRead) {
		this.bytesRead = bytesRead;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}

	public int getItems() {
		return items;
	}

	public void setItems(int items) {
		this.items = items;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
		switch (code) {
		case STATUS_UPLOADING:
			descript = "正在上传......";
			break;
		case STATUS_UPLOAD_SUCCESS:
			descript = "上传成功";
			break;
		case STATUS_UPLOAD_ERROR:
			descript = "上传失败";
			break;
		default:
			break;
		}
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}
	
	/**
	 * 附加描述信息
	 * @param message
	 */
	public void addMessage(String message) {
		descript += ":" + message;
	}

}
