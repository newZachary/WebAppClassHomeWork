package cn.sdcet.project.web;

import org.apache.commons.fileupload.ProgressListener;

public class UploadListener implements ProgressListener {
	private UploadStatus status;
	
	public UploadListener(UploadStatus status) {
		this.status = status;
	}

	@Override
	public void update(long pBytesRead, long pContentLength, int pItems) {
		status.setBytesRead(pBytesRead);
		status.setContentLength(pContentLength);
		status.setItems(pItems);
		status.setProgress((int)(pBytesRead*100/pContentLength));
	}

}
