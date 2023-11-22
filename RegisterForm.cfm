<!-- Forms/RegisterForm.cfm -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <style>
        /* Add your styles here if needed */
        /* For simplicity, no additional styles are added in this example */
    </style>
</head>
<body>

<div class="review-banner">
    Register
</div>

<form action="register.cfm" method="post">
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

</body>
</html>
