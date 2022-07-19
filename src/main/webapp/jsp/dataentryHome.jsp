<!DOCTYPE html>
<html lang="en">

<%@ page errorPage="errorPage.jsp"%>

<%-- TODO: Modify paths below --%>
<jsp:useBean id="shipment" scope="page" class="beans.ShipmentBean" />
<jsp:useBean id="shipmentData" scope="page" class="beans.GuestDataBean" />

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
	color: red;
	font-size: 28pt;
}

h2 {
	color: cyan;
	font-size: 24pt;
}

h3 {
	color: white;
	font-size: 16;
}

input {
	color: black;
	background: white;
	font-weight: bold;
	font-size: 16pt;
}

input[type="text"] {
	background: white;
	font-size: 16pt;
}

input[type="submit"] {
	background: white;
	color: red;
}

input[type="reset"] {
	color: red;
	background: white;
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

table.table1 {
	background:red;
	border: 3px solid white;
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

.bigRed {
	font-size: 2em;
	color: red;
	font-weight: bold;
}

#bl {
	color: #708090
}
-->
</style>
</head>
<body>
	<jsp:setProperty name="shipment" property="*" />

	<form action="dataentryHome.jsp" method="post">
		<h1>
			<b> Welcome to the CNT4714 Project 3 Enterprise Database System</b><br>
		</h1>
		<h2>A Servlet/JSP-based Multi-tiered Enterprise Application Using
			a Tomcat Container</h2>
		<hr class="solid">
		<h3>
			You are connected to the Project 3 Enterprise System database as a
			data-entry-level user. <br> Please enter the data values in the
			form below to add a new record to the shipments table.
		</h3>
		<hr class="solid">

		<table class="center">
			<tr>
				<td>snum</td>
				<td>pnum</td>
				<td>jnum</td>
				<td>quantity</td>
			</tr>
			<tr>
				<td><input type='text' name='snum' /></td>
				<td><input type='text' name='pnum' /></td>
				<td><input type='text' name='jnum' /></td>
				<td><input type='text' name='quantity' /></td>
			</tr>
		</table>

		<input type="submit" value="Enter Record Into Database" /> 
		<input type="reset" value="Clear Results" />

		<hr class="solid">

		<h3>Database Results:</h3>

		<%
		System.out.println(shipment.getPnum() + " " + shipment.getSnum() + " " +shipment.getJnum() + " " + shipment.getQuantity());
		if (shipment.getPnum() != null && shipment.getSnum() != null && shipment.getJnum() != null && shipment.getQuantity() != null && shipment.getQuantity() != "-1") {

			boolean businessLogic = shipmentData.addShipment(shipment);

			if (shipment.getException() != null) {
		%>
		
		<table class="table1"> 
		<tr><td style="background: red;"> <span style="color: white;">An error has occurred. The error message is displayed below:
		<br><br> <%=shipment.getException().getMessage()%>
		</span></td></tr>
		</table>
		
		<%
		} else {
		if (!businessLogic) {
		%>
		
		<h2>Success withOUT business logic</h2>
		
		<%
		} else {
		%>
		
		<h2>Success with business logic</h2>
		<%
		}
		}
		}
		%>
	</form>

</body>
</html>


