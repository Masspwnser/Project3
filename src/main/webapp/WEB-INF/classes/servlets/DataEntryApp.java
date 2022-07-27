/* Name: Evan Hausman
 Course: CNT 4714 – Summer 2022 – Project Three
 Assignment title: A Three-Tier Distributed Web-Based Application
 Date: August 4, 2022
*/

package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import com.mysql.cj.jdbc.MysqlDataSource;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DataEntryApp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MysqlDataSource dataSource;
	private Connection jdbcConnection;
	private Statement statement;
	public String message;

	public DataEntryApp() throws SQLException, IOException {
		Properties properties = new Properties();
		FileInputStream filein = new FileInputStream("D:/eclipse/java-2021-03/eclipse-workspace/Project3/src/main/webapp/WEB-INF/lib/dataentry.properties");
		properties.load(filein);

		dataSource = new MysqlDataSource();
		dataSource.setUser(properties.getProperty("MYSQL_DB_USERNAME"));
		dataSource.setPassword(properties.getProperty("MYSQL_DB_PASSWORD"));
		dataSource.setURL(properties.getProperty("MYSQL_DB_URL"));
		
		filein.close();

		jdbcConnection = dataSource.getConnection();

		statement = jdbcConnection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String field1 = request.getParameter("field1");
		String field2 = request.getParameter("field2");
		String field3 = request.getParameter("field3");
		String field4 = request.getParameter("field4");
		message = "";

		try {
			statement.executeUpdate("INSERT INTO shipments VALUES ('" + field1 + "', '" + field2 + "', '" + field3 + "', '" + field4 + "')");
			// Business Logic
			int quantity = Integer.parseInt(field4);
			if (quantity >= 100) {
				statement.executeUpdate("UPDATE suppliers SET status = status + 5 WHERE snum = '" + field2 + "'");
				
				message = "<tr><td style=\"background: green;\"><font color=#FFFFFF><b>"
						+ "The statement executed succesfully.</b><br><br>" 
						+ "Business Logic Detected!<br>";
			}
			else
			{
				message = "<tr><td style=\"background: green;\"><font color=#FFFFFF><b>"
						+ "The statement executed succesfully.</b><br><br>" 
						+ "No Business Logic Detected!<br></tr></td></font>";
			}
		} catch (Exception e) {
			message = "<tr><td style=\"background: red;\"><font color=#FFFFFF><b>"
					+ "Error executing the SQL statement:</b><br>" 
					+ e.getMessage() + "</tr></td></font>";
		}

		request.setAttribute("message", message);
		request.getRequestDispatcher("/dataentryHome.jsp").forward(request, response);
	}

}
