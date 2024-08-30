<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Citizens</title>
<style>
table {
	border: 1px solid black;
}

td {
	border: 1px solid black;
	padding: 5px;
}

th {
	border: 1px solid black;
	padding: 5px;
}
</style>
</head>
<body>
	<h1>Vaccine Dashboard</h1>
	<br>
	<input type="button" value="Add Citizen" onClick="window.location.href='addCitizen'">
	<br>
	<br>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Phone Number</th>
				<th>Address</th>
				<th>Date Of Birth</th>
				<th>Status</th>
				<th>More Details</th>
			</tr>
		</thead>
		<tbody>
			<!-- Assuming you want to display a single citizen, not a list -->
			<tr>
				<td><c:out value="${citizen.userId}"/></td>
				<td><c:out value="${citizen.name}"/></td>
				<td><c:out value="${citizen.email}"/></td>
				<td><c:out value="${citizen.phoneNumber}"/></td>
				<td><c:out value="${citizen.address}"/></td>
				<td><c:out value="${citizen.dateOfBirth}"/></td>
				<td><c:out value="${citizen.status}"/></td>
				<td><a href="details/${citizen.userId}">More Details</a></td>
			</tr>
		</tbody>
	</table>
</body>
</html>
