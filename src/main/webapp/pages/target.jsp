<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Table Data</title>
</head>
<body>
<h1>Table Data</h1>
<table border="1">
    <c:forEach var="row" items="${tableData}">
        <tr>
            <c:forEach var="cell" items="${row}">
                <td>${cell}</td>
            </c:forEach>
        </tr>
    </c:forEach>
</table>
</body>
</html>
