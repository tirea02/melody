<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Add jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <title>User Detail</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            color: #007bff;
        }

        .card {
            margin-top: 20px;
        }

        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1>User Detail</h1>
    <c:if test="${not empty userAccount}">
        <div class="card mt-3">
            <div class="card-body">
                <p class="card-text">User ID: ${userAccount.userAccountId}</p>
                <p class="card-text">Name: ${userAccount.name}</p>
                <p class="card-text">Birth Date: ${userAccount.birthDate}</p>
                <p class="card-text">Age Group: ${userAccount.ageGroup}</p>
                <p class="card-text">Account ID: ${userAccount.accountId}</p>
                <p class="card-text">Password: ****</p>
                <p class="card-text">Email: ${userAccount.email}</p>
                <p class="card-text">Gender: ${userAccount.gender}</p>
                <p class="card-text">Profile Image: ${userAccount.profileImage}</p>
                <p class="card-text">User Hashtags: ${userAccount.userHashtags}</p>
            </div>
        </div>
    </c:if>
    <c:if test="${empty userAccount}">
        <div class="alert alert-danger mt-3" role="alert">
            User Account not found.
        </div>
    </c:if>
</div>

<br>
<a href="${pageContext.request.contextPath}/index.jsp">bach to index</a>
</body>

</html>
