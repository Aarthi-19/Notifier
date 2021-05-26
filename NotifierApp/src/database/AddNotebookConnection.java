package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

import GetterSetter.Logingetset;
import GetterSetter.Notebookgetset;
public class AddNotebookConnection {
    static int c=0;
    static int ins=0,ins1=0;
    static int count=1;
    static String ans=null;
	public static int toAdd(Notebookgetset obj) throws ClassNotFoundException, SQLException {
        try
         {
		String email=obj.getEmail();
		String Notebook=obj.getNotebook();
		System.out.println(email+"Email");
		System.out.println(Notebook+"note");		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","Aarthi@123");
       Statement st=conn.createStatement();
       String sql="select * from notebook where email='"+email+"'";
       ResultSet rs;
       rs=st.executeQuery(sql);
       while(rs.next())
       {
       for(int i=2;i<=12;i++)
       {
    	   if(rs.getString(i)==null)
    	   {
    		   String tablename="Notebook"+i;
        ins=st.executeUpdate("update notebook set "+tablename+"='"+Notebook+"' where email='"+email+"'");
        ins1=st.executeUpdate("update notes set NotebookName='"+Notebook+"' where email='"+email+"'");

        break;
    	   }
      }
         }
         }
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return ins;
	}
		}
	
