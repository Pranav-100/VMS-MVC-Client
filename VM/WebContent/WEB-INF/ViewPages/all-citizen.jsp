<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>List of Citizens</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }

        h1 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f8f8f8;
            color: #333;
            font-weight: bold;
        }

        td {
            color: #555;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        input[type="button"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 20px;
            font-size: 16px;
        }

        input[type="button"]:hover {
            background-color: #45a049;
        }

        a {
            color: #3498db;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #3498db;
            color: white;
            text-align: center;
            line-height: 40px;
            font-size: 18px;
            font-weight: bold;
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
                <th>Avatar</th>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Address</th>
                <th>Date Of Birth</th>
                <th>Status</th>
                <th>Add Dose</th>
                <th>More Details</th>
                <th>Delete Citizen</th>
            </tr>
        </thead>
        <tbody>
            <!-- Iterate over the list of citizens -->
            <c:forEach var="citizen" items="${citizens}">
                <tr>
                    <td>
                        <div class="avatar"><c:out value="${citizen.name.substring(0, 1).toUpperCase()}"/></div>
                    </td>
                    <td><c:out value="${citizen.userId}"/></td>
                    <td><c:out value="${citizen.name}"/></td>
                    <td><c:out value="${citizen.email}"/></td>
                    <td><c:out value="${citizen.phoneNumber}"/></td>
                    <td><c:out value="${citizen.address}"/></td>
                    <td><c:out value="${citizen.dateOfBirth}"/></td>
                    <td><c:out value="${citizen.status}"/></td>
                    <td><a href="${pageContext.request.contextPath}/citizen/addDose/${citizen.userId}">Add Dose</a></td>
                    <td><a href="${pageContext.request.contextPath}/citizen/getMoreDetails/${citizen.userId}">More Details</a></td>
                    <td><a href="${pageContext.request.contextPath}/citizen/delete/${citizen.userId}" onclick="return confirm('Are you sure you want to delete this citizen?');">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
