package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import GetterSetter.Logingetset;
import GetterSetter.SignUpgetset;

public class SignUpConnection {

public static int tosignUp(SignUpgetset reg) throws ClassNotFoundException, SQLException {

	int Register = 0;
	try
	{
	    String email=reg.getEmail();
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","Aarthi@123");
	    ResultSet rs,rs1;
	    Statement st=conn.createStatement();
		String sql="insert into signup(username,mobilenumber,email,password,confirmpassword) values(?,?,?,?,?)";
		String sql1="select * from signup where email='"+email+"'";	
		String sql2="insert into notebook(email)values(?)";
		String sql3="insert into notes(email)values(?)";
		rs=st.executeQuery(sql1);
		rs.next();
		System.out.println(rs.getRow());
		if(rs.getRow()==0)
		{
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, reg.getUsername());
			System.out.println(reg.getUsername()+"hello");
	        ps.setString(2, reg.getMobilenumber());
	        ps.setString(3, reg.getEmail());
	        ps.setString(4, reg.getPassword());
	        ps.setString(5, reg.getConfirmpassword());
	        Register=ps.executeUpdate();
	        System.out.println(Register);
	        PreparedStatement ps1=conn.prepareStatement(sql2);
	        ps1.setString(1, reg.getEmail());
	        ps1.executeUpdate();
	        PreparedStatement ps2=conn.prepareStatement(sql3);
	        ps2.setString(1, reg.getEmail());
	        ps2.executeUpdate();
		}
		
		else
		{
			Register=2;
			System.out.println(Register);
		}
	}
	catch(Exception e)
	{
	e.printStackTrace();
	}	
	return Register;
}
}
	
	
	
	

