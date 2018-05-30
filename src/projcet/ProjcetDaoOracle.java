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
			String insertSQL = "";
			pstmt = con.prepareStatement(insertSQL);
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sql.OracleConnection.close(pstmt, con);
		}
		
	}
}
