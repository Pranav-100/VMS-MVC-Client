<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Citizen</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        .form-container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        label {
            display: inline-block;
            width: 150px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        input, select {
            width: calc(100% - 160px);
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Add Citizen</h1>
        <form action="${pageContext.request.contextPath}/citizen/saveCitizen" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required /><br>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required /><br>

            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" required /><br>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required /><br>

            <label for="dateOfBirth">Date of Birth:</label>
            <input type="date" id="dateOfBirth" name="dateOfBirth" required /><br>


            <input type="submit" value="Add Citizen"/>
        </form>
    </div>
</body>
</html>
