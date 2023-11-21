<!-- Application.cfc -->
<cfcomponent>

    <cfset this.name = "YourApplicationName12">
    <cfset this.applicationTimeout = createTimeSpan(0, 0, 20, 0)>
    <cfset this.sessionManagement = true>
    <cfset this.sessionTimeout = createTimeSpan(0, 0, 20, 0)>

    <!-- Define variables for username and password -->
    <cfset application.mongoUsername = "infojr83">
    <cfset application.mongoPassword = "Joaquim2022">

    <cffunction name="OnApplicationStart" access="public" output="true">
        <!-- Concatenate the username and password in the connection string -->
        <cfset application.mongoConnectionString = 
        "mongodb+srv://" & application.mongoUsername & ":" & application.mongoPassword & "@cluster0.nhmo9fe.mongodb.net/?retryWrites=true&w=majority">
    </cffunction>

    <cffunction name="onError" returnType="void" output="true" access="public">
        <cfdump var="#arguments#" abort>
    </cffunction>

</cfcomponent>
