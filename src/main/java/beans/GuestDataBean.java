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
	private Exception exception;
	private String query;
	private String clear = "f";

	public GuestDataBean() throws SQLException, IOException {

//		Properties properties = new Properties();
//		FileInputStream filein = null;
//		String propertiesFileName = "root";
//		filein = new FileInputStream("../../../webapp/WEB-INF/lib/properties/" + propertiesFileName + ".properties");
//    	properties.load(filein);

		dataSource = new MysqlDataSource();

		// TODO: properties fileio goes here

		dataSource.setUser("root");
		dataSource.setPassword("Placeholder");
		dataSource.setURL("jdbc:mysql://localhost:3306/project3?useTimezone=true&serverTimezone=UTC");

		jdbcConnection = dataSource.getConnection();

		statement = jdbcConnection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	}

	protected void disconnect() throws SQLException {

		statement.close();

		if (jdbcConnection != null && !jdbcConnection.isClosed()) {
			jdbcConnection.close();
		}
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public String getQuery() {
		return this.query;
	}

	public void executeQuery() throws SQLException {

		if (query == null)
			return;
		try {
			statement.execute(query);

		} catch (Exception e) {
			this.exception = e;
		}
	}

	public Statement getStatement() {
		return this.statement;
	}

	public Exception getException() {
		return this.exception;
	}
	
	public void clearException()
	{
		this.exception = null;
	}

	public void setClear(String clear) {
		System.out.println("Just got set to " + clear);
		this.clear = clear;
	}

	public String getClear() {
		return this.clear;
	}

	// returns:
	// 1 for business logic
	// 0 for not
	// if shipment has an exception, then ignore boolean
	public boolean addShipment(ShipmentBean shipment) throws SQLException {

		// TODO: Implement business logic

		try {
			statement.execute("INSERT INTO shipments VALUES ('" + shipment.getSnum() + "', '" + shipment.getPnum()
					+ "', '" + shipment.getJnum() + "', '" + shipment.getQuantity() + "')");
		} catch (Exception e) {
			shipment.setException(e);
			return false;
		}
		return true;
	}
}
