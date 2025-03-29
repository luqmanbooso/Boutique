<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error Page</title>
</head>
<body>
    <h2>Error Occurred</h2>
    <p>Sorry, an error occurred during the processing of your request.</p>
    <p>Error Message: ${exception.message}</p>
    <p><a href="viewRooms.jsp">Return to Home Page</a></p>
</body>
</html>
