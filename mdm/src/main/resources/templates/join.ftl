<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MDM:) My Digi Money</title>

    <!-- CSS Files -->
    <link href="/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/material-kit.css?v=2.0.4" rel="stylesheet" />
    <link href="/static/css/half-slider.css" rel="stylesheet">
    <link href="/static/css/register_main.css" rel="stylesheet" media="all">


    <!-- fonts and icon -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link href="https://fonts.googleapis.com/css?family=Acme|Bungee|Jua" rel="stylesheet">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

    <script src="https://apis.google.com/js/platform.js" async defer></script>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/">MDM:) My Digi Money</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="/">Home
                    </a></li>
                <li class="nav-item active"><a class="nav-link" href="/donation">Donation</a>
                </li>
                <#if auth ??>
                    <li class="nav-item"><a class="nav-link" href="/logout">Log out</a></li>
                    <li class="nav-item"><a class="nav-link" href="/mypage">MyPage</a></li>
                <#else>
                    <li class="nav-item"><a class="nav-link" href="/Login">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="/join">Join</a></li>
                </#if>
            </ul>
        </div>
    </div>
</nav>


<!-- Page Content -->
<section class="py-5">
    <div class="container">
        <br/>
        <h2>MDM에서,</h2>
            <h4>
                여러분의 잊혀진 <b>포인트</b>들을 한데 모아 <b>뜻깊은 일</b>에 활용 합시다.
            </h4>
    </div>
</section>

<hr>
<!-- register -->

<div class="wrapper wrapper--w960">
    <div class="card card-2">
        <div class="card-heading"></div>
        <div class="card-body">
            <h2 class="title">Registration Info</h2>
            <form method="post" action="/join">
                <div class="row row-space">
                    <div class="input-group">
                        <input class="input--style-2" type="text" placeholder="Name" name="name">
                    </div>
                </div>
                <div class="row row-space">
                    <div class="input-group">
                        <input class="input--style-2" type="email" placeholder="E-mail" name="email">
                    </div>
                </div>
                <div class="row row-space">
                    <div class="input-group">
                        <input class="input--style-2" type="password" placeholder="Password" name="password">
                    </div>
                </div>
                <div class="row row-space">
                    <div class="input-group">
                        <input class="input--style-2" type="password" placeholder="Check Password" name="checkPassword">
                    </div>
                </div>
                <div class="p-t-30">
                    <button class="btn btn--radius btn-primary" type="submit">Sign Up</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your
            Website 2018</p>
    </div>
    <!-- /.container -->
</footer>

<!--   Core JS Files   -->
<script src="/static/js/jquery.min.js" type="text/javascript"></script>
<script src="/static/js/popper.min.js" type="text/javascript"></script>
<script src="/static/js/bootstrap-material-design.min.js" type="text/javascript"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
<script src="/static/js/material-kit.js?v=2.0.4" type="text/javascript"></script>
<!-- Bootstrap core JavaScript -->
<script src="/static/vendor/jquery/jquery.min.js"></script>
<script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/static/js/main.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>