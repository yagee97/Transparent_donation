<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MDM:) My Digi Money</title>

    <!-- CSS Files -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/material-kit.css?v=2.0.4" rel="stylesheet" />
    <link href="/static/css/half-slider.css" rel="stylesheet">
    <link href="/static/css/register_main.css" rel="stylesheet" media="all">

    <!-- fonts and icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

    <link href="https://fonts.googleapis.com/css?family=Acme|Bungee|Jua" rel="stylesheet">

    <script src="https://apis.google.com/js/platform.js" async defer></script>

</head>
<body>

<!-- Navigation -->
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

<center>
    <section>
        <div>
            <br>
            <br>
            <br>
            <br>
            <h2>기부안내</h2>
            <br> <img src="/static/images/header.png" height="420px" width="800px">
        </div>
        <div>
            <br> <br>
            <h5>MDM에서는 기부자가 포인트를 조회하고, 수혜자를 선택하여 원하는 만큼의 자신의 포인트를 기부할 수
                있습니다.</h5>
            <br>
        </div>
    </section>

    <hr>
    <br>
    <section>
        <div>
            <img src="/static/images/way.png" height="200px" width="750px"> <br>
            <br>
            <br>
            <a href="/transaction" class="btn btn-primary btn-lg">기부하기</a><br>
            <br>
            <br>
            <section>
</center>


<!-- login modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="">
    <div class="modal-dialog modal-login" role="document">
        <div class="modal-content">
            <div class="card card-signup card-plain">
                <div class="modal-header">
                    <div class="card-header card-header-primary text-center">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">
                            <i class="material-icons">clear</i>
                        </button>
                        <h4 class="card-title">Log in</h4>
                    </div>
                </div>
                <div class="modal-body">
                    <form class="form" method="" action="">
                        <h3 class="description text-center">My Digi Money!</h3>
                        <div class="card-body">

                            <div class="form-group bmd-form-group">
                                <div class="input-group">
										<span class="input-group-addon"> <i
                                                    class="material-icons">email</i>
										</span> <input type="text" class="form-control"
                                                       placeholder="Email...">
                                </div>
                            </div>

                            <div class="form-group bmd-form-group">
                                <div class="input-group">
										<span class="input-group-addon"> <i
                                                    class="material-icons">lock_outline</i>
										</span> <input type="password" placeholder="Password..."
                                                       class="form-control">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer justify-content-center">
                    <a href="/" class="btn btn-primary">Login</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- join modal -->
<div class="modal fade" id="JoinModal" tabindex="-1" role="">
    <div class="modal-dialog modal-login" role="document">
        <div class="modal-content">
            <div class="card card-signup card-plain">
                <div class="modal-header">
                    <div class="card-header card-header-primary text-center">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">
                            <i class="material-icons">clear</i>
                        </button>
                        <h4 class="card-title">Join</h4>
                    </div>
                </div>
                <div class="modal-body">
                    <form class="form" method="" action="">
                        <h3 class="description text-center">Join with MDM</h3>
                        <div class="card-body">

                            <div class="form-group bmd-form-group">
                                <div class="input-group">
										<span class="input-group-addon"> <i
                                                    class="material-icons">face</i>
										</span> <input type="text" class="form-control"
                                                       placeholder="Nickname...">
                                </div>
                            </div>
                            <div class="form-group bmd-form-group">
                                <div class="input-group">
										<span class="input-group-addon"> <i
                                                    class="material-icons">email</i>
										</span> <input type="text" class="form-control"
                                                       placeholder="Email...">
                                </div>
                            </div>

                            <div class="form-group bmd-form-group">
                                <div class="input-group">
										<span class="input-group-addon"> <i
                                                    class="material-icons">lock_outline</i>
										</span> <input type="password" placeholder="Password..."
                                                       class="form-control">
                                </div>
                            </div>

                            <div class="form-group bmd-form-group">
                                <div class="input-group">
										<span class="input-group-addon"> <i
                                                    class="material-icons">lock_outline</i>
										</span> <input type="password" placeholder="again Password..."
                                                       class="form-control">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer justify-content-center">
                    <a href="/" class="btn btn-primary">Join</a>
                </div>
            </div>
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
</body>
</html>