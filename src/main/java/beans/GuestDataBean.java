package beans;

import java.sql.SQLException;
import javax.sql.rowset.*;
import com.mysql.cj.jdbc.MysqlDataSource;

import java.util.ArrayList;

public class GuestDataBean {

	private CachedRowSet rowSet;
	MysqlDataSource dataSource = null;
	
	public GuestDataBean() throws Exception
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		rowSet = RowSetProvider.newFactory().createCachedRowSet();
		rowSet.setUrl("jdbc:mysql://localhost:3306/guestbook?useTimezone=true&serverTimezone=UTC"); // Modify
		rowSet.setUsername("root");
		rowSet.setPassword("PLACEHOLDER"); // Hide
		
		rowSet.setCommand("SELECT firstName, lastName, email FROM guests");
		rowSet.execute();
	}
	
	public ArrayList<GuestBean> getGuestList() throws SQLException
	{
		ArrayList<GuestBean> guestList = new ArrayList<GuestBean>();
		rowSet.beforeFirst();
		
		while(rowSet.next())
		{
			GuestBean guest = new GuestBean();
			guest.setFirstName(rowSet.getString(1));
			guest.setLastName(rowSet.getString(2));
			guest.setEmail(rowSet.getString(3));
			guestList.add(guest);
		}
		return guestList;
	}
	
	public void addGuest(GuestBean guest) throws SQLException
	{
		rowSet.moveToInsertRow();
		rowSet.updateString(1, guest.getFirstName());
		rowSet.updateString(2, guest.getLastName());
		rowSet.updateString(3, guest.getEmail());
		rowSet.insertRow();
		rowSet.moveToCurrentRow();
	}
}
