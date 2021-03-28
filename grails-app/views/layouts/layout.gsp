<!DOCTYPE html>
<html lang="fr">
<asset:stylesheet src="/mbds/materialdesignicons.min.css"/>
<head>
    <title>ANNONCE</title>

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="description" content="CodedThemes">
    <meta name="keywords"
          content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="CodedThemes">
    <!-- <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon"> -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet">
    <asset:stylesheet src="/mbds/css/bootstrap/css/bootstrap.min.css"/>
    <asset:stylesheet src="/mbds/icon/themify-icons/themify-icons.css"/>
    <asset:stylesheet src="/mbds/icon/icofont/css/icofont.css"/>
    <asset:stylesheet src="/mbds/css/style.css"/>
    <asset:stylesheet src="/mbds/css/jquery.mCustomScrollbar.css"/>
    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>
<div class="theme-loader">
    <div class="ball-scale">
        <div class='contain'>
            <div class="ring"><div class="frame"></div></div>

            <div class="ring"><div class="frame"></div></div>

            <div class="ring"><div class="frame"></div></div>

            <div class="ring"><div class="frame"></div></div>

            <div class="ring"><div class="frame"></div></div>

            <div class="ring"><div class="frame"></div></div>

            <div class="ring"><div class="frame"></div></div>

            <div class="ring"><div class="frame"></div></div>

            <div class="ring"><div class="frame"></div></div>

            <div class="ring"><div class="frame"></div></div>
        </div>
    </div>
</div>

<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>

    <div class="pcoded-container navbar-wrapper">
        <nav class="navbar header-navbar pcoded-header">
            <div class="navbar-wrapper">

                <div class="navbar-logo">
                    <a class="mobile-menu" id="mobile-collapse" href="#!">
                        <i class="ti-menu"></i>
                    </a>
                    <a class="mobile-search morphsearch-search" href="#">
                        <i class="ti-search"></i>
                    </a>

                    <a class="mobile-options">
                        <i class="ti-more"></i>
                    </a>
                </div>

                <div class="navbar-container container-fluid">
                    <ul class="nav-left">
                        <li>
                            <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                        </li>

                        <li>
                            <a href="#!" onclick="javascript:toggleFullScreen()">
                                <i class="ti-fullscreen"></i>
                            </a>
                        </li>
                    </ul>
                    <ul class="nav-right">

                        <li class="user-profile header-notification">
                            <a href="#!">
                                <img src="${assetPath(src: 'mbds/images/avatar-4.jpg')}" class="img-radius"
                                     alt="User-Profile-Image">
                                <span>User</span>
                                <i class="ti-angle-down"></i>
                            </a>
                            <ul class="show-notification profile-notification">
                                <li>

                                    <g:form controller="logout" action="index" method="POST">
                                        <g:submitButton name="Logout"/>
                                    </g:form>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="pcoded-main-container">
            <div class="pcoded-wrapper">
                <nav class="pcoded-navbar">
                    <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>

                    <div class="pcoded-inner-navbar main-menu">
                        <div class="">
                            <div class="main-menu-header">
                                <img class="img-40 img-radius" src="${assetPath(src: 'mbds/images/avatar-4.jpg')}"
                                     alt="User-Profile-Image">

                                <div class="user-details">
                                    <span>User</span>

                                </div>
                            </div>
                        </div>

                        <ul class="pcoded-item pcoded-left-item">

                            <li class="pcoded-hasmenu">
                                <a href="javascript:void(0)">
                                    <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span>
                                    <span class="pcoded-mtext" data-i18n="nav.basic-components.main">Annonce</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                                <ul class="pcoded-submenu">
                                    <li class=" ">
                                        <g:link controller="annonce" action="index">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext"
                                                  data-i18n="nav.basic-components.alert">List</span>
                                            <span class="pcoded-mcaret"></span>
                                        </g:link>
                                    </li>
                                    <li class="">
                                        <g:link controller="annonce" action="create">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext"
                                                  data-i18n="nav.basic-components.breadcrumbs">Nouvelle annonce</span>
                                            <span class="pcoded-mcaret"></span>
                                        </g:link>
                                    </li>

                                </ul>
                            </li>
                        </ul>

                        <ul class="pcoded-item pcoded-left-item">

                            <li class="pcoded-hasmenu">
                                <a href="javascript:void(0)">
                                    <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span>
                                    <span class="pcoded-mtext" data-i18n="nav.basic-components.main">User</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                                <ul class="pcoded-submenu">
                                    <li class=" ">
                                        <g:link controller="user" action="index">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext"
                                                  data-i18n="nav.basic-components.alert">List</span>
                                            <span class="pcoded-mcaret"></span>
                                        </g:link>
                                    </li>
                                    <li class=" ">
                                        <g:link controller="user" action="create">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext"
                                                  data-i18n="nav.basic-components.breadcrumbs">New user</span>
                                            <span class="pcoded-mcaret"></span>
                                        </g:link>
                                    </li>

                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>

                <div class="pcoded-content">
                    <div class="pcoded-inner-content">
                        <div class="main-body scaffold-list" id="list-annonce" role="main">

                            <div class="page-body" style="margin-top: 5%">
                                <div class="card">
                                    <g:layoutBody/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<asset:javascript src="/mbds/js/jquery/jquery.min.js"></asset:javascript>
<asset:javascript src="/mbds/js/jquery-ui/jquery-ui.min.js"></asset:javascript>
<asset:javascript src="/mbds/js/popper.js/popper.min.js"></asset:javascript>
<asset:javascript src="/mbds/js/bootstrap/js/bootstrap.min.js"></asset:javascript>
<asset:javascript src="/mbds/js/jquery-slimscroll/jquery.slimscroll.js"></asset:javascript>
<asset:javascript src="/mbds/js/modernizr/modernizr.js"></asset:javascript>
<asset:javascript src="/mbds/pages/widget/amchart/amcharts.min.js"></asset:javascript>
<asset:javascript src="/mbds/pages/widget/amchart/serial.min.js"></asset:javascript>
<asset:javascript src="/mbds/pages/todo/todo.js"></asset:javascript>
<asset:javascript src="/mbds/pages/dashboard/custom-dashboard.js"></asset:javascript>
<asset:javascript src="/mbds/js/script.js"></asset:javascript>
<asset:javascript src="/mbds/js/SmoothScroll.js"></asset:javascript>
<asset:javascript src="/mbds/js/pcoded.min.js"></asset:javascript>
<asset:javascript src="/mbds/js/demo-12.j"></asset:javascript>
<asset:javascript src="/mbds/js/jquery.mCustomScrollbar.concat.min.js"></asset:javascript>

</body>
</html>
