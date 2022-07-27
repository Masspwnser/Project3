<%-- Name: Evan Hausman
 Course: CNT 4714 – Summer 2022 – Project Three
 Assignment title: A Three-Tier Distributed Web-Based Application
 Date: August 4, 2022
--%>

<!DOCTYPE html>
<html lang="en">


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

input[type="submit"] {
	background: white;
	color: red;
}

input[type="button"] {
	color: red;
	background: white;
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

.center {
	margin-left: auto;
	margin-right: auto;
}
-->
</style>
</head>
<body>
	<script>
		function hideTable() {
			document.getElementById("resultTable").style.display = 'none';
		}
	</script>

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

	<form action="dataEntry" method="post">
		<table class="center">
			<tr>
				<td>snum</td>
				<td>pnum</td>
				<td>jnum</td>
				<td>quantity</td>
			</tr>
			<tr>
				<td><input type='text' name='field1' /></td>
				<td><input type='text' name='field2' /></td>
				<td><input type='text' name='field3' /></td>
				<td><input type='text' name='field4' /></td>
			</tr>
		</table>

		<input type="submit" value="Enter Record Into Database" /> <input
			type="button" value="Clear Results" onclick="hideTable();" />
	</form>

	<hr class="solid">

	<h3>Database Results:</h3>
	<% 
	Object message = request.getAttribute("message");
	if (message == null)
		message = "";
	%>
	<table id="resultTable" class='center'>
		<%=message%>
	</table>
</body>
</html>


