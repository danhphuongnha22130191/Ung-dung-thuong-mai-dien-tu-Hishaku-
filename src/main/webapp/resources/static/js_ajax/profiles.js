$("#update-info-form").on("submit", function(event) {
    event.preventDefault();
	var formData = $("#update-info-form").serialize();
    formData += "&action=updateInfo";

    $.ajax({
        url: "profiles",
        type: "POST",
        data: formData,
        success: function(response) {
            if (response.status === "success") {
                $("#update-info-success").text(response.message).show();
                setTimeout(function() {
                    $("#update-info-success").fadeOut();
                }, 1000);
            } else {
                $("#update-info-error").text(response.message).show();
                setTimeout(function() {
                    $("#update-info-error").fadeOut();
                }, 1000);
            }
        },
        error: function(xhr, status, error) {
            $("#update-info-error").text("Error: " + xhr.responseText).show();
            setTimeout(function() {
                $("#update-info-error").fadeOut();
            }, 1000);
        }
    });
});


$("#change-pass-form").on("submit", function(event) {
    event.preventDefault();

    var oldPassword = $("#current-password").val();
    var newPassword = $("#new-password").val();
    var confirmPassword = $("#confirm-password").val();

    if (!oldPassword) {
        $("#change-pass-error").text("Current password is not correct.").show();
        setTimeout(function() {
            $("#change-pass-error").fadeOut();
        }, 2000);
        return;
    }

    if (newPassword !== confirmPassword) {
        $("#change-pass-error").text("New password and confirm password do not match.").show();
        setTimeout(function() {
            $("#change-pass-error").fadeOut();
        }, 2000);
        return; 
    }
    var formData = $(this).serialize();
    formData += "&action=changePass";

    $.ajax({
        url: "profiles",
        type: "POST",
        data: formData,
        success: function(response) {
            if (response.status === "success") {
                $("#change-pass-success").text(response.message).show();
                setTimeout(function() {
                    $("#change-pass-success").fadeOut();
                }, 2000);
            } else {
                $("#change-pass-error").text(response.message).show();
                setTimeout(function() {
                    $("#change-pass-error").fadeOut();
                }, 2000);
            }
        },
        error: function(xhr, status, error) {
            $("#change-pass-error").text("Error: " + xhr.responseText).show();
            setTimeout(function() {
                $("#change-pass-error").fadeOut();
            }, 2000);
        }
    });
});
