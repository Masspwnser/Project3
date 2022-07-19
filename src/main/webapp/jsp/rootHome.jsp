<!DOCTYPE html>
<html lang="en">

<%@ page errorPage="errorPage.jsp"%>

<%@ page import="java.util.*"%>
<%@ page import="beans.*"%>
<%@ page import="java.sql.*"%>

<jsp:useBean id="guestData" scope="request" class="beans.GuestDataBean" />

<head>
<title>CNT4714 Project 3</title>
<meta charset="utf-8">
<style type="text/css">
<!--
body {
	background: black;
	color: lime;
	text-align: center;
	font-family: Arial;
}

h1 {
	color: yellow;
	font-size: 28pt;
}

h2 {
	color: lime;
	font-size: 24pt;
}

input {
	color: yellow;
	background: #D3D3D3;
	font-weight: bold;
	font-size: 16pt;
}

input[type="text"] {
	background: #2F4F4F;
	font-size: 16pt;
}

input[type="submit"] {
	background: #696969;
	color: red;
}

input[type="reset"] {
	color: red;
}

p {
	color: black;
	font-size: 13pt;
}

table {
	font-family: Verdana;
	border: 3px solid black;
	align: center;
}

textarea {
	background: blue;
	color: white;
	font-family: Verdana;
	font-size: 15pt;
	width: 900px;
	height: 275px;
}

th, td {
	padding: 5px;
	border: 1px solid white;
	color: lime;
	background: black;
}

.main {
	color: white;
}

.center {
	margin-left: auto;
	margin-right: auto;
}

#bl {
	color: #708090
}
-->
</style>
</head>
<body>
	<jsp:setProperty name="guestData" property="query" />
	
	<script>
		function hideTable() {
		    document.getElementById("resultTable").style.display = 'none';
		    document.getElementById("businessTable").style.display = 'none';
		    document.getElementById("errorTable").style.display = 'none';
		}
	</script>

	<form action="rootHome.jsp" method="post">
		<h1>
			<b> Welcome to the CNT4714 Project 3 Enterprise Database System</b><br>
		</h1>
		<h2>A Servlet/JSP-based Multi-tiered Enterprise Application Using
			a Tomcat Container</h2>
		<hr class="solid">
		<h3>
			You are connected to the Project 3 Enterprise System database as a
			root-level user. <br> Please enter any valid SQL query or update
			command in the box below.
		</h3>
		<hr class="solid">

		<table class="center">
			<tr>
				<td><textarea rows="15" cols="50" name = "query"></textarea></td>
			</tr>
		</table>

		<input type="submit" value="Execute Command" /> 
		<input type="reset" value="Reset Form" />
		<input type="button" value="Clear Results" onclick="hideTable();"/>

		<hr class="solid">
		
		<h3>Database Results:</h3>

		<%
		guestData.executeQuery();
		ResultSet res = guestData.getStatement().getResultSet();

		if (guestData.getException() != null && guestData.getClear() == "f") {
			// ERROR
		%>
		<table id='errorTable' class='center'>
		<tr><td style="background: red;"> <span style="color: white;">An error has occurred. The error message is displayed below:
		<br><br> <%=guestData.getException().getMessage()%>
		</span></td></tr> </table>


		<%
		guestData.clearException();
		} else if (guestData.getClear() == "f" && guestData.getQuery() != null && guestData.getException() == null) {
			%>
			<table id='businessTable' class='center'>
			<tr><td style="background: green;"> <span style="color: white;">Successful query.
				<br> I am business data
				</span></td></tr> </table>
				
			<%

		if (guestData.getQuery().trim().toLowerCase().startsWith("select") && res != null) {

			// DISPLAY TABLE
		%>
		
		<table id='resultTable' class='center'>
		
		<%-- Iterate through column names --%>
			<thead>
				<tr>
					<% 
					ResultSetMetaData meta = res.getMetaData();
					for (int i = 1; i <= meta.getColumnCount(); i++)
					{
					%>
					<th style="width: 110px; color:white; background: red;"><%=meta.getColumnName(i) %></th>
					<% } %>
				</tr>
			</thead>
			<tbody>


		<%-- Iterate through everything else--%>
				<%
				res.first();
				while (res.next())
				{
				%>

				<tr>
				
				<% 
				for (int i = 1; i <= meta.getColumnCount(); i++)
				{
				%>
					<td class="striped" style="background: gray; color:white;"><%=res.getString(i)%> </td>
					
					<% } %>
				</tr>
				<%} %>
			</tbody>
</table>
		<%
		} else if (guestData.getClear() == "t"){ guestData.setClear("f"); }
		}
		%>
	</form>
</body>
</html>


