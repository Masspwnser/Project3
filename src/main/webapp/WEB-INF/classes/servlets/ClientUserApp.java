/* Name: Evan Hausman
 Course: CNT 4714 – Summer 2022 – Project Three
 Assignment title: A Three-Tier Distributed Web-Based Application
 Date: August 4, 2022
*/

package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import com.mysql.cj.jdbc.MysqlDataSource;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class ClientUserApp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MysqlDataSource dataSource;
	private Connection jdbcConnection;
	private Statement statement;
	public String message;

	public ClientUserApp() throws SQLException, IOException {
		Properties properties = new Properties();
		FileInputStream filein = new FileInputStream("D:/eclipse/java-2021-03/eclipse-workspace/Project3/src/main/webapp/WEB-INF/lib/client.properties");
		properties.load(filein);

		dataSource = new MysqlDataSource();
		dataSource.setUser(properties.getProperty("MYSQL_DB_USERNAME"));
		dataSource.setPassword(properties.getProperty("MYSQL_DB_PASSWORD"));
		dataSource.setURL(properties.getProperty("MYSQL_DB_URL"));

		jdbcConnection = dataSource.getConnection();

		statement = jdbcConnection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String query = request.getParameter("query");
		message = "<table id='altTable' class='center'><tr><td style=\"background: lime;\"><font color=#000000><b>"
				+ "The statement executed succesfully.<br>";

		try {
			
			statement.execute(query);

			ResultSet res = statement.getResultSet();
			ResultSetMetaData meta = (res == null) ? null : res.getMetaData();
			
			// Build table
			if (res != null) {
				message = "<table id='resultTable' class='center'><thead><tr>";
				for (int i = 1; i <= meta.getColumnCount(); i++) {
					message += "<th style='width: 110px; color: white; background: red;'>" + meta.getColumnName(i)
							+ "</th>";
				}
				message += "</tr></thead><tbody>";
				
				res.first();
				do {
					message += "<tr>";
					for (int i = 1; i <= meta.getColumnCount(); i++) {

						message += "<td class='striped' style='background: gray; color: white;'>" + res.getString(i)
								+ "</td>";
					}
					message += "</tr>";
				} while (res.next());
				message += "</tbody></table>";
			}

		} catch (Exception e) {
			message = "<table id='altTable' class='center'><tr><td style=\"background: red;\"><font color=#FFFFFF><b>"
					+ "Error executing the SQL statement:</b><br>" + e.getMessage() + "</tr></td></font></table>";
		}

		request.setAttribute("message", message);
		request.getRequestDispatcher("/clientHome.jsp").forward(request, response);
	}

}
