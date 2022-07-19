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

table {
	font-family: Verdana;
	border: 3px solid black;
	align: center;
}

th, td {
	padding: 5px;
	border: 1px solid white;
	color: lime;
	background: black;
}

talbe {
	
}

#once {
	color: lime;
}
-->
</style>
</head>
<body>
	<table>
		<tr>
			<td>
				<p class="bigRed">

					<%
					if (exception instanceof SQLException) {
					%>
					A SQLException

					<%
					} else if (exception instanceof ClassNotFoundException) {
					%>
					A ClassNotFoundException
					<%
					} else {
					%>
					An Exception
					<%
					}
					%>

					occurred while interacting with the guestbook database.

				</p>
				<p class="bigRed">
					The error message was: <br /> <span id="once"> <%=exception.getMessage()%>
					</span>
				</p>
			</td>
		</tr>
	</table>
</body>
</html>


