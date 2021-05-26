package database;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import GetterSetter.Notificationgetset;


public class NotificationConnection {

	
	
	public static List<Notificationgetset> view(Notificationgetset obj) throws SQLException, ClassNotFoundException
	{
		String EmailId=obj.getEmail();

		  
		
		
	    Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","Aarthi@123");
	   	
		String sql="select * from notifiernotes where EmailId='"+EmailId+"'";	    		
		Statement st=conn.createStatement();
		ResultSet rs=st.executeQuery(sql);
		rs.next();
        ArrayList<Notificationgetset> list=new ArrayList<Notificationgetset>();
		while(rs.next())
		{
			obj.setStartDate(rs.getString(4));
			obj.setEndDate(rs.getString(5));
			obj.setRemainderDate(rs.getString(6));
			obj.setStatus(rs.getString(7));
			list.add(obj);
		}
        
	return list;
	
	}
}
