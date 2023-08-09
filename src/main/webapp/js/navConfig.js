function updateLnbContent() {
    var lnbElement = document.querySelector(".lnb");

    // Perform AJAX request to fetch user account data
    $.ajax({
        url: "getUserAccount",
        dataType: "json",
        success: function(data) {
            if (data.name) {
                // User is logged in
                $(".lnb").html(data.name + "님 환영합니다 <a href='" + data.contextPath + "/logout'>Sign Out</a> <div class='darkmode'></div>");
            } else {
                // User is not logged in
                $(".lnb").html("<a href='" + data.contextPath + "/pages/login.jsp'>LOGIN</a> <a href='" + data.contextPath + "/pages/register.jsp'>SIGN UP</a> <div class='darkmode'></div>");
            }

        },
        error: function(xhr, status, error) {
            console.error("AJAX request error:", status, error);
        }
    });
}


// Call the function to update the LNB content
updateLnbContent();

