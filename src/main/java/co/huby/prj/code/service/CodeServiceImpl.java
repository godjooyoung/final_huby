package co.huby.prj.code.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.code.mapper.CodeMap;

@Service("codeService")
public class CodeServiceImpl implements CodeService {

	@Autowired
	private CodeMap map;
	
	@Override
	public List<CodeVo> SelectAll() throws Exception {
		// TODO Auto-generated method stub
		return map.SelectAll();
	}

	@Override
	public void codeInsert(CodeVo vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<CodeVo> selectRegionName() {
		// TODO Auto-generated method stub
		return map.selectRegionName();
	}

	@Override
	public CodeVo get_codeAll(CodeVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.get_codeAll(vo);
	}

}
