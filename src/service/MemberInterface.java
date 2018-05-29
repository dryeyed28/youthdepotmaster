package service;

import java.util.List;

import vo.Member;

public interface MemberInterface {
	public List<Member> findByAll() throws Exception;
	public Member findById(String mem_userId)throws Exception;
	public int findCount() throws Exception;
}
