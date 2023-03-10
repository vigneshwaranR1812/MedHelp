<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DatabaseConnection.Connect" %>
<%

try {


        if(request.getParameter("did")!=null && request.getParameter("did").length()==0 ){
        response.sendRedirect("order.jsp");
        }
        else if(request.getParameter("did")!=null){
                     int did = Integer.parseInt(request.getParameter("did"));
                     int u=(Integer)session.getAttribute("userid");
                     String sql2="update delivery set count=count+1 where did="+did;
                     String sql3="update cart set status='inactive' where userid="+u;
                                         Connect.st.executeUpdate(sql2);
                                         Connect.st.executeUpdate(sql3);
                                       response.sendRedirect("confirm.jsp");
                     }
        }
        catch (Exception e) {
                      System.out.println(e);

                      }
%>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Medhelp</title>
  <link rel="icon" type="image/png" href="images\pill1.png"/>
  <!-- slider stylesheet -->
  <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />

  <!-- font awesome style -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700|Roboto:400,700&display=swap" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
</head>

<body>
<div class="hero_area">
  <!-- header section strats -->
  <header class="header_section">

    <div class="container-fluid">
      <nav class="navbar navbar-expand-lg custom_nav-container pt-3">
        <a class="navbar-brand" href="index.jsp">
          <img src="images/pill1.png" alt="">
          <span>
              Medhelp
            </span>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <div class="d-flex  flex-column flex-lg-row align-items-center w-100 justify-content-between">
            <ul class="navbar-nav  ">
              <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
              </li>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.html"> About </a>
              </li>

              <!--                <li class="nav-item">-->
              <!--                  <a class="nav-link" href="buy.html"> Shop </a>-->
              <!--                </li>-->

            </ul>

            <div class="login_btn-contanier ml-0 ml-lg-5">
              <a href="index.jsp?logout=true">
                <img src="images/user.png" alt="">
                <span>
                    Logout
                  </span>
              </a>
            </div>
          </div>
        </div>

      </nav>
    </div>
  </header>
  <!-- end header section -->
  <!-- slider section -->
  <section class=" slider_section position-relative">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <div class="container">
            <div class="row">
              <div class="col-md-4">
                <div class="img-box">
                  <img src="images/truck.png" alt="">
                </div>
              </div>
              <div class="col-md-8">
                <div class="detail-box">
                  <h1>
                    Your order has been  <br>
                    <span>
                        SHIPPED!
                      </span>

                  </h1>
                  <p  >
                    Your order will arrive in 3-5 days. In case of delay or product dissatisfaction, please contact us. Happy shopping!
                  </p>

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

  </section>
  <!-- end slider section -->
</div>
<!-- info section -->
<section class="info_section layout_padding2">
  <div class="container">
    <div class="row">
      <div class="col-md-3">
        <div class="info_contact">
          <h4>
            Contact
          </h4>
          <div class="box">
            <div class="img-box">
              <img src="images/telephone-symbol-button.png" alt="">
            </div>
            <div class="detail-box">
              <h6>
                +044 2345 6789
              </h6>
            </div>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="images/email.png" alt="">
            </div>
            <div class="detail-box">
              <h6>
                medhelp@gmail.com
              </h6>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="info_menu">
          <h4>
            Menu
          </h4>
          <ul class="navbar-nav  ">
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="about.html"> About </a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="buy.html"> Shop</a>
            </li>
          </ul>
        </div>
      </div>

    </div>
  </div>
</section>


<!-- end info section -->

<!-- footer section -->
<section class="container-fluid footer_section">
  <p>
    &copy; 2022 All Rights Reserved. Design by
    <a href="https://html.design/">MedHelp</a>
  </p>
</section>
<!-- footer section -->

<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js">
</script>
<script type="text/javascript">
    $(".owl-carousel").owlCarousel({
      loop: true,
      margin: 10,
      nav: true,
      navText: [],
      autoplay: true,
      responsive: {
        0: {
          items: 1
        },
        600: {
          items: 2
        },
        1000: {
          items: 4
        }
      }
    });
  </script>
<script type="text/javascript">
    $(".owl-2").owlCarousel({
      loop: true,
      margin: 10,
      nav: true,
      navText: [],
      autoplay: true,

      responsive: {
        0: {
          items: 1
        },
        600: {
          items: 2
        },
        1000: {
          items: 4
        }
      }
    });
  </script>
</body>

</html>