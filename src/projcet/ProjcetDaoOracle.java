package projcet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sql.OracleConnection;
import vo.RApply;
import vo.RKeeper;
import vo.RMeta;
import vo.ROption;
import vo.RPost;
import vo.RProject;
import vo.RewardPay;

public class ProjcetDaoOracle implements ProjcetDao {
	@Override
	public void apllyinsert(RApply rApply) {
		Connection con = null;
		PreparedStatement pstmt=null;
		try {
			con = sql.OracleConnection.getConnection();
			String insertSQL = "insert all\r\n" + 
					  "into R_project values ((SELECT MAX(rpjt_id)+1 FROM R_project), ?, ?, ?, sysdate)\r\n" + 
					  "into R_keeper values ((SELECT MAX(rpjt_id)+1 FROM R_keeper), ?, ?, ?, null, ?)\r\n" + 
					  "into R_meta values ((SELECT MAX(rpjt_id)+1 FROM R_meta),?,?,0,?,?,?,?,null,to_date(?,'RR/MM/DD'))\r\n"
					+ "into R_OPtion values ((SELECT MAX(rpjt_id)+1 FROM R_OPtion), 10,?,?,?,?,to_date(?,'RR/MM/DD'),?)\r\n"
					+ "into R_Story values ((SELECT MAX(rpjt_id)+1 FROM R_Story),?,0,?,?,?,?)\r\n"
					+ "SELECT * FROM DUAL";
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setInt(1, rApply.getrProject().getMem_id());
			pstmt.setInt(2, rApply.getrProject().getrPJT_state());
			pstmt.setInt(3, rApply.getrProject().getrPJT_progress());
			pstmt.setString(4, rApply.getrKeeper().getR_name());
			pstmt.setString(5, rApply.getrKeeper().getR_profile());
			pstmt.setString(6, rApply.getrKeeper().getR_email());
			pstmt.setInt(7, rApply.getrKeeper().getR_tel());
			pstmt.setString(8,rApply.getrMeta().getrPJT_title());
			pstmt.setString(9,rApply.getrMeta().getrPJT_subTitle());
			pstmt.setInt(10,rApply.getrMeta().getrTarget_amount());
			pstmt.setString(11,rApply.getrMeta().getrPJT_image());
			pstmt.setString(12,rApply.getrMeta().getrPJT_category());
			pstmt.setString(13,rApply.getrMeta().getrPJT_paper());
			pstmt.setString(14, rApply.getrMeta().getrPJT_endDay());
			pstmt.setInt(15, rApply.getrOption().getrPJT_price());
			pstmt.setString(16, rApply.getrOption().getrPJT_name());
			pstmt.setString(17, rApply.getrOption().getrPJT_detail());
			pstmt.setInt(18, rApply.getrOption().getrPJT_limit());
			pstmt.setString(19, rApply.getrOption().getrPJT_send());
			pstmt.setInt(20, rApply.getrOption().getrPJT_charge());
			pstmt.setString(21, rApply.getrStory().getrPJT_url());
			pstmt.setString(22, rApply.getrStory().getrPJT_sumnail());
			pstmt.setString(23, rApply.getrStory().getrPJT_story());
			pstmt.setString(24, rApply.getrStory().getrPJT_tag());
			pstmt.setString(25, rApply.getrStory().getrPJT_paper());
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sql.OracleConnection.close(pstmt, con);
		}
		
	}
	
	@Override
	public RKeeper getKeeper(int rPJT_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RKeeper keeper = null;
		try {
			con = sql.OracleConnection.getConnection();
			String sql = "";
			sql += "select rk.rpjt_id, rk.R_NAME, rk.R_PROFILE, rk.R_TEL, rk.R_EMAIL, rk.R_URL \n";
			sql += "from r_keeper rk, r_project rp \n";
			sql += "where rk.rPJT_id = rp.rPJT_id and rk.rPJT_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rPJT_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				keeper = new RKeeper(
				new RProject(rs.getInt("rPJT_id"),
						0, 0, 0, null),
				/*rs.getInt("mem_id"),
				rs.getInt("rPJT_state"),
				rs.getInt("rPJT_progress"),
				rs.getString("rPJT_submission")),*/
				rs.getString("r_name"),
				rs.getString("r_profile"),
				rs.getString("r_email"),
				rs.getString("r_url"),
				rs.getInt("r_tel")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			sql.OracleConnection.close(rs, pstmt, con);
		}
		return keeper;
	}

