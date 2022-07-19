<!DOCTYPE html>
<html lang="en">

<%@ page errorPage="errorPage.jsp"%>

<%@ page import="java.util.*"%>
<%@ page import="beans.*"%>

<jsp:useBean id="guestData" scope="request" class="beans.GuestDataBean" />

<head>
<title>Guest Guest List</title>
<meta charset="utf-8">
<style type = "text/css">
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
	<h1>Our Current Guest List</h1>
	<table id='guests' class='center'>
		<thead>
			<tr>

				<th style="width: 110px;">Last name</th>
				<th style="width: 110px;">First name</th>
				<th style="width: 250px;">Email</th>

			</tr>
		</thead>
		<tbody>

			<%
			List guestList = guestData.getGuestList();
			Iterator guestListIterator = guestList.iterator();
			GuestBean guest;
			while (guestListIterator.hasNext()) {
				guest = (GuestBean) guestListIterator.next();
			%>

			<tr>
				<td class="striped"><%=guest.getLastName()%></td>
				<td class="striped"><%=guest.getFirstName()%></td>
				<td class="striped"><a href="mailto:<%=guest.getEmail()%>">
						<%=guest.getEmail()%></a></td>
			</tr>

			<%
			}
			%>
		</tbody>
	</table>

</body>
</html>


