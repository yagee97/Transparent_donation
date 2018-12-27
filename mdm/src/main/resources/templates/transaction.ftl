<!DOCTYPE html>
<html lang="ko">
<head>
    <title>transaction page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/material-kit.css?v=2.0.4" rel="stylesheet"/>
    <link href="/static/css/half-slider.css" rel="stylesheet">
    <link href="/static/css/register_main.css" rel="stylesheet" media="all">

    <!-- fonts and icon -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

    <link href="https://fonts.googleapis.com/css?family=Acme|Bungee|Jua" rel="stylesheet">

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

<div class="page-header header-filter" data-parallax="true"
     style="background-image: url('static/images/transaction_back.jpg');"></div>
<div class="main main-raised">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3"><br>
                <h2 class="text-center title">Donate To.</h2>                      <h4 class="text-center description">
                    Divide details about your product or agency work into parts. Write a few lines about each one and
                    contact us about any further collaboration. We will respond get back to you in a couple of
                    hours.</h4>
                <ol id="list"></ol>
                <hr>
                <h2 class="text-xs-center">Donation</h2>
                <form action="/static/js/main(2).js" method="post">
                    <div class="form-group"><label for="seed">Seed</label>
                        <input type="text" class="form-control" id="seed"></div>
                    <div class="form-group"><label for="address1">My Account</label>
                        <input type="text" class="form-control" id="address1"></div>
                    <div class="form-group"><label for="address2">Beneficiary Account</label>
                        <input type="text" class="form-control" id="address2">
                    </div>
                    <div class="form-group"><label for="ether">Coin</label>
                        <input type="text" class="form-control" id="ether"></div>
                    <div class="text-center">
                        <button type="button" class="btn btn-primary" onclick="send_ether();">Donate</button>
                    </div>
                    <div class="alert alert-info" id="txnhash" role="alert">Txn Hash</div>
            </div>
            </form>
        </div>
    </div>
</div>
</div>

<footer class="footer footer-default">
    <div class="container">
        <nav class="float-left">
            <ul>
                <li><a href="https://www.creative-tim.com"> Creative Tim </a></li>
                <li><a href="https://creative-tim.com/presentation"> About Us </a></li>
                <li><a href="http://blog.creative-tim.com"> Blog </a></li>
                <li><a href="https://www.creative-tim.com/license"> Licenses </a></li>
            </ul>
        </nav>
        <div class="copyright float-right"> &copy;
            <script>                document.write(new Date().getFullYear())             </script>
            , made with <i class="material-icons">favorite</i> by <a href="https://www.creative-tim.com"
                                                                     target="_blank">Creative Tim</a> for a better web.
        </div>
    </div>
</footer>

<script src="/static/js/web3.min.js"></script>
<script src="/static/js/hooked-web3-provider.min.js"></script>
<script src="/static/js/lightwallet.min.js"></script>
<script src="/static/js/main(2).js"></script>
</body>
</html>