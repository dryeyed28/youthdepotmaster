package totalpay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sql.OracleConnection;
import vo.Deposit;
import vo.RewardPay;

public class TotalPayDaoOracle implements TotalPayDao {

	@Override
	public ArrayList<RewardPay> getTotalPay() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<RewardPay> list = new ArrayList<RewardPay>();
		try {
			con = OracleConnection.getConnection();
			String sql = "";
			sql += "select rp.rpay_id, m.mem_userid, rp.rpjt_id, rp.RPAY_TOTAL, rp.RPRODUCT_EA, to_char(rp.rpay_date, 'yyyy-mm-dd hh:Mi:ss') \n";
			sql += "from reward_pay rp join members m on rp.mem_id = m.mem_id \n";
			sql += "order by rp.rpay_id desc ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RewardPay rpay = new RewardPay();
				rpay.setrPay_id(rs.getInt(1));
				rpay.setMem_name(rs.getString(2));
				rpay.setrPJT_id(rs.getInt(3));
				rpay.setrPay_total(rs.getInt(4));
				rpay.setrProduct_ea(rs.getInt(5));
				rpay.setrPay_date(rs.getString(6));
				list.add(rpay);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public ArrayList<Deposit> getDepositInfo() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Deposit> list = new ArrayList<Deposit>();
		try {
			con = OracleConnection.getConnection();
			String sql = "";
			sql += "select dep.dep_id, m.mem_userid, dep.dep_request, to_char(dep.dep_date, 'yyyy-mm-dd hh:Mi:ss'), dep.dep_state \n";
			sql += "from deposit dep join members m on dep.mem_id = m.mem_id \n";
			sql += "where dep.dep_state is not null \n";
			sql += "order by dep.dep_state";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Deposit dep = new Deposit();
				dep.setDep_id(rs.getInt(1));
				dep.setMem_userID(rs.getString(2));
				dep.setDep_request(rs.getInt(3));
				dep.setDep_date(rs.getString(4));
				dep.setDep_state(rs.getInt(5));
				list.add(dep);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public ArrayList<Deposit> getRefundInfo() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Deposit> list = new ArrayList<Deposit>();
		try {
			con = OracleConnection.getConnection();
			String sql = "";
			sql += "select dep.dep_id, m.mem_userid, dep.dep_request, dep.dep_balance, to_char(dep.dep_date, 'yyyy-mm-dd hh:Mi:ss'), dep.dep_type \n";
			sql += "from deposit dep join members m on dep.mem_id = m.mem_id \n";
			sql += "where dep.dep_type = 3 or dep.dep_type = 4 \n";
			sql += "order by dep.dep_type";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Deposit dep = new Deposit();
				dep.setDep_id(rs.getInt(1));
				dep.setMem_userID(rs.getString(2));
				dep.setDep_request(rs.getInt(3));
				dep.setDep_balance(rs.getInt(4));
				dep.setDep_date(rs.getString(5));
				dep.setDep_type(rs.getInt(6));
				list.add(dep);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public ArrayList<ProfitDto> getgetProfit() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ProfitDto> list = new ArrayList<ProfitDto>();
		try {
			con = OracleConnection.getConnection();
			String sql = "";
			sql += "select m.MEM_USERID ,r.RPJT_ID, r.rpjt_progress, to_char(rm.RPJT_ENDDAY, 'yyyy-mm-dd hh:Mi:ss'), rm.RINVESTING_AMOUNT, r.rpjt_profit \n";
			sql += "from R_PROJECT r join MEMBERS m on r.MEM_ID = m.MEM_ID \n";
			sql += "join R_META rm on r.RPJT_ID = rm.RPJT_ID \n";
			sql += "where r.rpjt_progress = 2 or r.rpjt_progress = 3";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProfitDto p = new ProfitDto(
						rs.getString(1),
						rs.getInt(2),
						rs.getInt(3),
						rs.getString(4),
						rs.getInt(5),
						rs.getInt(6));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public void getRefundOK(int dep, int id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = OracleConnection.getConnection();
			con.setAutoCommit(false);
			String sql = "UPDATE deposit SET dep_type = 4, dep_balance = dep_request + dep_balance \n" + 
					"where dep_id = ? and dep_type = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.setInt(2, dep);
			int commit = pstmt.executeUpdate();
			if (commit == 1) {
				con.commit();
			} else {
				con.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(pstmt, con);
		}
	}

}
