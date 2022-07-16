package beans;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.mysql.cj.jdbc.MysqlDataSource;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.Properties;

public class GuestDataBean {

	MysqlDataSource dataSource;
	private Connection jdbcConnection;
	private Statement statement;

	public GuestDataBean() throws SQLException, IOException {
		String defaultSQL = "SELECT firstName, lastName, email FROM guests";
		Properties properties = new Properties();
		FileInputStream filein = null;

		dataSource = new MysqlDataSource();
		
		// TODO: properties fileio goes here

		dataSource.setUser("root");
		dataSource.setPassword("PLACEHOLDER");
		dataSource.setURL("jdbc:mysql://localhost:3306/guestbook?useTimezone=true&serverTimezone=UTC");

		jdbcConnection = dataSource.getConnection();

		statement = jdbcConnection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	}

	protected void disconnect() throws SQLException {
		
        statement.close();
		
		if (jdbcConnection != null && !jdbcConnection.isClosed()) {
			jdbcConnection.close();
		}
	}

	public ArrayList<GuestBean> getGuestList() throws SQLException {
		ArrayList<GuestBean> guestList = new ArrayList<GuestBean>();
		
		ResultSet res = statement.executeQuery("SELECT * FROM guests");
		
		while (res.next()) {
			GuestBean guest = new GuestBean();
			guest.setFirstName(res.getString(1));
			guest.setLastName(res.getString(2));
			guest.setEmail(res.getString(3));
			guestList.add(guest);
		}
		return guestList;
	}

	public void addGuest(GuestBean guest) throws SQLException {
		
		statement.execute("INSERT INTO guests VALUES ('" + guest.getFirstName() + "', '" + guest.getLastName() + "', '" + guest.getEmail() + "')");
	
	}
}
