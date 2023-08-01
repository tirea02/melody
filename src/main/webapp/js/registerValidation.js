document.getElementById("registrationForm").onsubmit = function() {
    // Get form inputs
    var name = document.getElementsByName("name")[0].value;
    var birthDate = document.getElementsByName("birthDate")[0].value;
    var email = document.getElementsByName("email")[0].value;
    var accountId = document.getElementsByName("accountId")[0].value;
    var password = document.getElementsByName("password")[0].value;
    var passwordConfirm = document.getElementsByName("passwordConfirm")[0].value;
    var hashtag = document.getElementsByName("hashtag")[0].value;

    // Clear previous error messages
    document.getElementById("nameError").innerHTML = "";
    document.getElementById("birthDateError").innerHTML = "";
    document.getElementById("emailError").innerHTML = "";
    document.getElementById("accountIdError").innerHTML = "";
    document.getElementById("passwordError").innerHTML = "";
    document.getElementById("passwordConfirmError").innerHTML = "";

    // Perform name validation
    if (name.trim() === "") {
        document.getElementById("nameError").innerHTML = "Please enter your name.";
        return false;
    }

    if (accountId.trim() === "") {
        document.getElementById("accountId").innerHTML = "Please enter your name.";
        return false;
    }

    // Perform birth date validation
    if (birthDate.trim() === "") {
        document.getElementById("birthDateError").innerHTML = "Please select your birth date.";
        return false;
    }

    // Perform email format validation using regular expression
    var emailPattern = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i;
    if (!emailPattern.test(email)) {
        document.getElementById("emailError").innerHTML = "Invalid email format.";
        return false;
    }

    // Perform password match validation
    if (password !== passwordConfirm) {
        document.getElementById("passwordConfirmError").innerHTML = "Passwords do not match.";
        return false;
    }

    // Disable submit button to prevent multiple submissions
    document.getElementById("submitButton").disabled = true;

    // If all validations pass, allow form submission
    return true;
};
