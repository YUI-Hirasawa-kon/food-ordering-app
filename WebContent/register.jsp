<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food Ordering System - Register</title> <link rel="stylesheet" href="w3.css" type="text/css">
    </head>
    <body class="w3-light-grey">
        <div class="w3-container w3-center w3-padding-large w3-blue">
            <div class="w3-xxlarge">Food Ordering System</div>
        </div>

        <div class="w3-content" style="max-width:500px; padding-top: 50px; padding-bottom: 50px;">
            <div class="w3-card-4 w3-white w3-padding-large">
                <h2 class="w3-center w3-text-teal">Create New Account</h2>

                <form method="post" action="check.jsp" class="w3-container">

                    <p>
                        <label>Username</label>
                        <input class="w3-input w3-border" type="text" name="uname" value="" required/>
                    </p>
                    <p>
                        <label>Password</label>
                        <input class="w3-input w3-border" type="password" name="pass" value="" required/>
                    </p>
                    <p>
                        <label>Email</label>
                        <input class="w3-input w3-border" type="email" name="email" value="" required/>
                    </p>
                    <p>
                        <label>Phone Number</label>
                        <input class="w3-input w3-border" type="text" name="phone" value="" required/>
                    </p>
                    <p class="w3-center w3-margin-top">
                        <input type="submit" value="Register Now" class="w3-button w3-teal w3-hover-green" />
                    </p>
                </form>

                <div class="w3-center w3-padding-small">
                    <a href="index.jsp" class="w3-text-teal">Already have an account? Sign In</a>
                </div>
            </div>
        </div>

        <footer class="w3-container w3-center w3-padding-32 w3-light-grey">
            <p>Food Ordering System</p>
        </footer>

    </body>
</html>