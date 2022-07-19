package beans;

public class ShipmentBean {

	private String snum;
	private String pnum;
	private String jnum;
	private String quantity;
	
	private Exception exception;
	
	public void setSnum(String snum)
	{
		this.snum = snum;
	}
	
	public String getSnum()
	{
		return this.snum;
	}

	public void setPnum(String pnum)
	{
		this.pnum = pnum;
	}
	
	public String getPnum()
	{
		return this.pnum;
	}
	
	public void setJnum(String jnum)
	{
		this.jnum = jnum;
	}
	
	public String getJnum()
	{
		return this.jnum;
	}
	
	public void setQuantity(String quantityString)
	{
		this.quantity = quantityString;
		try {
			Integer.parseInt(quantityString);
		} 
		catch(NumberFormatException e)
		{
			this.exception = e;
			this.quantity = "-1";
		}
	}
	
	public String getQuantity()
	{
		return this.quantity;
	}
	
	public void setException(Exception exception)
	{
		this.exception = exception;
	}
	
	public Exception getException()
	{
		return this.exception;
	}
	
}
