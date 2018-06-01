package member;

import java.util.ArrayList;
import java.util.List;

import dao.MemberDAO;

import member.MemberService;
import vo.Member;

public class MemberServiceImpl implements MemberService {
	/*
	 * 1. 인터페이스 타입의 DAOOracle 객체 생성 2. findXX메소드를 생성하고 컨트롤러로 1, -1값 리턴
	 */

	private MemberDao dao = new MemberDaoOracle();

	@Override
	public List<Member> findAll() {
		return dao.selectAll();
	}

	@Override
	public Member findById(String mem_userId) throws Exception {
		Member member = dao.selectById(mem_userId);
		return member;
	}

	@Override
	public int findCount() throws Exception {
		// 멤버테이블 행수 출력
		return dao.selectCount();
	}

	@Override
	public int idCheck(String mem_userId) throws Exception {
		Member member = dao.idCheck(mem_userId);

		if (member == null) {
			return 1;
		} else {
			return 0;

		}
	}
	
	// 메인메소드
	public static void main(String[] args) {
		MemberServiceImpl service = new MemberServiceImpl();
		try {
			List<Member> list = service.findAll();
			System.out.println("findAll() 결과 : " + list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}


