package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class InfoDAO {
	String url = "jdbc:mysql://localhost:3306/hos";
	String user = "root";
	String password = "1234";

	DBConnectionMgr mgr;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public InfoDAO() {
		mgr = DBConnectionMgr.getInstance();
	}
	
	public void insert(InfoDTO dto) {
		try {
			con = mgr.getConnection();
			String sql = "insert into info values(null,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getLink());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public ArrayList<InfoDTO> selectAll()  {
		ArrayList<InfoDTO> list = new ArrayList<InfoDTO>();
		InfoDTO dto = null;
		try {
			con = mgr.getConnection();
			String sql = "select * from info";
			
			ps= con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				dto = new InfoDTO();
				int inum = rs.getInt(1);
				String title = rs.getString(2);
				String link = rs.getString(3);
				dto.setInum(inum);
				dto.setTitle(title);
				dto.setLink(link);
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}