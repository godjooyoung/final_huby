package co.huby.prj.memberVideo.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component("download")
public class DownloadView extends AbstractView {

	public DownloadView() {
		setContentType("applicaiton/download;charset=utf-8");

	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		File file = (File) model.get("downloadFile");
		System.out.println("asdfasdf");
		response.setContentType(getContentType());
		// response.setContentLength((int) file.length());
		String fileName = java.net.URLEncoder.encode(file.getName(), "UTF-8");
		response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;

		// if(request.getHeader("User-Agent").indexOf("MSIE") > -1){
		//
		// fileName = URLEncoder.encode(file.getName(), "utf-8");
		//
		// } else {
		//
		// fileName = new String(file.getName().getBytes("utf-8"));
		// }

		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);

		} catch (Exception e) {
			System.out.println("[다운로드] 예외 " + e.getMessage());
			e.printStackTrace();

		} finally {

			if (fis != null) {

				try {
					fis.close();
				} catch (Exception e2) {
				}
			}

		}

		out.flush();

	}

}
