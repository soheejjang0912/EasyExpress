package express;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet; 
import java.util.ArrayList;

import util.DatabaseUtil;

public class ExpressDAO {
	
	public int login(String userID, String userPW) {
		String SQL = "SELECT userPW FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).contentEquals(userPW)) {
					return 1;	//로그인 성공
				}
				else {
					return 0;	//비번 틀림
				} 
			}return -1; 		//아이디 없음
		}catch(Exception e) {
			e.printStackTrace();
		}finally { //데베 접근 이후에는 접근한 자원들을 전부 해제함으로서 서버에 무리가 되지 않게 해주어야함
			try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return -2;	//데이터 베이스 오류
	}

	//통운 등록
	public int register(ExpressDTO expr) {
		String SQL = "INSERT INTO EXPRESS VALUES (0, ?, now(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, null, null, null, null, null, null, null, null, null, null, null, null)"; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //특정한 문장을 실행한 이후에 나온 결과값 처리하기 위함
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, expr.getResUserID());
			pstmt.setString(2, expr.getResSendName());
			pstmt.setString(3, expr.getResSendCountry());
			pstmt.setString(4, expr.getResSendAdress());
			pstmt.setInt(5, expr.getResSendTel());
			pstmt.setString(6, expr.getResSendEmail());
			pstmt.setString(7, expr.getResRecName());
			pstmt.setString(8, expr.getResRecCountry());
			pstmt.setString(9, expr.getResRecAdress());
			pstmt.setInt(10, expr.getResRecTel());
			pstmt.setString(11, expr.getResRecEmail());
			pstmt.setString(12, expr.getResLugType());
			pstmt.setString(13, expr.getResLugName());
			pstmt.setInt(14, expr.getResLugWeight());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally { //데베 접근 이후에는 접근한 자원들을 전부 해제함으로서 서버에 무리가 되지 않게 해주어야함
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		} 
		return -1; //실패
	}
	
	public ArrayList<ExpressDTO> getList (String userID){
		
		ArrayList<ExpressDTO> expressList = null;
		String SQL = ""; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //특정한 문장을 실행한 이후에 나온 결과값 처리하기 위함
		try {
			SQL = "SELECT * FROM EXPRESS WHERE resUserID = ? order by resID desc;"; // order by productID desc
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			expressList = new ArrayList<ExpressDTO>();
			while(rs.next()) {
				ExpressDTO express = new ExpressDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getNString(4),
						rs.getNString(5),
						rs.getNString(6),
						rs.getInt(7),
						rs.getNString(8),
						rs.getNString(9),
						rs.getNString(10),
						rs.getNString(11),
						rs.getInt(12),
						rs.getNString(13),
						rs.getNString(14),
						rs.getNString(15),
						rs.getInt(16),
						rs.getNString(17),
						rs.getNString(18),
						rs.getNString(19),
						rs.getNString(20),
						rs.getNString(21),
						rs.getNString(22), 
						rs.getNString(23),
						rs.getNString(24),
						rs.getNString(25), 
						rs.getNString(26),
						rs.getNString(27),
						rs.getNString(28)  //자료형만 잘못써도 전체가 에러나니 조심할것! 
				);
				expressList.add(express);
			} 
		}catch(Exception e) {
			e.printStackTrace();
		}finally { //데베 접근 이후에는 접근한 자원들을 전부 해제함으로서 서버에 무리가 되지 않게 해주어야함
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		}
		return expressList;
	}

	public ArrayList<ExpressDTO> allList (){
		
		ArrayList<ExpressDTO> expressList = null;
		String SQL = ""; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //특정한 문장을 실행한 이후에 나온 결과값 처리하기 위함
		try {
			SQL = "SELECT * FROM EXPRESS order by resID desc;"; // order by productID desc
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); 
			rs = pstmt.executeQuery();
			expressList = new ArrayList<ExpressDTO>();
			while(rs.next()) {
				ExpressDTO express = new ExpressDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getNString(4),
						rs.getNString(5),
						rs.getNString(6),
						rs.getInt(7),
						rs.getNString(8),
						rs.getNString(9),
						rs.getNString(10),
						rs.getNString(11),
						rs.getInt(12),
						rs.getNString(13),
						rs.getNString(14),
						rs.getNString(15),
						rs.getInt(16),
						rs.getNString(17),
						rs.getNString(18),
						rs.getNString(19),
						rs.getNString(20),
						rs.getNString(21),
						rs.getNString(22), 
						rs.getNString(23),
						rs.getNString(24),
						rs.getNString(25), 
						rs.getNString(26),
						rs.getNString(27),
						rs.getNString(28) //자료형만 잘못써도 전체가 에러나니 조심할것! 
				);
				expressList.add(express);
			} 
		}catch(Exception e) {
			e.printStackTrace();
		}finally { //데베 접근 이후에는 접근한 자원들을 전부 해제함으로서 서버에 무리가 되지 않게 해주어야함
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		}
		return expressList;
	}

	public ExpressDTO getExpress (int resID){  
		String SQL = ""; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //특정한 문장을 실행한 이후에 나온 결과값 처리하기 위함
		try {
			SQL = "SELECT * FROM Express WHERE resID = ?";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1, resID);
			rs = pstmt.executeQuery(); 
			if(rs.next()) {
				ExpressDTO express = new ExpressDTO();
					express.setResID(rs.getInt(1)); 
					express.setResUserID(rs.getString(2)); 
					express.setResSendDate(rs.getString(3));
					express.setResSendName(rs.getString(4));
					express.setResSendCountry(rs.getString(5));
					express.setResSendAdress(rs.getString(6));
					express.setResSendTel(rs.getInt(7));
					express.setResSendEmail(rs.getString(8));
					express.setResRecName(rs.getString(9));
					express.setResRecCountry(rs.getString(10));
					express.setResRecAdress(rs.getString(11));
					express.setResRecTel(rs.getInt(12));
					express.setResRecEmail(rs.getString(13));
					express.setResLugType(rs.getString(14));
					express.setResLugName(rs.getString(15));
					express.setResLugWeight(rs.getInt(16)); 
					express.setResExpClear (rs.getString(17));
					express.setResExpClearDate (rs.getString(18));
					express.setResExpClearIrr (rs.getString(19));
					express.setResTransState(rs.getString(20));
					express.setResTransStateDate(rs.getString(21));
					express.setResTransStateIrr(rs.getString(22));
					express.setResImpClear(rs.getString(23));
					express.setResImpClearDate(rs.getString(24));
					express.setResImpClearIrr(rs.getString(25));
					express.setResDeli(rs.getString(26));
					express.setResDeliDate(rs.getString(27));
					express.setResDeliIrr(rs.getString(28)); 
					return express;
			} 
		}catch(Exception e) {
			e.printStackTrace();
		}finally { //데베 접근 이후에는 접근한 자원들을 전부 해제함으로서 서버에 무리가 되지 않게 해주어야함
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		}
		return null;
	}

	//clear 등록
	public int expClearRegister(int resID, String resExpClear, String resExpClearIrr) {
		String SQL = "update express set resExpClear=?,resExpClearDate=now(), resExpClearIrr=? where resID =? ;"; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //특정한 문장을 실행한 이후에 나온 결과값 처리하기 위함 
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, resExpClear);
			pstmt.setString(2, resExpClearIrr);
			pstmt.setInt(3, resID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally { //데베 접근 이후에는 접근한 자원들을 전부 해제함으로서 서버에 무리가 되지 않게 해주어야함
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		} 
		return -1; //실패
	}
	
	//TransState 등록 
		public int transStateRegister(int resID, String resTransState, String resTransStateIrr) {
			String SQL = "update express set resTransState=?,resTransStateDate=now(), resTransStateIrr=? where resID =? ;"; 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; //특정한 문장을 실행한 이후에 나온 결과값 처리하기 위함 
			try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, resTransState);
				pstmt.setString(2, resTransStateIrr);
				pstmt.setInt(3, resID);
				return pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}finally { //데베 접근 이후에는 접근한 자원들을 전부 해제함으로서 서버에 무리가 되지 않게 해주어야함
				try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
				try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
				try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
			} 
			return -1; //실패
		}
		
	//ImpRegister 등록 
		public int ImpRegister(int resID, String resImpClear, String resImpClearIrr) {
			String SQL = "update express set resImpClear=?,resImpClearDate=now(), resImpClearIrr=? where resID =? ;"; 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; //특정한 문장을 실행한 이후에 나온 결과값 처리하기 위함 
			try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, resImpClear);
				pstmt.setString(2, resImpClearIrr);
				pstmt.setInt(3, resID);
				return pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}finally { //데베 접근 이후에는 접근한 자원들을 전부 해제함으로서 서버에 무리가 되지 않게 해주어야함
				try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
				try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
				try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
			} 
			return -1; //실패
		}

	//Deli 등록 
		public int deliRegister(int resID, String resDeli, String resDeliIrr) {
			String SQL = "update express set resDeli=?,resDeliDate=now(), resDeliIrr=? where resID =? ;"; 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; //특정한 문장을 실행한 이후에 나온 결과값 처리하기 위함 
			try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, resDeli);
				pstmt.setString(2, resDeliIrr);
				pstmt.setInt(3, resID);
				return pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}finally { //데베 접근 이후에는 접근한 자원들을 전부 해제함으로서 서버에 무리가 되지 않게 해주어야함
				try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
				try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
				try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
			} 
			return -1; //실패
		}
		
}
