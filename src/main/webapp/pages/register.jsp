<!DOCTYPE html>
<html>
<head>
  <title>User Registration</title>
  <link rel="stylesheet" href="../css/register.css">
  <!-- Include jQuery library -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- Include Bootstrap CSS and JS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<h2>User Registration</h2>
<form id="registrationForm" action="${pageContext.request.contextPath}/register" method="post">
  <label>Name:</label>
  <input type="text" name="name" required>
  <div id="nameError"></div>

  <label>accountId:</label>
  <input type="text" name="accountId" required>
  <div id="accountIdError"></div>


  <label>Birth Date:</label>
  <input type="date" name="birthDate" required>
  <div id="birthDateError"></div>

  <label>Email:</label>
  <input type="email" name="email" required>
  <div id="emailError"></div>

  <label>Gender:</label>
  <input type="radio" name="gender" value="Male"> Male
  <input type="radio" name="gender" value="Female"> Female
  <br>

  <label>Password:</label>
  <input type="password" name="password" required>
  <div id="passwordError"></div>

  <label>Confirm Password:</label>
  <input type="password" name="passwordConfirm" required>
  <div id="passwordConfirmError"></div>

  <label>Input HashTag:</label>
  <input type="text" name="hashtag" required>



  <div id="errorMessages"></div>

  <input type="submit" value="Register" id="submitButton">
</form>
<script src="../js/registerValidation.js"></script>
</body>
</html>
