

package com.ems.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtility {
public static void main(String[] args) {
	createConnection();
}
	public static Connection createConnection()
	{


		Connection con=null;

		try
		{
		Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
		con=DriverManager.getConnection("jdbc:derby:C:\\Users\\Asus\\OneDrive\\Desktop\\Ems\\EMS\\testDB;create=true");
		System.out.println("Db created");


		}


		catch(ClassNotFoundException ex)
		{

			ex.printStackTrace();

		}
		catch(SQLException ex1)
		{
			ex1.printStackTrace();
		}



		return con;
	}

	public void closeConnection(Connection con)
	{


		try
		{
		   con.close();
		}
		catch(SQLException ex)
		{


		}




	}

}