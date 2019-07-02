package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.websocket.Session;

public class MemberDAO {

	String url = "jdbc:mysql://localhost:3306/hos";
	String user = "root";
	String password = "1234";

	DBConnectionMgr pool;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public MemberDAO() {
		pool = DBConnectionMgr.getInstance();
	}

	public int getUnum(String id, String pw) throws Exception {
		
		con = pool.getConnection();
		
		String sql = "select unum from member where name = ? and pw = ?";
		
		int tmpUnum = 0;
		
		ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);
		
		rs = ps.executeQuery();
		
		while(rs.next()) {
			tmpUnum = rs.getInt(1);
		}
		
		return tmpUnum;
	}
	
	
//	notice에 글쓴이를 기준으로 자신이 쓴 글을 찾아오는 DAO작성

	public void Questioninsert(String id, int [] value) throws Exception {

		con = pool.getConnection();
					
		String sql = "insert into question values(?,?,?,?,?,?,?,?,?,?,?)";
		
		ps = con.prepareStatement(sql);
		ps.setInt(1, value[0]);
		ps.setInt(2, value[1]);
		ps.setInt(3, value[2]);
		ps.setInt(4, value[3]);
		ps.setInt(5, value[4]);
		ps.setInt(6, value[5]);
		ps.setInt(7, value[6]);
		ps.setInt(8, value[7]);
		ps.setInt(9, value[8]);
		ps.setInt(10, value[9]);
		ps.setString(11, id);

		ps.executeUpdate();

		ps.close();
		con.close();

	}

	public boolean QuestionCheck(String id) throws Exception {

		con = pool.getConnection();

		String sql = "select * from question where name = ?";

		boolean check = false;

		ps = con.prepareStatement(sql);
		ps.setString(1, id);

		rs = ps.executeQuery();

		if (rs.next()) {
			check = true;
		} else {
			check = false;
		}

		rs.close();
		ps.close();
		con.close();

		return check;
	}

	public void insert(MemberDTO dto) throws Exception {

		con = pool.getConnection();

		String sql = "insert into member values(?,?,?,?,?,default,?)";

		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getName());
		ps.setString(2, dto.getPw());
		ps.setInt(3, dto.getAge());
		ps.setString(4, dto.getGender());
		ps.setString(5, dto.getTel());
		ps.setString(6, dto.getSample6_address());
		/* + " " + dto.getSample6_detailAddress() + " " + dto.getSample6_extraAddress()*/

		ps.executeUpdate();

		ps.close();
		con.close();

	}

	public void delete(String id, String pw) throws Exception {
		con = pool.getConnection();
		String sql = "delete from member where name = ? and pw = ?";

		ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);

		ps.executeUpdate();

		ps.close();
		con.close();
	}

	public void delete(MemberDTO dto) throws Exception {

		con = pool.getConnection();

		String sql = "delete from member where name = ? and pw = ?";

		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getName());
		ps.setString(2, dto.getPw());

		ps.executeUpdate();

		ps.close();
		con.close();
	}

	public void update(String id, int age, String tel, String addr, String pw) throws Exception {
		con = pool.getConnection();

		String sql = "update member set age = ?, tel = ?, addr = ?, pw = ? where name = ?";

		ps = con.prepareStatement(sql);
		ps.setInt(1, age);
		ps.setString(2, tel);
		ps.setString(3, addr);
		ps.setString(4, pw);
		ps.setString(5, id);

		ps.executeUpdate();

		ps.close();
		con.close();
	}

	public void update(MemberDTO dto) throws Exception {

		con = pool.getConnection();

		String sql = "update member set age = ?, tel = ?, addr = ? where name = ? and pw = ?";

		ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getAge());
		ps.setString(2, dto.getTel());
		ps.setString(3,
				dto.getSample6_address() + " " + dto.getSample6_detailAddress() + " " + dto.getSample6_extraAddress());
		ps.setString(4, dto.getName());
		ps.setString(5, dto.getPw());

		ps.executeUpdate();

		ps.close();
		con.close();

	}
	public String selectPw(String id) throws Exception {

		con = pool.getConnection();

		String sql = "select pw from member where name = ?";

		String pw = null;

		ps = con.prepareStatement(sql);
		ps.setString(1, id);

		rs = ps.executeQuery();

		while (rs.next()) {

			pw = rs.getString(1);
		}

		rs.close();
		ps.close();
		con.close();

		return pw;
	}

	public String select(String id, String passw) throws Exception {

		con = pool.getConnection();

		String sql = "select * from member where name = ? and pw = ?";

		String name = null;
		String pw = null;
		int age = 0;
		String gender = null;
		String tel = null;
		int unum = 0;
		String addr = null;

		ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, passw);

		rs = ps.executeQuery();

		while (rs.next()) {

			name = rs.getString(1);
			pw = rs.getString(2);
			age = rs.getInt(3);
			gender = rs.getString(4);
			tel = rs.getString(5);
			unum = rs.getInt(6);
			addr = rs.getString(7);

		}

		rs.close();
		ps.close();
		con.close();

		return name + " " + pw + " " + age + " " + gender + " " + tel + " " + unum + " " + addr;
	}

	public boolean loginCheck(String name, String pw) throws Exception {

		con = pool.getConnection();

		String sql = "select * from member where name = ? and pw = ?";

		ps = con.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, pw);
		rs = ps.executeQuery();

		boolean check = false;

		if (rs.next() == true) {
			check = true;
		} else {
			check = false;
		}

		rs.close();
		ps.close();
		con.close();

		return check;
	}

	public void pwCheck(MemberDTO dto) throws Exception {

		con = pool.getConnection();

		String sql = "select * from member where pw = ? and name = ?";

		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getPw());
		ps.setString(2, dto.getName());

		rs = ps.executeQuery();

		if (rs.next() == true) {
		} else {
		}

		rs.close();
		ps.close();
		con.close();

	}

	public ResaDTO resacall(String id, String pw) throws Exception {

		con = pool.getConnection();

		String sql = "select * from resa where name = ? and pw = ?";

		ResaDTO dto = null;
		ps = con.prepareStatement(sql);

		
		ps.setString(1, id);
		ps.setString(2, pw);
	

		rs = ps.executeQuery();

		while(rs.next()) {
				dto = new ResaDTO();
				String hospital = rs.getString(2);
				String address = rs.getString(3);
				String body = rs.getString(4);
				String doctor = rs.getString(5);
				String date = rs.getString(6);
				String price = rs.getString(7);
				dto.setName(id);
				dto.setHospital(hospital);
				dto.setAddress(address);
				dto.setBody(body);
				dto.setDoctor(doctor);
				dto.setDate(date);
				dto.setPrice(price);
		}
		/* String[] yeyakDay = dto.getDate().split("-"); */
		
		
		/*
		 * if(yeyakDay[1].equals(todayMonth)) {//calendar객체의 이번달
		 * if(yeyakDay[2].equals(todayDate)) { if(yeyakDay[3].equals(todayHour)) {
		 * return null; } } }
		 */

		rs.close();
		ps.close();
		con.close();
		
		return dto;
	}
	
	public String getAddr(String id, String pw) throws Exception {
		
		con = pool.getConnection();
		
		String sql = "select addr from member where name = ? and pw = ?";
		
		String address = null;
		
		ps = con.prepareStatement(sql);
		
		
		ps.setString(1, id);
		ps.setString(2, pw);
		
		
		rs = ps.executeQuery();
		
		while(rs.next()) {
			address = rs.getString(1);
		}
		
		rs.close();
		ps.close();
		pool.freeConnection(con);
		
		return address;
	}
}
