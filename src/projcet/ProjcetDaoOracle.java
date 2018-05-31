package projcet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import vo.RApply;

public class ProjcetDaoOracle implements ProjcetDao {
	@Override
	public void apllyinsert(RApply rApply) {
		Connection con = null;
		PreparedStatement pstmt=null;
		try {
			con = sql.OracleConnection.getConnection();
			String insertSQL = "insert into r_project (rpjt_id, mem_id, rrpjt_key, rpjt_state, rpjt_progress, rpjt_submission) values\r\n" + 
							   "((SELECT MAX(rpjt_id)+1 as pjt_id FROM r_project), ?, null, ?, ?, sysdate)";
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setInt(rApply.getrProject().getMem_id(), 1);
			pstmt.setInt(rApply.getrProject().getrPJT_state(), 2);
			pstmt.setInt(rApply.getrProject().getrPJT_progress(), 3);
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sql.OracleConnection.close(pstmt, con);
		}
		
	}
}
