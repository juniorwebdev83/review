<!-- NavBar.cfm -->
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- ...head Section ... -->
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Review Website</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <form class="form-inline ml-auto" action="search.cfm" method="get">
            <input class="form-control mr-sm-2" type="text" name="company" placeholder="Search for a company">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>



<!--  Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>
<!-- NavBar.cfm -->


<div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <cfif structKeyExists(session, 'userLoggedIn') and session.userLoggedIn>
                <p class="navbar-text">Welcome, #session.userEmail#!</p>
            <cfelse>
                <form class="form-inline" action="login.cfm" method="post">
                    <input class="form-control mr-sm-2" type="text" name="email" placeholder="Email" required>
                    <input class="form-control mr-sm-2" type="password" name="password" placeholder="Password" required>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
                </form>
            </cfif>
        </li>
    </ul>
</div>
