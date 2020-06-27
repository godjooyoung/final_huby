package co.huby.prj.board.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.vo.QuestionVo;

@MapperScan
public interface QuestionMap {

	List<Map> getSelectQuestionCompany(QuestionVo vo) throws Exception;

	List<Map> getSelectQuestionMember(QuestionVo vo) throws Exception;

	int insertQuestionCompany(QuestionVo vo) throws Exception;

	int insertQuestionMember(QuestionVo vo) throws Exception;
	
	List<QuestionVo> qnaSelectAll() throws Exception;

	QuestionVo getSelectQuestion(QuestionVo vo) throws Exception;
	
	int qUpdateAdmin(QuestionVo vo) throws Exception;
}
