<!-- logout.cfm -->
<cfset session.userLoggedIn = false>
<cfset session.userEmail = "">
<cflocation url="forms/loginForm.cfm" addtoken="false">
