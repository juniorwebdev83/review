<cfoutput>
    <cfparam name="form.email" default="">
    <cfparam name="form.password" default="">
    <cfparam name="form.confirmPassword" default="">

    <cfset userCFC = createObject('component', 'user')>

    <cfif structKeyExists(form, 'email') and structKeyExists(form, 'password') and structKeyExists(form, 'confirmPassword')>
        <!-- Form submitted, process login -->
        <cfset email = form.email>
        <cfset password = form.password>
        <cfset confirmPassword = form.confirmPassword>

        <!-- Check if passwords match -->
        <cfif password neq confirmPassword>
            <cfset session.flashMessage = "Error: Password and Confirm Password do not match.">
            <cflocation url="loginForm.cfm">
        </cfif>

        <cfif userCFC.loginUser(email, password, confirmPassword)>
            <!-- Login successful -->
            <cfset session.userLoggedIn = true>
            <cfset session.userEmail = email>

            <cflocation url="dashboard.cfm">
        <cfelse>
            <cfset session.flashMessage = "Error: Invalid email or password.">
            <cflocation url="loginForm.cfm">
        </cfif>
    <cfelse>
        <!-- Display the login form -->
        <cfinclude template="loginForm.cfm">
    </cfif>
</cfoutput>
