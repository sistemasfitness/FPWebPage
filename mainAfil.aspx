<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mainAfil.aspx.cs" Inherits="WebPage.mainAfil" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Elige el plan que mejor se adapte a ti y entrena en Fitness People en nuestras sedes de Bucaramanga, Floridablanca, Piedecuesta y Cúcuta." />
    <meta name="author" content="Fitness People" />
    <title>Fitness People</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="img/favicon_.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png" />
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png" />
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png" />
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png" />

    <!-- GOOGLE WEB FONT -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,300,500,600,700|Kalam:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet" />

    <!-- BASE CSS -->
    <link href="css/animate.min.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/menu.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/responsive.css" rel="stylesheet" />
    <link href="css/icon_fonts/css/all_icons.min.css" rel="stylesheet" />
    <link href="css/magnific-popup.min.css" rel="stylesheet" />

    <!-- YOUR CUSTOM CSS -->
    <link href="css/custom.css" rel="stylesheet" />
</head>
<body>
    <div class="layer"></div>
    <!-- Mobile menu overlay mask -->

    <div id="preloader">
        <div data-loader="circle-side"></div>
    </div>
    <!-- End Preload -->
    <!-- Header ================================================== -->
    <header>
        <div class="container-fluid">
            <uc1:mainmenu runat="server" ID="mainmenu" />
        </div>
        <!-- End container -->
    </header>
    <!-- End Header =============================================== -->
    <!-- SubHeader =============================================== -->
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/sub_header_general.jpg" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <h1 style="font-weight: 900;">Bienvenid@</h1>
            <p style="font-weight: 700;">
                <asp:Literal ID="ltNombreAfiliado" runat="server"></asp:Literal></p>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <div class="container_styled_1">
        <div class="container margin_60">
            <div class="row">
                <aside class="col-md-3" id="sidebar">
                    <div class="theiaStickySidebar">
                        <div class="profile">
                            <p class="text-center">
                                <img src="img/teacher_2_small.jpg" alt="Teacher" class="img-circle styled_2"></p>
                            <ul class="social_teacher">
                                <li><a href="#"><i class="icon-facebook"></i></a></li>
                                <li><a href="#"><i class="icon-twitter"></i></a></li>
                                <li><a href="#"><i class=" icon-google"></i></a></li>
                            </ul>
                            <ul>
                                <li>Name <strong class="pull-right">Mark Young</strong> </li>
                                <li>Email <strong class="pull-right">info@domain.com</strong></li>
                                <li>Telephone  <strong class="pull-right">+34 004238423</strong></li>
                                <li>Lessons <strong class="pull-right">12</strong></li>
                                <li>Courses <strong class="pull-right">15</strong></li>
                            </ul>

                        </div>
                        <!-- End box-sidebar -->
                    </div>
                </aside>
                <div class="col-md-9">
                    <div class="box_style_6">
                        <div class="indent_title_in">
                            <i class="icon_document_alt"></i>
                            <h3>Profile</h3>
                            <p>Mussum ipsum cacilds, vidis litro abertis.</p>
                        </div>
                        <div class="wrapper_indent">
                            <p>Lorem ipsum dolor sit amet, dicta oportere ad est, ea eos partem neglegentur theophrastus. Esse voluptatum duo ne, expetenda corrumpit no per, at mei nobis lucilius. No eos semper aperiri neglegentur, vis noluisse quaestio no. Vix an nostro inimicus, qui ut animal fabellas reprehendunt. In quando repudiare intellegebat sed, nam suas dicta melius ea.</p>
                            <p>Mei ut decore accusam consequat, alii dignissim no usu. Phaedrum intellegat sit ut, no pri mutat eirmod. In eum iriure perpetua adolescens, pri dicunt prodesset et. Vis dicta postulant ad.</p>
                            <h4>Credentials</h4>
                            <p>Lorem ipsum dolor sit amet, dicta oportere ad est, ea eos partem neglegentur theophrastus. Esse voluptatum duo ne, expetenda corrumpit no per, at mei nobis lucilius. No eos semper aperiri neglegentur, vis noluisse quaestio no. Vix an nostro inimicus, qui ut animal fabellas reprehendunt. In quando repudiare intellegebat sed, nam suas dicta melius ea.</p>
                            <div class="row">
                                <div class="col-md-6">
                                    <ul class="list_3">
                                        <li><strong>September 2009 - Bachelor Degree in Fitness</strong><p>University of Cambrige - United Kingdom</p>
                                        </li>
                                        <li><strong>December 2012 - Master course in Pilates</strong><p>University of Cambrige - United Kingdom</p>
                                        </li>
                                        <li><strong>October 2013 - Master's Degree in Yoga</strong><p>University of Oxford - United Kingdom</p>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-6">
                                    <ul class="list_3">
                                        <li><strong>September 2009 - Degree in Human Science</strong><p>University of Cambrige - United Kingdom</p>
                                        </li>
                                        <li><strong>December 2012 - Master course in Pilates</strong><p>University of Cambrige - United Kingdom</p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- End row-->
                        </div>
                        <!--wrapper_indent -->
                        <hr class="styled_2">
                        <div class="indent_title_in">
                            <i class="icon_archive_alt"></i>
                            <h3>My courses</h3>
                            <p>Mussum ipsum cacilds, vidis litro abertis.</p>
                        </div>
                        <div class="wrapper_indent">
                            <p>Mei ut decore accusam consequat, alii dignissim no usu. Phaedrum intellegat sit ut, no pri mutat eirmod. In eum iriure perpetua adolescens, pri dicunt prodesset et. Vis dicta postulant ad.</p>
                            <div class="table-responsive">
                                <table class="table table-striped" id="trainer_courses">
                                    <thead>
                                        <tr>
                                            <th>Category</th>
                                            <th>Course name</th>
                                            <th>Lessons</th>
                                            <th>Rate</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Yoga</td>
                                            <td><a href="#">Yoga Fundamentals</a></td>
                                            <td>12</td>
                                            <td class="rating_2"><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class=" icon-star-empty"></i><i class=" icon-star-empty"></i></td>
                                        </tr>
                                        <tr>
                                            <td>Yoga</td>
                                            <td><a href="#">Total Body Stretching</a></td>
                                            <td>12</td>
                                            <td class="rating_2"><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></td>
                                        </tr>
                                        <tr>
                                            <td>Strenght</td>
                                            <td><a href="#">Strength Upper Body</a></td>
                                            <td>04</td>
                                            <td class="rating_2"><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class=" icon-star-empty"></i><i class=" icon-star-empty"></i></td>
                                        </tr>
                                        <tr>
                                            <td>Strenght</td>
                                            <td><a href="#">Fat Burning Butt and Thigh</a></td>
                                            <td>10</td>
                                            <td class="rating_2"><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class=" icon-star-empty"></i><i class=" icon-star-empty"></i></td>
                                        </tr>
                                        <tr>
                                            <td>Cardio</td>
                                            <td><a href="#">1000 Calorie Workout Video</a></td>
                                            <td>20</td>
                                            <td class="rating_2"><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class=" icon-star-empty"></i></td>
                                        </tr>
                                        <tr>
                                            <td>Cardio</td>
                                            <td><a href="#">Fat Burning Cardio</a></td>
                                            <td>12</td>
                                            <td class="rating_2"><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></td>
                                        </tr>
                                        <tr>
                                            <td>Pilates</td>
                                            <td><a href="#">Lower Body Pilates</a></td>
                                            <td>04</td>
                                            <td class="rating_2"><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class=" icon-star-empty"></i><i class=" icon-star-empty"></i></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--wrapper_indent -->
                    </div>
                </div>

            </div>
            <!--End row -->
        </div>
        <!--End container -->
    </div>

    <uc1:footer runat="server" ID="footer" />

    <div id="toTop"></div>
    <!-- Back to top button -->

    <!-- Search Menu -->
    <div class="search-overlay-menu">
        <span class="search-overlay-close"><i class="icon_close"></i></span>
        <form role="search" id="searchform" method="get">
            <input value="" name="q" type="search" placeholder="Buscar..." />
            <button type="submit">
                <i class="icon-search-6"></i>
            </button>
        </form>
    </div>
    <!-- End Search Menu -->
    <!-- COMMON SCRIPTS -->
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/common_scripts_min.js"></script>
    <script src="assets/validate.js"></script>
    <script src="js/functions.js"></script>

    <!-- SPECIFIC SCRIPTS -->
    <script src="js/bootstrap-portfilter.min.js"></script>
    <script src="js/jarallax.min.js"></script>
    <script src="js/jarallax-video.min.js"></script>
    <script>
        $('.jarallax').jarallax({
            videoLoop: true,
            videoPlayOnlyVisible: false,
            videoLazyLoading: false
        });
    </script>

    <!-- GOOGLE map -->
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript" src="js/mapmarker.jquery.js"></script>
    <script type="text/javascript" src="js/mapmarker_func.jquery.js"></script>
</body>
</html>
