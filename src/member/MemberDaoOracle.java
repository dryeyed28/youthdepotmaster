package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sql.OracleConnection;
import vo.Member;
import vo.ROption;
import vo.RProject;

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
						rs.getString("mem_lastLogin_dateTime"), rs.getInt("mem_treasurer"), rs.getInt("mem_passion"),rs.getString("mem_address")));
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
			
			return member;
			
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
	}

	@Override
	public void memberInsert(Member member) {
		Connection con = null;
		PreparedStatement pstmt=null;
		
		
		try {
			con = OracleConnection.getConnection();
			con.setAutoCommit(false);
			String sqlinsert= "INSERT INTO MEMBERS(MEM_ID,MEM_USERID,MEM_EMAIL,MEM_PASSWORD,MEM_USERNAME,MEM_NICKNAME,MEM_PHONE,MEM_SEX,MEM_REGISTER_DATETIME,MEM_LASTLOGIN_DATETIME,MEM_TREASURER,MEM_PASSION)\r\n" + 
					"VALUES ((SELECT MAX(MEM_ID)+1 FROM MEMBERS),?,?,?,?,?,?,?,to_date(sysdate,'RR/MM/DD'),to_date(sysdate,'RR/MM/DD'),0,0)";
			pstmt = con.prepareStatement(sqlinsert);
			pstmt.setString(1,member.getMem_userId());
			pstmt.setString(2,member.getMem_email());
			pstmt.setString(3,member.getMem_password());
			pstmt.setString(4,member.getMem_userName());
			pstmt.setString(5,member.getMem_nickName());
			pstmt.setString(6,member.getMem_phone());
			pstmt.setInt(7,member.getMem_sex());
			
			System.out.println("memberdao");
			
			int commit = pstmt.executeUpdate();
			if(commit == 1) {
				con.commit();
			} else {
				con.rollback();
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(pstmt, con);
		}
			
	}

	@Override
	public Member login(Member member) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = new Member();
		String mem_userId= member.getMem_userId();
		String mem_password= member.getMem_password();
		String login="SELECT mem_id, mem_userid, mem_password, mem_nickname  FROM members WHERE mem_userid=? and mem_password=?";
		try {
			con = OracleConnection.getConnection();
			pstmt = con.prepareStatement(login);
			
			pstmt. setString(1,mem_userId);
			pstmt. setString(2,mem_password);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				m.setMem_id(rs.getInt("mem_Id"));
				m.setMem_nickName(rs.getString("mem_nickname"));
			}
			
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		
		return m;
		
	}

	@Override
	public Member getMember(int mem_id) {
		
		Member m = new Member();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			con = OracleConnection.getConnection();
			String mysql = "select MEM_ID,MEM_USERID,MEM_EMAIL,MEM_USERNAME,MEM_NICKNAME,MEM_PHONE,MEM_PASSION from members where mem_id=?";
			
			pstmt = con.prepareStatement("mysql");
			pstmt.setInt(1,mem_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				m.setMem_id(rs.getInt("mem_id"));
				m.setMem_userId(rs.getString("mem_userId"));
				m.setMem_email(rs.getString("mem_email"));
				m.setMem_userName(rs.getString("mem_userName"));
				m.setMem_nickName(rs.getString("mem_nickName"));
				m.setMem_phone(rs.getString("mem_phone"));
				m.setMem_passion(rs.getInt("mem_passion"));
			}
			
		}catch (SQLException e) {
		}finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return m;
	}

	

	
	
}
