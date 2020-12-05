package customerService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import express.ExpressDTO;
import util.DatabaseUtil;

public class CustomerServiceDAO {
	
	//cs���
		public int csregister(CustomerServiceDTO cs) {
			String SQL = "INSERT INTO CUSTOMERSERVICE VALUES (0, ?, ?, ?, ?, ?, ?,default)"; 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; //Ư���� ������ ������ ���Ŀ� ���� ����� ó���ϱ� ����
			try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, cs.getCsUserID());
				pstmt.setString(2, cs.getCsUserName());
				pstmt.setInt(3, cs.getCsUserTell());
				pstmt.setString(4, cs.getCsUserEmail());
				pstmt.setString(5, cs.getCsDepartment());
				pstmt.setString(6, cs.getCsContents()); 
				return pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}finally { //���� ���� ���Ŀ��� ������ �ڿ����� ���� ���������μ� ������ ������ ���� �ʰ� ���־����
				try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
				try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
				try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
			} 
			return -1; //����
		}
		public ArrayList<CustomerServiceDTO> getList (String userID){
			
			ArrayList<CustomerServiceDTO> expressList = null;
			String SQL = ""; 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; //Ư���� ������ ������ ���Ŀ� ���� ����� ó���ϱ� ����
			try {
				SQL = "SELECT * FROM CUSTOMERSERVICE WHERE csUserID = ? order by csID desc;"; // order by productID desc
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL); 
				pstmt.setString(1, userID);
				rs = pstmt.executeQuery();
				expressList = new ArrayList<CustomerServiceDTO>();
				while(rs.next()) {
					CustomerServiceDTO cs = new CustomerServiceDTO(
							rs.getInt(1),
							rs.getString(2),
							rs.getString(3),
							rs.getInt(4),
							rs.getNString(5),
							rs.getNString(6),
							rs.getNString(7),
							rs.getNString(8)
							//�ڷ����� �߸��ᵵ ��ü�� �������� �����Ұ�! 
					);
					expressList.add(cs);
				} 
			}catch(Exception e) {
				e.printStackTrace();
			}finally { //���� ���� ���Ŀ��� ������ �ڿ����� ���� ���������μ� ������ ������ ���� �ʰ� ���־����
				try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
				try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
				try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
			}
			return expressList;
		}
		public ArrayList<CustomerServiceDTO> getListAll (){
			
			ArrayList<CustomerServiceDTO> csList = null;
			String SQL = ""; 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; //Ư���� ������ ������ ���Ŀ� ���� ����� ó���ϱ� ����
			try {
				SQL = "SELECT * FROM CUSTOMERSERVICE order by csID desc;"; // order by productID desc
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);  
				rs = pstmt.executeQuery();
				csList = new ArrayList<CustomerServiceDTO>();
				while(rs.next()) {
					CustomerServiceDTO cs = new CustomerServiceDTO(
							rs.getInt(1),
							rs.getString(2),
							rs.getString(3),
							rs.getInt(4),
							rs.getNString(5),
							rs.getNString(6),
							rs.getNString(7),
							rs.getNString(8)
							//�ڷ����� �߸��ᵵ ��ü�� �������� �����Ұ�! 
					);
					csList.add(cs);
				} 
			}catch(Exception e) {
				e.printStackTrace();
			}finally { //���� ���� ���Ŀ��� ������ �ڿ����� ���� ���������μ� ������ ������ ���� �ʰ� ���־����
				try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
				try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
				try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
			}
			return csList;
		}
		public CustomerServiceDTO getCsDetail (int csID){  
			String SQL = ""; 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; //Ư���� ������ ������ ���Ŀ� ���� ����� ó���ϱ� ����
			try {
				SQL = "SELECT * FROM CUSTOMERSERVICE WHERE csID = ?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL); 
				pstmt.setInt(1, csID);
				rs = pstmt.executeQuery(); 
				if(rs.next()) {
					CustomerServiceDTO cs = new CustomerServiceDTO();
						cs.setCsID(rs.getInt(1)); 
						cs.setCsUserID(rs.getString(2)); 
						cs.setCsUserName(rs.getString(3));
						cs.setCsUserTell(rs.getInt(4));
						cs.setCsUserEmail(rs.getString(5));
						cs.setCsDepartment(rs.getString(6));
						cs.setCsContents(rs.getString(7));
						cs.setCsAnswer(rs.getString(8)); 
						return cs;
				} 
			}catch(Exception e) {
				e.printStackTrace();
			}finally { //���� ���� ���Ŀ��� ������ �ڿ����� ���� ���������μ� ������ ������ ���� �ʰ� ���־����
				try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
				try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
				try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
			}
			return null;
		}
		//csAnswer ��� 
		public int csAnswerRegister(int csID, String csAnswer) { 
			String SQL = "update CUSTOMERSERVICE set csAnswer=?  where csID =? ;"; 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; //Ư���� ������ ������ ���Ŀ� ���� ����� ó���ϱ� ���� 
			try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, csAnswer); 
				pstmt.setInt(2, csID);
				return pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}finally { //���� ���� ���Ŀ��� ������ �ڿ����� ���� ���������μ� ������ ������ ���� �ʰ� ���־����
				try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
				try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
				try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
			} 
			return -1; //����
		}
		
}
