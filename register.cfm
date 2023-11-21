<!-- register.cfm -->
<cfparam name="form.email" default="">
<cfparam name="form.password" default="">

<cfset userCFC = createObject('component', 'user')>

<cfif structKeyExists(form, 'email') and structKeyExists(form, 'password')>
    <!-- Form submitted, process registration -->
    <cfset email = form.email>
    <cfset password = form.password>

    <!-- Call the registerUser function with the form values -->
    <cfif userCFC.registerUser(email=email, password=password)>
        <p>User registered successfully.</p>
        <cflocation url="dashboard.cfm">
    <cfelse>
        <p>Error registering user. Email may already exist.</p>
    </cfif>
<cfelse>
    <!-- Display the registration form -->
    <cfinclude template="Forms/RegisterForm.cfm">
</cfif>
