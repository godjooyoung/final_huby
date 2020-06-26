package co.huby.prj.board.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.vo.QuestionVo;

@MapperScan
public interface QuestionMap {

	List<Map> getSelectQuestionCompany(QuestionVo vo) throws Exception;

	List<Map> getSelectQuestionMember(QuestionVo vo) throws Exception;

	void qInsertCompany(QuestionVo vo) throws Exception;

	void qInsertMember(QuestionVo vo) throws Exception;

}
