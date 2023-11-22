<!-- register.cfm -->
<cfparam name="form.email" default="">
<cfparam name="form.password" default="">
<cfparam name="form.city" default="">
<cfparam name="form.state" default="">

<cfset userCFC = createObject('component', 'user')>

<cfif structKeyExists(form, 'email') and structKeyExists(form, 'password')>
    <!-- Form submitted, process registration -->
    <cfset email = form.email>
    <cfset password = form.password>
    <cfset city = form.city>
    <cfset state = form.state>

    <!-- Call the registerUser function with the form values -->
    <cfif userCFC.registerUser(email=email, password=password, city=city, state=state)>
        <p>User registered successfully.</p>
        <cflocation url="dashboard.cfm">
    <cfelse>
        <p>Error registering user. Email may already exist.</p>
    </cfif>
<cfelse>
    <!-- Display the registration form -->
    <cfoutput>
        <!-- Add client-side validation script -->
        <script>
            // ... (your existing validation script)
        </script>

        <form action="register.cfm" method="post" onsubmit="return validateForm()">
            <!-- Add a container for error messages -->
            <div id="error-message" style="color: red;"></div>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <!-- Add location fields -->
            <label for="city">City:</label>
            <input type="text" id="city" name="city" required>

            <label for="state">State:</label>
            <input type="text" id="state" name="state" required>

            <button type="submit">Register</button>
        </form>
    </cfoutput>
</cfif>
