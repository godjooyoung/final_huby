package co.huby.prj.board.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.board.mapper.QuestionMap;
import co.huby.prj.board.service.QuestionService;
import co.huby.prj.vo.QuestionVo;

@Service("questionService")
public class QuestionImpl implements QuestionService {

	@Autowired
	private QuestionMap map;

	@Override
	public List<Map> getSelectQuestionCompany(QuestionVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.getSelectQuestionMember(vo);
	}

	@Override
	public List<Map> getSelectQuestionMember(QuestionVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.getSelectQuestionMember(vo);
	}

	@Override
	public void qInsertCompany(QuestionVo vo) throws Exception {
		// TODO Auto-generated method stub
		map.qInsertCompany(vo);
	}

	@Override
	public void qInsertMember(QuestionVo vo) throws Exception {
		// TODO Auto-generated method stub
		map.qInsertMember(vo);
	}

}
