package member;

import java.util.List;

import vo.Member;

public interface MemberService {
	public List<Member> findAll();

	public Member findById(String mem_userId) throws Exception;

	public int findCount() throws Exception;

	public static int idCheck(String mem_userId) throws Exception{
		MemberDao dao = new MemberDaoOracle();
		Member m = dao.idCheck(mem_userId);
		if (m != null) {
			return 0;
		}else {
			
			return 1;
		}
		
	}
}
