package co.huby.prj.memberVideo.mapper;

import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.vo.VideoVo;

@MapperScan("map")
public interface MemberVideoMap {
	
	void memberVideoInsert(HashMap<String, String> map) throws Exception;

}
