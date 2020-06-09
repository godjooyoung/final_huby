package co.huby.prj.code;

import java.io.UnsupportedEncodingException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class CodeService {

	public Object getItemsFromOpenApi(String api, String JOB_TYPE, String job_dic_list) throws UnsupportedEncodingException {

		String url = "www.career.go.kr/cnet/openapi/getOpenApi.json";

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();

		UriComponents builder = UriComponentsBuilder.fromHttpUrl(url)
				.queryParam("apiKey", "1ecc1a8cc61235aeaf93973b8a820625")
				.queryParam("svcType", api)
				.queryParam("svcCode", JOB_TYPE)
				.queryParam("gubun", job_dic_list)
				.queryParam("contentType", "json")
				.build(false);
		// 자동으로 encode해주는것을 막기위해false

		Object response = restTemplate.exchange(builder.toUriString(), HttpMethod.GET, new HttpEntity<String>(headers),	String.class);
		return response;
	}
}
