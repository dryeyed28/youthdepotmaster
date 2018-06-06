package member;

import java.util.List;

import vo.Member;

public interface MemberService {
	public List<Member> findAll();

	public Member findById(String mem_userId) throws Exception;

	public int findCount() throws Exception;

	public int idCheck1(String mem_userId) throws Exception;

	public void signup(Member member);
	
	public int login(Member member);	
	
	public Member mypage(int mem_id);

}