	@Override
	public RMeta getMeta(int rPJT_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RMeta meta = null;
		try {
			con = sql.OracleConnection.getConnection();
			String sql = "";
			sql += "select rm.rpjt_id, rm.RPJT_TITLE, rm.RPJT_SUBTITLE, rm.RINVESTING_AMOUNT, \n";
			sql += "rm.RTARGET_AMOUNT, rm.RPJT_IMAGE, rm.RPJT_CATEGORY, rm.RPJT_PAPER, \n";
			sql += "TO_CHAR(rm.RPJT_STARTDAY, 'yyyy.mm.dd') RPJT_STARTDAY, TO_CHAR(rm.RPJT_ENDDAY, 'yyyy.mm.dd') rPJT_endday \n";
			sql += "from r_meta rm, r_project rp \n";
			sql += "where rm.rPJT_id = rp.rPJT_id and rm.rPJT_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rPJT_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				meta = new RMeta(
				new RProject(rs.getInt("rPJT_id"),
						0, 0, 0, null),
				rs.getString("rPJT_title"),
				rs.getString("rPJT_subTitle"),
				rs.getInt("rInvesting_amount"),
				rs.getInt("rTarget_amount"),
				rs.getString("rPJT_image"),
				rs.getString("rPJT_category"),
				rs.getString("rPJT_paper"),
				rs.getString("rPJT_startday"),
				rs.getString("rPJT_endday")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			sql.OracleConnection.close(rs, pstmt, con);
		}
		return meta;
	}

	@Override
	public ArrayList<ROption> getOption(int rPJT_id) {
		ArrayList<ROption> option = new ArrayList<ROption>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = OracleConnection.getConnection();
			String sql = "";
			sql += "select ro.rpjt_id, ro.reward_id, ro.RPJT_PRICE, ro.RPJT_NAME, ro.RPJT_DETAIL, \n";
			sql += "ro.RPJT_LIMIT, to_char(ro.RPJT_SEND, 'yyyy.mm.dd') RPJT_SEND, ro.RPJT_CHARGE \n";
			sql += "from r_option ro, r_project rp \n";
			sql += "where ro.rPJT_id = rp.rPJT_id and ro.rPJT_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rPJT_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ROption ro = new ROption(
						new RProject(rs.getInt("rPJT_id"), 0, 0, 0, null),
						rs.getInt("reward_id"),
						rs.getInt("rPJT_price"),
						rs.getString("rPJT_name"),
						rs.getString("rPJT_detail"),
						rs.getInt("rPJT_limit"),
						rs.getString("rPJT_send"),
						rs.getInt("rPJT_charge")
						);
				
				option.add(ro);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return option;
	}

	@Override
	public ArrayList<RPost> getRPost(int rPJT_id) {
		ArrayList<RPost> rpost = new ArrayList<RPost>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = OracleConnection.getConnection();
			String sql = "";
			sql += "select rp.rpjt_id, rp.rpost_title, rp.rpost_content, rp.rpost_userid, "
					+ "to_char(rp.rpost_datetime, 'yyyy-mm-dd hh:Mi:ss') rpost_datetime \n";
			sql += "from r_post rp, r_project p \n";
			sql += "where rp.rPJT_id = p.rPJT_id and rp.rPJT_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rPJT_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RPost rp = new RPost(
						new RProject(rs.getInt("rPJT_id"), 0, 0, 0, null),
						rs.getString("rPost_title"),
						rs.getString("rPost_content"),
						rs.getString("rPost_userID"),
						rs.getString("rPost_datetime")
						);
				
				rpost.add(rp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return rpost;
	}

	@Override
	public ROption getOptionPay(int rPJT_id, int reward_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ROption payaddress = null;
		try {
			con = OracleConnection.getConnection();
			String sql = "";
			sql += "select ro.rpjt_id, ro.reward_id, ro.RPJT_PRICE, ro.RPJT_NAME, ro.RPJT_DETAIL, \n";
			sql += "ro.RPJT_LIMIT, to_char(ro.RPJT_SEND, 'yyyy.mm.dd') RPJT_SEND, ro.RPJT_CHARGE \n";
			sql += "from r_option ro, r_project rp \n";
			sql += "where ro.rPJT_id = rp.rPJT_id and ro.rPJT_id = ? and ro.reward_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rPJT_id);
			pstmt.setInt(2, reward_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				payaddress = new ROption(
						new RProject(rs.getInt("rPJT_id"), 0, 0, 0, null),
						rs.getInt("reward_id"),
						rs.getInt("rPJT_price"),
						rs.getString("rPJT_name"),
						rs.getString("rPJT_detail"),
						rs.getInt("rPJT_limit"),
						rs.getString("rPJT_send"),
						rs.getInt("rPJT_charge")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return payaddress;
	}

	@Override
	public RewardPay getOrderReward(int mem_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RewardPay rpay = new RewardPay();
		try {
			con = OracleConnection.getConnection();
			String sql = "";
			sql += "select rp.MEM_NAME, rp.RPRODUCT_EA, rp.RPAY_TOTAL, rp.RPAY_PHONE, rp.RPAY_ADDRESS, rp.RPAY_REQUEST \n";
			sql += "from reward_pay rp, members m \n";
			sql += "where rp.mem_id = m.mem_id and rp.mem_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rpay.setMem_name(rs.getString(1));
				rpay.setrProduct_ea(rs.getInt(2));
				rpay.setrPay_total(rs.getInt(3));
				rpay.setrPay_phone(rs.getString(4));
				rpay.setrPay_address(rs.getString(5));
				rpay.setrPay_request(rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return rpay;
	}
}
