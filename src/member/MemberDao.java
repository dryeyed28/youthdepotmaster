package member;

import java.util.List;

import vo.Member;

public interface MemberDao {
	public List<Member> selectAll();
	public Member selectById(String mem_userid) throws Exception;
	public void insert(Member m) throws Exception;
	public void delete(String mem_userid) throws Exception;
	public void update(Member m) throws Exception;
	public int selectCount() throws Exception; //멤버테이블 전체행수
	public Member idCheck(String mem_userid) throws Exception;
}
