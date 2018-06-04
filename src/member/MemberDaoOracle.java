package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sql.OracleConnection;
import vo.Member;

public class MemberDaoOracle implements MemberDao {

	@Override
	public List<Member> selectAll() {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<Member> list = new ArrayList();
		Member member = new Member();

		try {
			con = OracleConnection.getConnection();
			String selectAll = "select *\r\n" + "from members";
			pstmt = con.prepareStatement(selectAll);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				list.add(new Member(rs.getInt("mem_id"), rs.getString("mem_userId"), rs.getString("mem_email"),
						rs.getString("mem_password"), rs.getString("mem_userName"), rs.getString("mem_nickName"),
						rs.getString("mem_phone"), rs.getInt("mem_sex"), rs.getString("mem_register_dateTime"),
						rs.getString("mem_lastLogin_dateTime"), rs.getInt("mem_treasurer"), rs.getInt("mem_passion")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public Member selectById(String mem_userId) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Member member = new Member();

		try {
			con = OracleConnection.getConnection();
			String selectById = "select *\r\n" + "from members\r\n" + "where mem_userid = ?";
			pstmt = con.prepareStatement(selectById);
			pstmt.setString(1, mem_userId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				if (member == null) {
					member.setMem_id(rs.getInt("mem_id"));
					member.setMem_userId(mem_userId);
					member.setMem_email(rs.getString("mem_email"));
					member.setMem_password(rs.getString("mem_password"));
					member.setMem_userName(rs.getString("mem_userName"));
					member.setMem_nickName(rs.getString("mem_nickName"));
					member.setMem_phone(rs.getString("mem_phone"));
					member.setMem_sex(rs.getInt("mem_sex"));
					member.setMem_register_dateTime(rs.getString("mem_register_dateTime"));
					member.setMem_lastLogin_dateTime(rs.getString("mem_lastLogin_dateTime"));
					member.setMem_treasurer(rs.getInt("mem_treasurer"));
					member.setMem_passion(rs.getInt("mem_passion"));
				}
			}
			return member;
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
	}

	@Override
	public void insert(Member m) throws Exception {

	}

	@Override
	public void delete(String mem_userid) throws Exception {

	}

	@Override
	public void update(Member m) throws Exception {

	}

	@Override
	public int selectCount() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String selectCount = "select count(*) totalCount\r\n" + "from members";

		try {
			con = OracleConnection.getConnection();
			pstmt = con.prepareStatement(selectCount);
			rs = pstmt.executeQuery();
			rs.next();
			int totalCount = rs.getInt("totalCount");

			return totalCount;
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
	}

	@Override
	public Member idCheck(String mem_userid) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = new Member();

		String idCheck = "SELECT mem_userid\r\n" + "FROM members\r\n" + "WHERE mem_userid=?";

		try {
			con = OracleConnection.getConnection();
			pstmt = con.prepareStatement(idCheck);
			rs = pstmt.executeQuery();
			System.out.println("member");
			return member;
			
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
	}
}
