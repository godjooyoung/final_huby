package co.huby.prj.member.mapper;

import org.mybatis.spring.annotation.MapperScan;
import co.huby.prj.member.service.MemberService;

@MapperScan
public interface MemberMap extends MemberService {

}
