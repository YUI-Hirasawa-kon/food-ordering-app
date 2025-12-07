<%@page import="com.db.utils.DbConnection"%>
<%@ page import ="java.sql.*"
         %>
<%
    String userid = request.getParameter("uname");
String pwd = request.getParameter("pass");
    Connection con = DbConnection.init();
    Statement st = con.createStatement();
    ResultSet rs;
rs = st.executeQuery("select * from members where uname='" + userid + "' and password='" + pwd + "'");
if (rs.next()) {
        session.setAttribute("userid", userid);
        response.sendRedirect("success.jsp");
} else {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Failed</title>
        <link rel="stylesheet" href="w3.css" type="text/css">
    </head>
    <body class="w3-light-grey w3-display-container" style="height:100vh">

        <div class="w3-display-middle">
            <div class="w3-card-4 w3-white w3-center w3-animate-top" style="width:100%; max-width:400px; padding: 40px;">
                <h2 class="w3-text-teal"><b>Oops!</b></h2>            <p class="w3-large">Wrong Username or Password.</p>
                <div class="w3-light-grey w3-padding w3-round w3-margin-top">
                    Redirecting in 5 seconds...
                </div>
                <br>

      <a href="index.jsp" class="w3-button w3-teal w3-round">Try Again Now</a> </div>
        </div>

        <script>
            setTimeout(function () {
                window.location.href = "index.jsp"
            }, 5000);
</script>
    </body>
</html>
<%
    }
%>