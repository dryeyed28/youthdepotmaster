package totalpay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sql.OracleConnection;
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

}
