<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


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
  <style>
  #customers {
    font-family: Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
  }

  #customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
  }

  #customers tr:nth-child(even)
  {
  background-color: #f2f2f2;
  }

  #customers tr:hover {background-color: #ddd;}

  #customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #00bfff;
    color: white;
  }

  @import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Bree+Serif&family=EB+Garamond:ital,wght@0,500;1,800&display=swap');

  #container2{
  	box-shadow: 0 15px 30px 1px grey;
  	background: rgba(255, 255, 255, 0.90);
  	text-align: center;
  	border-radius: 5px;
  	overflow: hidden;
  	margin: 5em auto;
  	height: 350px;
  	width: 700px;
  }

  .product-details {
  	position: relative;
  	text-align: left;
  	overflow: hidden;
  	padding: 30px;
  	height: 100%;
  	float: left;
  	width: 40%;
  }

  #container2 .product-details h1{

  	display: inline-block;
  	position: relative;
  	font-size: 25px;
  	color: #344055;
  	margin: 0;

  }

  #container2 .product-details h1:before{
  	position: absolute;
  	content: '';
  	right: 0%;
  	top: 0%;
  	transform: translate(25px, -15px);
  	font-family: 'Bree Serif', serif;
  	display: inline-block;
  	background: #ffe6e6;
  	border-radius: 5px;
  	font-size: 14px;
  	padding: 5px;
  	color: white;
  	margin: 0;
  	animation: chan-sh 6s ease infinite;

  }

  .hint-star {
  	display: inline-block;
  	margin-left: 0.5em;
  	color: gold;
  	width: 50%;
  }


  #container2 .product-details > p {

  	font-size: 18px;
  	font-color: #242033
  }
  .control{
  	position: absolute;
  	bottom: 20%;
  	left: 22.8%;

  }
  .btn {

  	transform: translateY(0px);
  	transition: 0.3s linear;
  	background:  #809fff;
  	border-radius: 5px;
    position: relative;
    overflow: hidden;
  	cursor: pointer;
  	outline: none;
  	border: none;
  	color: #eee;
  	padding: 0;
  	margin: 0;

  }

  .btn:hover{transform: translateY(-6px);
  	background: #1a66ff;}

  .btn span {
  	font-family: 'Farsan', cursive;
  	transition: transform 0.3s;
  	display: inline-block;
    padding: 10px 20px;
  	font-size: 1.2em;
  	margin:0;

  }
  .btn .price, .shopping-cart{
  	background: #333;
  	border: 0;
  	margin: 0;
  }

  .btn .price {
  	transform: translateX(-10%); padding-right: 15px;
  }

  .btn .shopping-cart {
  	transform: translateX(-100%);
    position: absolute;
  	background: #333;
  	z-index: 1;
    left: 0;
    top: 0;
  }


  .product-image {
  /* 	transition: all 0.3s ease-out; */
  	display: inline-block;
  	position: relative;
  	overflow: hidden;
  	height: 100%;
  	float: right;
  	width: 45%;
  	display: inline-block;
  }

  #container2 img {width: 100%;height: 100%;}

  .info {
      background: rgba(27, 26, 26, 0.9);
      font-family: 'Bree Serif', serif;
      transition: all 0.3s ease-out;
      transform: translateX(-100%);
      position: absolute;
      line-height: 1.8;
      text-align: left;
      font-size: 105%;
      cursor: no-drop;
      color: #FFF;
      height: 100%;
      width: 100%;
      left: 0;
      top: 0;
  }

  .info h2 {text-align: center}
  /* .product-image:hover .info{transform: translateX(0);} */

  .info ul li{transition: 0.3s ease;}
  .info ul li:hover{transform: translateX(50px) scale(1.3);}


  </style>
</head>

<body class="sub_page">
  <div class="hero_area">

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
                  <a class="nav-link" href="medicine.jsp">See All</a>
                </li>

              </ul>
              <div class="login_btn-contanier ml-0 ml-lg-5" style="display:flex;flex-direction:row;">
              <a href="cart.jsp" style="margin-right:30px;">

                                <span>
                                  Cart
                                </span>
                              </a>
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
  </div>
  <!-- health section -->

  <section class="health_section layout_padding">
    <div class="health_carousel-container">
      <h2 class="text-uppercase">
        Previous symptoms searched
      </h2>

<table id="customers">
  <tr>
    <th>Symptom</th>
  </tr>
<%
        try {
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "system";
        String pass = "root";
        DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
        Connection con = DriverManager.getConnection(url, user,pass);;
        Statement st=con.createStatement();
        System.out.println("Before all Query block 1");
        int userid = (Integer) session.getAttribute("userid");
        System.out.println("Before all Query block");
        String sql = "select symptoms from sym where userid="+userid;
        ResultSet resultSet = st.executeQuery(sql);

       System.out.println(userid);
while(resultSet.next()){
%>
  <tr>
    <td><%=resultSet.getString("symptoms")%></td>
  </tr>
<%
}
%>
</table>

    </div>

                 <%

                 System.out.println("After try block");
}
              catch (Exception e) {
              System.out.println(e);
               //response.sendRedirect("error page/index.jsp?ecode=500");
              }
        %>

      </section>

  <!-- end health section -->



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
                <!-- <li class="nav-item">
                  <a class="nav-link" href="medicine.html"> Medicine </a>
                </li> -->
                <li class="nav-item">
                  <a class="nav-link" href="buy.html"> Shop</a>
                </li>
              </ul>
            </div>
          </div>
          <!-- <div class="col-md-6">
            <div class="info_news">
              <h4>
                newsletter
              </h4>
              <form action="">
                <input type="text" placeholder="Enter Your email">
                <div class="d-flex justify-content-center justify-content-end mt-3">
                  <button>
                    Subscribe
                  </button>
                </div>
              </form>
            </div>
          </div> -->
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