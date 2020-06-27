package co.huby.prj.board.service;

import java.util.List;
import java.util.Map;

import co.huby.prj.vo.QuestionVo;

public interface QuestionService {

	List<Map> getSelectQuestionCompany(QuestionVo vo) throws Exception;

	List<Map> getSelectQuestionMember(QuestionVo vo) throws Exception;

	int qInsertCompany(QuestionVo vo) throws Exception;

	int qInsertMember(QuestionVo vo) throws Exception;
}
