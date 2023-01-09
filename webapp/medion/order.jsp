<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "system";
        String pass = "root";
        Connection con = null;
        Statement st=null;
        System.out.println("Otha");
        try {
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            con = DriverManager.getConnection(url, user,pass);
            st= con.createStatement();
        }
        catch (Exception e) {
            System.out.println(e);
            System.out.println("nakku2-1");
        }
        ResultSet resultSet = null;
        ResultSet resultSet1 = null;
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
  </style>
</head>

<body class="sub_page">
  <div class="hero_area">

    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container pt-3">
          <a class="navbar-brand" href="index.html">
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
                  <a class="nav-link" href="Login_v3\medicine.jsp">See All</a>
                </li>

              </ul>
              <div class="login_btn-contanier ml-0 ml-lg-5" style="display:flex;flex-direction:row;">
              <a href="cart.jsp" style="margin-right:30px;">

                                <span>
                                  Cart
                                </span>
                              </a>
                <a href="..\javaproject\index.html">
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
        Your orders
      </h2>

<table id="customers">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Manufacturer</th>
    <th>Price</th>
  </tr>
<%
        int userid = (Integer) session.getAttribute("userid");
        String sql = "select medname,medtype,manufacturedby,price from cart,medicine,userDetails where cart.medid=medicine.medid and cart.status='active' and cart.userid=userDetails.userid and userDetails.userid="+userid;
        resultSet = st.executeQuery(sql);
        System.out.println("Query Executed");
        System.out.println(userid);
        int amount=0;
        while(resultSet.next()){
        amount+=resultSet.getInt("price");

%>
  <tr>
    <td><%=resultSet.getString("medname")%></td>
    <td><%=resultSet.getString("medtype")%></td>
    <td><%=resultSet.getString("manufacturedby")%></td>
    <td><%=resultSet.getInt("price")%></td>
  </tr>
 <%
        }
 %>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    <td>Total price : Rs <%=amount%> </td>
    </tr>
</table>

    </div>
    <div class="d-flex justify-content-center">
      <a href="confirm.html">
        Confirm
      </a>
    </div>
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
                  <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
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