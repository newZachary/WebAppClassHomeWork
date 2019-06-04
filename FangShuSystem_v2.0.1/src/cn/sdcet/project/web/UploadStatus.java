package cn.sdcet.project.web;

/**
 * �����ϴ��ļ�����Ϣ
 */
public class UploadStatus {
	public static final int STATUS_UPLOADING = 1; // �����ϴ�
	public static final int STATUS_UPLOAD_SUCCESS = 2; // �ϴ��ɹ�
	public static final int STATUS_UPLOAD_ERROR = 3; // �ϴ�ʧ��

	/** �Ѿ���ȡ���ֽ��� */
	private long bytesRead;
	/** �ļ��ܳ��� */
	private long contentLength;
	/** ���ڱ���ڼ����ļ� */
	private int items;

	/** �ϴ�״̬���� */
	private int code;

	/** �ϴ�״̬���� */
	private String descript;

	/** �Ѿ���ɵİٷֱ� */
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
			descript = "�����ϴ�......";
			break;
		case STATUS_UPLOAD_SUCCESS:
			descript = "�ϴ��ɹ�";
			break;
		case STATUS_UPLOAD_ERROR:
			descript = "�ϴ�ʧ��";
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
	 * ����������Ϣ
	 * @param message
	 */
	public void addMessage(String message) {
		descript += ":" + message;
	}

}
