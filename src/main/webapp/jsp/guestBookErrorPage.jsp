<!DOCTYPE html>
<html lang="en">

<%@ page isErrorPage="true"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<head>
<title>Error!</title>
<style type="text/css">
<!--
body {
	background: black;
}

.bigRed {
	font-size: 2em;
	color: red;
	font-weight: bold;
}

#once {
	color: lime;
}
-->
</style>
</head>
<body>
	<p class="bigRed">
	
	<%
	if (exception instanceof SQLException)
	{
	%>
		A SQLException
		
		<%
		}
	else if (exception instanceof ClassNotFoundException)
	{
		%>
		A ClassNotFoundException
		<%
	}
	else{
		%>
		An Exception
		<%
		} 
		%>
		
		 occurred while interacting with the guestbook database.
	
	</p>
	<p class = "bigRed">
	The error message was: <br/>
	<span id="once"> <%= exception.getMessage() %> </span>
	</p>
	<p class = "bigRed"> Please try again later </p>
</body>
</html>


