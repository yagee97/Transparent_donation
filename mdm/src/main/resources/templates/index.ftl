<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>MDM:) MY DIGI MONEY</title>

    <!-- CSS Files -->
    <link href="/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/material-kit.css?v=2.0.4" rel="stylesheet">
    <link href="/static/css/half-slider.css" rel="stylesheet">

    <!-- fonts and icon -->
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
    <link href="https://fonts.googleapis.com/css?family=Acme|Bungee|Jua" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <script src="https://apis.google.com/js/platform.js" async="" defer="" gapi_processed="true"></script>

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

<header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <!-- Slide One - Set the background image for this slide in the line below -->
            <div class="carousel-item active" style="background-image: url('/static/images/mainImg2.jpg')">
                <div class="carousel-caption d-none d-md-block">
                    <h4>
                        나눔은 <b>작은 실천</b>에서 시작됩니다.
                    </h4>
                    <br>
                </div>
            </div>
            <!-- Slide Two - Set the background image for this slide in the line below -->
            <div class="carousel-item" style="background-image: url('/static/images/mainImg1.jpg')">
                <div class="carousel-caption d-none d-md-block">
                    <h4>
                        <b>지금</b> 시작해보세요.
                    </h4>
                    <br> <a href="/donation" class="btn btn-primary btn-lg">Donation</a><br>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
        </a>
    </div>
</header>

<!-- Page Content -->
<section class="py-5">
    <div class="container">
        <h2>MDM은,</h2>
        <h4>
            여러분의 잊혀진 <b>포인트</b>들을 한데 모아 <b>뜻깊은 일</b>에 활용할 수 있게 합니다.
        </h4>
    </div>
</section>

<hr>

<section class="py-5">
    <div class="container">
        <h2 align="center">Recent News</h2>
        <br>

        <div class="row text-center">
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card">
                    <img class="card-img-top" src="/static/images/cardview1.png" alt="">
                    <div class="card-body">
                        <h4 class="card-title">Give Donation</h4>
                        <p class="card-text">
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.
                        </p>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="btn btn-primary">Find Out More!</a>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card">
                    <img class="card-img-top" src="/static/images/cardview1.png" alt="">
                    <div class="card-body">
                        <h4 class="card-title">Become Volunteer</h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur
                            adipisicing elit. Explicabo magni sapiente, tempore debitis
                            beatae culpa natus architecto.</p>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="btn btn-primary">Find Out More!</a>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card">
                    <img class="card-img-top" src="/static/images/cardview1.png" alt="">
                    <div class="card-body">
                        <h4 class="card-title">Give Scholarship</h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur
                            adipisicing elit. Sapiente esse necessitatibus neque.</p>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="btn btn-primary">Find Out More!</a>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card">
                    <img class="card-img-top" src="/static/images/cardview1.png" alt="">
                    <div class="card-body">
                        <h4 class="card-title">Register Events</h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur
                            adipisicing elit. Explicabo magni sapiente, tempore debitis
                            beatae culpa natus architecto.</p>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="btn btn-primary">Find Out More!</a>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.row -->
    </div>
</section>

<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">
            Copyright © Your Website 2018</p>
    </div>
    <!-- /.container -->
</footer>

<!--   Core JS Files   -->
<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/popper.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap-material-design.min.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script type="text/javascript" async="" defer="" src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
<script type="text/javascript" src="/static/js/material-kit.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="/static/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>