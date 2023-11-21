<!-- Forms/loginForm.cfm -->
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Include your head section (meta tags, title, styles, etc.) -->
</head>
<body>

<div class="container">
    <h2>Login</h2>

    <cfif session.keyexists('flashMessage') and len(session.flashMessage)>
        <cfoutput>#session.flashMessage#<hr></cfoutput>
    </cfif>

    <form action="login.cfm" method="post">

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <!-- New field for confirming the password -->
        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>

        <button type="submit">Login</button>
    </form>
</div>

</body>
</html>
