package co.huby.prj.code.service;

import java.util.List;

public interface CodeService {

	List<CodeVo> SelectAll() throws Exception;
	void codeInsert(CodeVo vo) throws Exception;
	List<CodeVo> selectRegionName();
}
