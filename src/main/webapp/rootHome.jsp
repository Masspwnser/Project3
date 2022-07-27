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
	<script>
		function hideTable() {
			document.getElementById("resultTable").style.display = 'none';
			document.getElementById("altTable").style.display = 'none';
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
		root-level user. <br> Please enter any valid SQL query or update
		command in the box below.
	</h3>
	<hr class="solid">

	<form action="rootUser" method="post">
		<table class="center">
			<tr>
				<td><textarea rows="15" cols="50" name="query"></textarea></td>
			</tr>
		</table>

		<input type="submit" value="Execute Command" /> <input type="reset"
			value="Reset Form" /> <input type="button" value="Clear Results"
			onclick="hideTable();" />
	</form>

	<hr class="solid">

	<h3>Database Results:</h3>
	
	<% 
	Object message = request.getAttribute("message");
	if (message == null)
		message = "";
	%>
	<%=message%>
</body>
</html>


