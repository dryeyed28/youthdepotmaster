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
			pjtinsert(rApply.getrProject());
			String insertSQL = "insert all\r\n" + 
					  "into R_keeper values ((SELECT MAX(rpjt_id)+1 FROM R_keeper), ?, ?, ?, null, ?)\r\n" + 
					  "into R_meta values ((SELECT MAX(rpjt_id)+1 FROM R_meta),?,?,0,?,?,?,?,null,to_date(?,'RR/MM/DD'))\r\n"
					+ "into R_OPtion values ((SELECT MAX(rpjt_id)+1 FROM R_OPtion), 10,?,?,?,?,to_date(?,'RR/MM/DD'),?)\r\n"
					+ "into R_Story values ((SELECT MAX(rpjt_id)+1 FROM R_Story),?,0,?,?,?,?)\r\n"
					+ "SELECT * FROM DUAL";
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setString(1, rApply.getrKeeper().getR_name());
			pstmt.setString(2, rApply.getrKeeper().getR_profile());
			pstmt.setString(3, rApply.getrKeeper().getR_email());
			pstmt.setInt(4, rApply.getrKeeper().getR_tel());
			pstmt.setString(5,rApply.getrMeta().getrPJT_title());
			pstmt.setString(6,rApply.getrMeta().getrPJT_subTitle());
			pstmt.setInt(7,rApply.getrMeta().getrTarget_amount());
			pstmt.setString(8,rApply.getrMeta().getrPJT_image());
			pstmt.setString(9,rApply.getrMeta().getrPJT_category());
			pstmt.setString(10,rApply.getrMeta().getrPJT_paper());
			pstmt.setString(11, rApply.getrMeta().getrPJT_endDay());
			pstmt.setInt(12, rApply.getrOption().get(0).getrPJT_price());
			pstmt.setString(13, rApply.getrOption().get(0).getrPJT_name());
			pstmt.setString(14, rApply.getrOption().get(0).getrPJT_detail());
			pstmt.setInt(15, rApply.getrOption().get(0).getrPJT_limit());
			pstmt.setString(16, rApply.getrOption().get(0).getrPJT_send());
			pstmt.setInt(17, rApply.getrOption().get(0).getrPJT_charge());
			pstmt.setString(18, rApply.getrStory().getrPJT_url());
			pstmt.setString(19, rApply.getrStory().getrPJT_sumnail());
			pstmt.setString(20, rApply.getrStory().getrPJT_story());
			pstmt.setString(21, rApply.getrStory().getrPJT_tag());
			pstmt.setString(22, rApply.getrStory().getrPJT_paper());
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
						0, 0, 0, null, 0),
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
			sql += "select rm.rpjt_id, rp.rpjt_progress, rm.RPJT_TITLE, rm.RPJT_SUBTITLE, rm.RINVESTING_AMOUNT, \n";
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
						0, 0, rs.getInt("rpjt_progress"), null, 0),
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
						new RProject(rs.getInt("rPJT_id"), 0, 0, 0, null, 0),
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
						new RProject(rs.getInt("rPJT_id"), 0, 0, 0, null, 0),
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

	@Override
	public void pjtinsert(RProject rProject) {
		Connection con = null;
		PreparedStatement pstmt=null;
		try {
			con = sql.OracleConnection.getConnection();
			String insertSQL = "insert into R_project values ((SELECT MAX(rpjt_id)+1 FROM R_project), ?, ?, ?, sysdate)";
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setInt(1, rProject.getMem_id());
			pstmt.setInt(2, rProject.getrPJT_state());
			pstmt.setInt(3, rProject.getrPJT_progress());
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sql.OracleConnection.close(pstmt, con);
		}
		
	}

	@Override
	public ArrayList<RMeta> getMetaList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<RMeta> list = new ArrayList<RMeta>();
		try {
			con = sql.OracleConnection.getConnection();
			String sql = "";
			sql += "select rm.rpjt_id, rp.rpjt_state, rp.rpjt_progress, rm.RPJT_TITLE, rm.RPJT_SUBTITLE, rm.RINVESTING_AMOUNT, \n";
			sql += "rm.RTARGET_AMOUNT, rm.RPJT_IMAGE, rm.RPJT_CATEGORY, rm.RPJT_PAPER, \n";
			sql += "TO_CHAR(rm.RPJT_STARTDAY, 'yyyy.mm.dd') RPJT_STARTDAY, TO_CHAR(rm.RPJT_ENDDAY, 'yyyy.mm.dd') rPJT_endday \n";
			sql += "from r_meta rm join r_project rp on  rm.rPJT_id = rp.rPJT_id \n";
			sql += "where rp.rpjt_state = 1 and rp.rpjt_progress = 1 or rp.rpjt_progress = 2 or rp.rpjt_progress = 3";
			sql += "order by rp.rpjt_progress";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RMeta meta = new RMeta(
				new RProject(rs.getInt("rPJT_id"),
						0, rs.getInt("rPJT_state"), rs.getInt("rPJT_progress"), null, 0),
				rs.getString("rPJT_title"),
				rs.getString("rPJT_subTitle"),
				rs.getInt("rInvesting_amount"),
				rs.getInt("rTarget_amount"),
				rs.getString("rPJT_image"),
				rs.getString("rPJT_category"),
				rs.getString("rPJT_paper"),
				rs.getString("rPJT_startday"),
				rs.getString("rPJT_endday"));
				list.add(meta);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			sql.OracleConnection.close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public ArrayList<RMeta> getProjectRequest() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<RMeta> list = new ArrayList<RMeta>();
		try {
			con = sql.OracleConnection.getConnection();
			String sql = "";
			sql += "select rm.rpjt_id, rp.mem_id, rp.rpjt_state, rp.rpjt_progress, to_char(rp.RPJT_SUBMISSION, 'yyyy.mm.dd') RPJT_SUBMISSION, rm.RPJT_TITLE, rm.RPJT_SUBTITLE, rm.RINVESTING_AMOUNT, \n";
			sql += "rm.RTARGET_AMOUNT, rm.RPJT_IMAGE, rm.RPJT_CATEGORY, rm.RPJT_PAPER, \n";
			sql += "TO_CHAR(rm.RPJT_STARTDAY, 'yyyy.mm.dd') RPJT_STARTDAY, TO_CHAR(rm.RPJT_ENDDAY, 'yyyy.mm.dd') rPJT_endday \n";
			sql += "from r_meta rm join r_project rp on  rm.rPJT_id = rp.rPJT_id \n";
			sql += "order by rp.rpjt_state";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RMeta meta = new RMeta(
				new RProject(rs.getInt("rPJT_id"),
						rs.getInt("mem_id"), rs.getInt("rPJT_state"), rs.getInt("rPJT_progress"), rs.getString("RPJT_SUBMISSION"), 0),
				rs.getString("rPJT_title"),
				rs.getString("rPJT_subTitle"),
				rs.getInt("rInvesting_amount"),
				rs.getInt("rTarget_amount"),
				rs.getString("rPJT_image"),
				rs.getString("rPJT_category"),
				rs.getString("rPJT_paper"),
				rs.getString("rPJT_startday"),
				rs.getString("rPJT_endday"));
				list.add(meta);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			sql.OracleConnection.close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public ProjectContentDto getProjectContent(int rPJT_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProjectContentDto pcd = null;
		try {
			con = OracleConnection.getConnection();
			String sql = "";
			sql += "select r.rpjt_id, rm.rpjt_title, rm.rtarget_amount, rm.rpjt_category, \n";
			sql += "rm.rpjt_subtitle, rs.rpjt_story, rs.rpjt_thumbnail, rs.rpjt_paper, rs.rpjt_url \n";
			sql += "from R_PROJECT r join R_META rm on r.rpjt_id = rm.rpjt_id \n";
			sql += "join R_STORY rs on r.rpjt_id = rs.rpjt_id \n";
			sql += "where r.rpjt_id = ? \n";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rPJT_id);
			rs = pstmt.executeQuery();
			System.out.println(rs.next());
			if(rs.next()) {
				pcd = new ProjectContentDto(
						rs.getInt(1),
						rs.getString(2),
						rs.getInt(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8),
						rs.getString(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, con);
		}
		return pcd;
	}
}
