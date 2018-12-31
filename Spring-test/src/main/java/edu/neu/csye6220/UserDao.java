package edu.neu.csye6220;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;


public class UserDao {
	public String addUser(Users users,DataSource dataSource) {
		Connection con = null;
		if(users.getPhone()==null) {
			users.setPhone("0");
		}
		try {
			con = dataSource.getConnection();
			Statement st=con.createStatement();
			String str="INSERT INTO USERS"
					+ " VALUES(\""+users.getUsername()+"\",\""
					+users.getPassword()+"\",true,\""
					+users.getFirstName()+"\",\""
					+users.getLastName()+"\",\""
					+users.getBirthDate()+"\",\""
					+users.getEmail()+"\",\""
					+users.getAddress()
//					+"\",\""+users.getPhone()
					+"\",\""+0
					+"\""+ ");";
			st.executeUpdate(str);
			str="INSERT INTO AUTHORITIES (USERNAME, AUTHORITY)"
					+ " VALUES(\""+users.getUsername()+"\",\""
					+users.getRole()+"\");";
			st.executeUpdate(str);
			st.close();
			con.close();
			System.out.println("successful");
			return "successful";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "fail";
	}
}
