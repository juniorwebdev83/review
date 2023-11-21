<cfcomponent>

    <cffunction name="registerUser" access="public" returntype="boolean" output="false">
        <cfargument name="email" type="string" required="true">
        <cfargument name="password" type="string" required="true">

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

            <!-- Append 'email' and 'password' fields -->
            <cfset newUser.put("email", toString(email))>
            <cfset newUser.put("password", hash(password))> <!--- never store a password in plain text, hash or encrypt it --->

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

    <cffunction name="loginUser" access="public" returntype="boolean" output="false">
        <cfargument name="email" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfargument name="confirmPassword" type="string" required="true">
    
        <!-- Hash the passwords -->
        <cfset arguments.password = hash(arguments.password)>
        <cfset arguments.confirmPassword = hash(arguments.confirmPassword)>
    
        <!-- MongoDB Configuration -->
        <cfset connectionString = application.mongoConnectionString>
        <cfset mongoClient = createObject("java", "com.mongodb.client.MongoClients").create(connectionString)>
        <cfset database = mongoClient.getDatabase("MY-REVIEWSITE")>
        <cfset collection = database.getCollection("users")>
    
        <!-- Initialize result variable -->
        <cfset loginSuccessful = false>
    
        <!-- Output a debug message -->
        <cflog file="yourLogFile" text="Attempting login for email: #email#">
    
        <!-- Try to execute the MongoDB query -->
        <cftry>
            <!-- Check if the user with the provided email exists -->
            <cfset queryFilter = createObject("java", "org.bson.Document").append("email", email)>
            <cfset existingUser = collection.find(queryFilter).first()>
    
            <!-- If the user exists, compare the hashed passwords -->
            <cfif existingUser.get("password") eq arguments.password
                and existingUser.get("password") eq arguments.confirmPassword>
                <!-- Set the loginSuccessful variable to true -->
                <cfset loginSuccessful = true>
            </cfif>
    
        <!-- Catch any exceptions that may occur during the MongoDB query -->
        <cfcatch>
            <!-- Log the exception for debugging purposes -->
            <cflog file="yourLogFile" text="MongoDB Login Exception: #cfcatch.message#">
        </cfcatch>
        </cftry>
    
        <!-- Close the MongoDB client -->
        <cfset mongoClient.close()>
    
        <!-- Return the login status -->
        <cfreturn loginSuccessful>
    </cffunction>
    

    <cffunction name="getDebugMessage" access="public" returntype="string" output="false">
        <cfreturn "This is a debug message.">
    </cffunction>

</cfcomponent>
