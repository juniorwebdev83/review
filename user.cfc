<!-- User.cfc -->
<cfcomponent>
<cffunction name="registerUser" access="public" returntype="boolean" output="false">
    <cfargument name="email" type="string" required="true">
    <cfargument name="password" type="string" required="true">
    <cfargument name="city" type="string" required="true">
    <cfargument name="state" type="string" required="true">

    <!-- MongoDB Configuration -->
    <cfset connectionString = application.mongoConnectionString>
    <cfset mongoClient = createObject("java", "com.mongodb.client.MongoClients").create(connectionString)>
    <cfset database = mongoClient.getDatabase("MY-REVIEWSITE")>
    <cfset collection = database.getCollection("users")>

    <!-- Checking if the email already exists -->
    <cfset existingUser = collection.find(createObject("java", "org.bson.Document").append("email", email)).first()>

    <!-- If the email doesn't exist, insert the new user and return true (registration successful) -->
    <cfif isNull(existingUser) or existingUser.isEmpty()>
        <cfset newUser = createObject("java", "java.util.HashMap").init()>

        <!-- Append 'email', 'password', 'city', and 'state' fields -->
        <cfset newUser.put("email", toString(email))>
        <cfset newUser.put("password", hash(password))> <!--- never store a password in plain text, hash or encrypt it --->
        <cfset newUser.put("city", city)>
        <cfset newUser.put("state", state)>

        <!-- Insert the new user into the collection -->
        <cfset collection.insertOne(createObject("java", "org.bson.Document").init(newUser))>
        <cfset mongoClient.close()>

        <cfreturn true>
    <cfelse>
        <!-- If the email already exists, return false (registration unsuccessful) -->
        <cfset mongoClient.close()>
        <cfreturn false>
    </cfif>
</cffunction>
</cfcomponent>

