<!-- dashboard.cfm -->
<cfif !session.keyexists('userLoggedIn') or !session.userLoggedIn>
    <!-- Redirect to login page if not logged in -->
    <cflocation url="loginForm.cfm" addtoken="false">
<cfelse>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <!-- Include your head section (meta tags, title, styles, etc.) -->
    </head>
    <body>

    <cfoutput>
    <div class="container">
        <h2>Welcome to the Dashboard, #session.userEmail#!</h2>
        <p>This is a secure page accessible only to logged-in users.</p>
        <a href="../logout.cfm">Logout</a>
    </div>
    </cfoutput>

    </body>
    </html>
</cfif>
