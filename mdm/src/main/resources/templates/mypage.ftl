<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="/static/images/cardview2.png">
    <link rel="icon" type="image/png" href="/static/images/cardview1.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>My Page</title>
    <meta
            content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
            name='viewport'/>
    <!-- Extra details for Live View on GitHub Pages -->
    <!-- Canonical SEO -->
    <link rel="canonical"
          href="https://www.creative-tim.com/product/material-kit"/>
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons"/>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Acme|Bungee|Jua"
          rel="stylesheet">
    <link href="/static/css/half-slider.css" rel="stylesheet">
    <!-- CSS Files -->
    <link href="/static/css/material-kit.min.css?v=2.0.5" rel="stylesheet"/>
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="/static/css/demo.css" rel="stylesheet"/>
    <!-- Google Tag Manager -->
    <script>    (function (w, d, s, l, i) {
            w[l] = w[l] || [];
            w[l].push({'gtm.start': new Date().getTime(), event: 'gtm.js'});
            var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
            j.async = true;
            j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
            f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-NKDMSK6'); </script>

    <script>
        function pointCheck(){
            document.getElementById("points").innerText = 3500;
        }
        function exchange(){
            document.getElementById("points").innerText = 500;
            document.getElementById("coins").innerText = 3;
        }

    </script>

    <!-- End Google Tag Manager -->
</head>
<body class="profile-page sidebar-collapse">
<!-- Extra details for Live View on GitHub Pages -->
<!-- Google Tag Manager (noscript) -->
<noscript>
    <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NKDMSK6"
            height="0" width="0" style="display: none; visibility: hidden"></iframe>
</noscript>
<!-- End Google Tag Manager (noscript) -->
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
     style="background-image: url('/static/images/mypage_back.jpg');"></div>
<div class="main main-raised" style="width: 800px; margin: 0 auto;">
    <div class="profile-content">
        <div class="container">
            <div class="row">
                <div class="col-md-6 ml-auto mr-auto">
                    <div class="profile">
                        <div class="avatar">
                            <img src="/static/images/profile.jpg" alt="Circle Image"
                                 class="img-raised rounded-circle img-fluid">
                        </div>
                        <div class="name">
                            <h3 class="title"> ${auth.name}</h3>
                            <h6>Developer</h6>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="alert alert-info rounded text-center" id="info"
                 role="alert"
                 style="margin-left: auto; margin-right: auto; width: 550px">
                <h4>seed는 기부시 사용되니 꼭 저장해두세요!</h4>
                <input type="text" class="form-control rounded text-center"
                       id="seed"
                       style="margin-left: auto; margin-right: auto; background-color: white"
                       disabled="disabled" placeholder="create account 버튼을 누르세요!..">
            </div>
            <div class="text-center rounded">
                <table
                        style="margin-left: auto; margin-right: auto; background-color: #F6F6F6; width: 550px">
                    <tr>
                        <td><h4>
                                <b>Address:</b>
                            </h4></td>
                    </tr>
                    <tr>
                        <td><h5 id="address"></h5></td>
                    </tr>
                    <tr>
                        <td><h4>
                                <b>Private Key:</b>
                            </h4></td>
                    </tr>
                    <tr>
                        <td><h5 id="private_key"></h5></td>
                    </tr>
                </table>
                <br>
                <button class="btn btn-primary" onclick="generate_seed()">Create Account</button>
            </div>
            <br>
            <hr>
            <h3 class="title text-center">포인트 조회</h3>
            <center>
                <div class="rounded"
                     style="background-color: #F6F6F6; width: 550px">
                    <table style="margin-left: auto; margin-right: auto;">
                        <tr>
                            <td><span id="points">0&nbsp</span></td>
                            <td>
                                <h4>points</h4>
                            </td>
                            <td><span id="points">0&nbsp</span></td>
                            <td style="margin-left: 15px"><h4>
                                    <span id="coins"></span>Coins
                                </h4></td>
                        </tr>
                    </table>
                </div>
            </center>
            <br>
            <div>
                <table style="margin-left: auto; margin-right: auto">
                    <tr>
                        <td>
                            <button type="button" class="btn btn-primary" id="check_point" onclick="pointCheck()">Point
                                Check
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-primary" id="exchange" onclick="exchange()">Exchange
                                Coin
                            </button>
                        </td>
                </table>
            </div>
            <br> <br>
        </div>
    </div>
</div>
<footer class="footer footer-default">
    <div class="container">
        <nav class="float-left">
            <ul>
                <li><a href="https://www.creative-tim.com"> Creative Tim </a>
                </li>
                <li><a href="https://creative-tim.com/presentation"> About
                        Us </a></li>
                <li><a href="http://blog.creative-tim.com"> Blog </a></li>
                <li><a href="https://www.creative-tim.com/license">
                        Licenses </a></li>
            </ul>
        </nav>
        <div class="copyright float-right">
            &copy;
            <script> document.write(new Date().getFullYear())</script>
            , made with <i class="material-icons">favorite</i> by <a
                    href="https://www.creative-tim.com" target="_blank">Creative
                Tim</a> for a better web.
        </div>
    </div>
</footer>
<!--   Core JS Files   -->
<script src="/static/js/jquery.min.js" type="text/javascript"></script>
<script src="/static/js/popper.min.js" type="text/javascript"></script>
<script src="/static/js/bootstrap-material-design.min.js"
        type="text/javascript"></script>
<script src="/static/js/moment.min.js"></script>
<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
<script src="/static/js/material-kit.min.js?v=2.0.5" type="text/javascript"></script>
<!-- web3 -->
<script src="/static/js/web3.min.js"></script>
<script src="/static/js/hooked-web3-provider.min.js"></script>
<script src="/static/js/lightwallet.min.js"></script>
<script src="/static/js/main(2).js"></script>
<script>       $(document).ready(function () {
    });
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-46172202-1']);
    _gaq.push(['_trackPageview']);
    (function () {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
    })();        // Facebook Pixel Code Don't Delete        !function(f, b, e, v, n, t, s) {           if (f.fbq)              return;           n = f.fbq = function() {              n.callMethod ? n.callMethod.apply(n, arguments) : n.queue              .push(arguments)           };           if (!f._fbq)              f._fbq = n;           n.push = n;           n.loaded = !0;           n.version = '2.0';           n.queue = [];           t = b.createElement(e);           t.async = !0;           t.src = v;           s = b.getElementsByTagName(e)[0];           s.parentNode.insertBefore(t, s)        }(window, document, 'script',        '//connect.facebook.net/en_US/fbevents.js');        try {           fbq('init', '111649226022273');           fbq('track', "PageView");        } catch (err) {           console.log('Facebook Track Error:', err);        }    </script>
<noscript>
    <img height="1" width="1" style="display: none"
         src="https://www.facebook.com/tr?id=111649226022273&ev=PageView&noscript=1"/>
</noscript>
</body>
</html>