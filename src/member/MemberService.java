package member;

import java.util.List;

import vo.Member;

public interface MemberService {
	public List<Member> findAll();

	public Member findById(String mem_userId) throws Exception;

	public int findCount() throws Exception;

	public int idCheck1(String mem_userId) throws Exception;

	public void signup(Member member);
	
<<<<<<< HEAD
	public int login(Member member);	
	
	public Member mypage(int mem_id);

=======
	public Member login(Member member);	
>>>>>>> 204de20b2ca5dab7a256adb2575b7bc550bd0cee
}
