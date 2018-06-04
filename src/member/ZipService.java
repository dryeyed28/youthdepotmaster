package member;

import java.util.List;

import vo.Zip;

public class ZipService {
	private ZipDAO dao = new ZipDAOOracle();	
	public List<Zip> findByDoro(String doro) throws Exception{
		return dao.selectByDoro(doro);
	}
}
