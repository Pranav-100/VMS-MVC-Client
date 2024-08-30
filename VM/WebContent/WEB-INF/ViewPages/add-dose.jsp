<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Dose</title>
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
            width: calc(100% - 170px);
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

        .form-row {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .form-row input, .form-row select {
            flex: 1;
        }

        .form-row label {
            margin-right: 20px;
        }
    </style>
    <script>
        function updateFieldStates() {
            var doseNumberInput = document.getElementById('doseNumber');
            var vaccineTypeInput = document.getElementById('vaccineType');
            
            // Set Dose Number field read-only if its value is greater than 0
            if (parseInt(doseNumberInput.value) > 0) {
                doseNumberInput.readOnly = true;
            } else {
                doseNumberInput.readOnly = false;
            }

            // Set Vaccine Type field read-only if it has any value
            if (vaccineTypeInput.value.trim().length > 0) {
                vaccineTypeInput.readOnly = true;
            } else {
                vaccineTypeInput.readOnly = false;
            }
        }

        window.onload = function() {
            updateFieldStates(); // Initial check on page load

            // Optional: Handle real-time updates if needed
            document.getElementById('doseNumber').addEventListener('input', updateFieldStates);
            document.getElementById('vaccineType').addEventListener('input', updateFieldStates);
        }
    </script>
</head>
<body>
    <div class="form-container">
        <h1>Add Dose</h1>
        <form action="${pageContext.request.contextPath}/citizen/addDoseforUser" method="post">
            <div class="form-row">
                <label for="userId">User ID:</label>
                <input type="number" id="userId" name="userId" value="${vaccineDto.userId}" readonly />
            </div>
            <div class="form-row">
                <label for="doseNumber">Dose Number:</label>
                <input type="number" id="doseNumber" name="doseNumber" value="${vaccineDto.doseNumber}" />
            </div>
            <div class="form-row">
                <label for="vaccinationDate">Vaccination Date:</label>
                <input type="date" id="vaccinationDate" name="vaccinationDate" value="${vaccineDto.vaccinationDate}" />
            </div>
            <div class="form-row">
                <label for="vaccineType">Vaccine Type:</label>
                <input type="text" id="vaccineType" name="vaccineType" value="${vaccineDto.vaccineType}" />
            </div>
            <div class="form-row">
                <input type="submit" value="Add Dose" />
            </div>
        </form>
    </div>
</body>
</html>
