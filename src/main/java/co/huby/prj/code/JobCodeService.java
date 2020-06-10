package co.huby.prj.code;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import co.huby.prj.code.mapper.CodeMap;
import co.huby.prj.code.service.CodeVo;

@Service
public class JobCodeService {

	@Autowired
	private CodeMap map;
	private CodeVo vo;

	public Object getItemsFromOpenApi(String api, String JOB_TYPE, String job_dic_list)
			throws UnsupportedEncodingException {

		String url = "http://www.career.go.kr/cnet/openapi/getOpenApi.json?";

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<?> entity = new HttpEntity<Object>(headers);

		UriComponents builder = UriComponentsBuilder.fromHttpUrl(url)
				.queryParam("apiKey", "1ecc1a8cc61235aeaf93973b8a820625").queryParam("svcType", "api")
				.queryParam("svcCode", "JOB_TYPE").queryParam("gubun", "job_dic_list").queryParam("contentType", "json")
				.build(false);
		// 자동으로 encode해주는것을 막기위해false

		ResponseEntity<Map> resultMap = restTemplate.exchange(builder.toString(), HttpMethod.GET, entity, Map.class);
		System.out.println(resultMap.getBody());
		LinkedHashMap code = (LinkedHashMap) resultMap.getBody().get("dataSearch");
		ArrayList<Map> codeName = (ArrayList<Map>) code.get("content");

		for (Map obj : codeName) {
			System.out.println(obj.get("jbgp_code") + ":" + obj.get("jbgp_code_nm"));
			vo = new CodeVo();
			// db insert
			vo.setCode_id((String) obj.get("jbgp_code"));
			vo.setCode_name((String) obj.get("jbgp_code_nm"));
			try {
				map.codeInsert(vo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return resultMap;
	}
}
