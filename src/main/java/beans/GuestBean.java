package beans;

public class GuestBean {

	private String firstName;
	private String lastName;
	private String email;
	
	public void setFirstName(String name)
	{
		firstName = name;
	}
	
	public String getFirstName()
	{
		return firstName;
	}
	
	public void setLastName(String name)
	{
		lastName = name;
	}
	
	public String getLastName()
	{
		return lastName;
	}
	
	public void setEmail(String address)
	{
		email = address;
	}
	
	public String getEmail()
	{
		return email;
	}
}
