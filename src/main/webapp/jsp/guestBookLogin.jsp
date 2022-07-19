<!DOCTYPE html>
<html lang="en">

<%@ page errorPage="errorPage.jsp"%>

<jsp:useBean id="guest" scope="page" class="beans.GuestBean" />
<jsp:useBean id="guestData" scope="page" class="beans.GuestDataBean" />

<head>
<title>Guest Book Login</title>
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
	<jsp:setProperty name="guest" property="*" />

	<%
	if (guest.getFirstName() == null || guest.getLastName() == null || guest.getEmail() == null) {
	%>

	<form action="guestBookLogin.jsp" method="post">
		<h1>
			<b> Welcome to the CNT4714 JSP Driven Guest Book</b><br>
		</h1>
		<h2>Enter your first name, last name and email address to
			register in our guest book.</h2>
		<table class="center">
			<tr>
				<td>First name</td>
				<td><input type='text' name='firstName' /></td>
			</tr>

			<tr>
				<td>Last name</td>
				<td><input type='text' name='lastName' /></td>
			</tr>

			<tr>
				<td>Email</td>
				<td><input type='text' name='email' /></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="Submit" /></td>
			</tr>

		</table>
	</form>

	<%
	} else {
		guestData.addGuest(guest);
	%>
	<jsp:forward page="guestBookView.jsp" />

	<%
	}
	%>
</body>
</html>


