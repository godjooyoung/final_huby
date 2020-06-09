package co.huby.prj.board.serviceImpl;

/**public class ImplNotice {
	~~임플.java 가 들어가는 패키지임. 임플의 내용은 대충 아래와 같다.
	package co.huby.prj.board.serviceImpl;

	import java.util.List;

	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Service;

	import co.sin.prj.common.LogAop;
	import co.sin.prj.user.mapper.MemberMap;
	import co.sin.prj.user.service.MemberService;
	import co.sin.prj.user.service.MemberVO;


	@Service("memberService")
	public class MemberServiceImpl implements MemberService {

		@Autowired
		private MemberMap map;//dao클래스처럼 사용한다.
		
		@Override
		public List<MemberVO> getSelectList() throws Exception {
			
			return map.getSelectList();
		}

		@Override
		public MemberVO getSelect(MemberVO vo) throws Exception {
		
			return map.getSelect(vo);
		}

		@Override
		public void memberInsert(MemberVO vo) throws Exception {
			// TODO Auto-generated method stub
			map.memberInsert(vo);
		}

		@Override
		public void memberUpdate(MemberVO vo) throws Exception {
			// TODO Auto-generated method stub
			map.memberUpdate(vo);
		}

		@Override
		public void memberDelete(MemberVO vo) throws Exception {
			// TODO Auto-generated method stub
			map.memberDelete(vo);
		}

		@Override
		public MemberVO memberLoginCheck(MemberVO vo) throws Exception {
			// TODO Auto-generated method stub
			return map.memberLoginCheck(vo);
		}

		@Override
		public MemberVO memberSearch(MemberVO vo) throws Exception {
			// TODO Auto-generated method stub
			return map.memberSearch(vo);
		}
		


	}
}*/
