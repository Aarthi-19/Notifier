package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import GetterSetter.Logingetset;

public class LoginConnection {
	public static int toLogin(Logingetset log) throws ClassNotFoundException, SQLException {
        int output=0;
		try
         {
		String email=log.getEmail();
		String password=log.getPassword();
		System.out.println(email);
		System.out.println(email);		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","Aarthi@123");
	   	
		String sql="select * from signup where email='"+email+"' and password='"+password+"'";	    		
		Statement st=conn.createStatement();
		ResultSet rs=st.executeQuery(sql);
		rs.next();
        if(rs.getRow()!=0)
        {
        	output=1;
        	System.out.println(output);
	    }
        else
        {
        	output=2;
        	System.out.println(output);
        }
}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return output;

	}
}
