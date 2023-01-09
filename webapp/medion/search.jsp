<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
        boolean flag = true;
        String medName = request.getParameter("medName");
        String medtype = request.getParameter("medtype");
        String medComposition = request.getParameter("medComposition");
        String manufacturedby = request.getParameter("manufacturedby");
        String price = request.getParameter("price");
        String lowerAge = request.getParameter("lowerAge");
        String upperAge = request.getParameter("upperAge");
        String uses = request.getParameter("uses");
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "system";
        String pass = "root";
        Connection con = null;
        Statement st=null;
        try {
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            con = DriverManager.getConnection(url, user,pass);
            st= con.createStatement();
        }
        catch (Exception e) {
            System.out.println(e);
            System.out.println("Cannot connect to database");
        }
        ResultSet resultSet = null;

        try{
        int id = 1;
                         if(request.getParameter("medId")!=null){
                           System.out.println("Inside if");
                           System.out.println(request.getParameter("medId"));
                           int medId = Integer.parseInt(request.getParameter("medId"));
                           int u=(Integer) session.getAttribute("userid");
                           ResultSet rs=null;
                                   try {
                                       rs = st.executeQuery("SELECT carid FROM cart ORDER BY carid DESC");
                                       if(rs.next()){
                                           id=rs.getInt("carid")+1;
                                       }
                                   }
                                   catch (Exception e) {
                                       System.out.println(e);
                                       System.out.println("One");
                                   }
                           String sqlQuery = "insert into cart values("+id+","+medId+","+u+",'active')";
                           st.executeUpdate(sqlQuery);
                           response.sendRedirect("search.jsp?medName="+medName+"&medtype="+medtype+"&medComposition="+medComposition+"&manufacturedby="+manufacturedby+"&price="+price+"&lowerAge="+lowerAge+"&upperAge="+upperAge+"&uses="+uses);

                         }
                    }
                    catch(Exception e){
                        System.out.println("Nakku 2.0");
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
                  <a class="nav-link" href="Login_v3\filter.html">Filter</a>
                </li>

              </ul>
              <div class="login_btn-contanier ml-0 ml-lg-5" style="display: flex; flex-direction:row;">
              <a href="cart.jsp" style="margin-right: 30px;">
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
        Medicine & Health
      </h2>
      <%
    try{

        System.out.println("medName= "+medName+" medtype= "+medtype+" medComposition= "+medComposition+"manufacturedby="+manufacturedby+"price="+price+"lowerAge="+lowerAge+"upperAge="+upperAge+"uses="+uses);
        String resultQuery = "select medid, medname, manufacturedby, medcomposition, price, uses, medtype from medicine where ";


        if(medName.length()==0 && medComposition.length()==0 && medtype.length()==0 && manufacturedby.length()==0 && price.length()==0 && lowerAge.length()==0 && upperAge.length()==0 && uses.length()==0){

           response.sendRedirect("./medicine.jsp");

           // resultSet = st.executeQuery("select medid,medname,medtype,medcomposition,manufacturedby,price,uses from medicine");
        }
        else
        {

            if(medName.length()!=0){
                if(flag==false){
                    resultQuery+=" and ";
                }
                flag=false;
                resultQuery+="medname like '%"+medName+"%'";
            }

            if(medComposition.length()!=0){
                if(flag==false){
                    resultQuery+=" and ";
                }
                flag=false;

                String[] composition = medComposition.split(",");
                int stringLength = composition.length;
                int count=0;
                for(String name : composition){
                    count++;
                    resultQuery+="medcomposition like '%"+name+"%'";
                    if(count < stringLength) {
                        resultQuery+=" or ";
                    }
                }
            }

            if(medtype.length()!=0){
                if(flag==false){
                    resultQuery+=" and ";
                }
                flag=false;
                resultQuery+="medtype like '%"+medtype+"%'";
            }


            if(manufacturedby.length()!=0) {
                if(flag==false){
                    resultQuery+=" and ";
                }
                flag=false;
                resultQuery+="manufacturedby like '%"+manufacturedby+"%'";
            }
            if(price.length()!=0) {
                if(flag==false){
                    resultQuery+=" and ";
                }
                flag=false;
                resultQuery+="price <= "+price;
            }
            if(lowerAge.length()!=0){
                if(flag==false){
                    resultQuery+=" and ";
                }
                flag=false;
                resultQuery+="lowerage >= "+lowerAge;
            }
            if(upperAge.length()!=0){
                if(flag==false){
                    resultQuery+=" and ";
                }
                flag=false;
                resultQuery+="upperage >= "+upperAge;
            }

            if(uses.length()!=0){
                if(flag==false){
                    resultQuery+=" and ";
                }
                flag=false;
                String[] composition = uses.split(",");
                int stringLength = composition.length;
                int count=0;
                for(String name : composition){
                    count++;
                    resultQuery+="uses like '%"+name+"%'";
                    if(count < stringLength) {
                        resultQuery+=" or ";
                    }
                }
            }
        }
        resultSet = st.executeQuery(resultQuery);
        int count=0;
        while(resultSet.next()){
            count++;
        }

        resultSet = st.executeQuery(resultQuery);
        for(int j=0;j<count/5;j++){
      %>
       <div style="display:flex;flex-direction:row;">
       <%
            int k=0;
            while(k<5){
                if(resultSet.next()){
                    System.out.println(resultSet.getString("medtype"));
       %>
            <div class="item" style="margin-right:60px">
                            <div class="box">
                              <div class="btn_container">
                                <a href=<%="search.jsp?medId="+resultSet.getInt("medid")+"&medName="+medName+"&medtype="+medtype+"&medComposition="+medComposition+"&manufacturedby="+manufacturedby+"&price="+price+"&lowerAge="+lowerAge+"&upperAge="+upperAge+"&uses="+uses %>>
                                  Add Now
                                </a>
                              </div>
                              <div class="img-box">
                              <% if(resultSet.getString("medtype").equals("Oil")){%>
                                                                 <img src="images/oil.jpg" alt="">
                                                                 <% } %>
                                <% if(resultSet.getString("medtype").equals("Shampoo")){%>
                                     <img src="images/new_shampoo.jpg" alt="">
                                   <% } %>
                                   <% if(resultSet.getString("medtype").equals("Facewash")){%>
                                   <img src="images/facewash.jpg" alt="">
                                   <% } %>
                                   <% if(resultSet.getString("medtype").equals("Drops")){%>
                                   <img src="images/eyedrops.jpg" alt="">
                                   <% } %>
                                   <% if(resultSet.getString("medtype").equals("Pills")){%>
                                   <img src="images/p-2.jpg" alt="">
                                   <% } %>
                                   <% if(resultSet.getString("medtype").equals("Ointment")){%>
                                     <img src="images/ointment.jpg" alt="">
                                   <% } %>
                                   <% if(resultSet.getString("medtype").equals("Cream")){%>
                                     <img src="images/cream.jpg" alt="">
                                   <% } %>
                                   <% if(resultSet.getString("medtype").equals("Syrup")){%>
                                   <img src="images/syrup.jpg" alt="">
                                   <% } %>
                              </div>
                              <div class="detail-box">
                                <div class="star_container">
                                  <h6>
                                      <%=resultSet.getString("medname") %>
                                  </h6>
                                </div>
                                <div class="text">
                                  <h6>
                                    <%=resultSet.getString("medtype") %>
                                  </h6>
                                </div>
                              </div>
                               <div class="detail-box">
                                <div class="star_container">
                                  <h6>
                                      <%=resultSet.getString("medcomposition") %>
                                  </h6>
                                </div>
                                <div class="text">
                                  <h6>
                                    <%=resultSet.getString("manufacturedby") %>
                                  </h6>
                                  <h6 class="price">
                                      <span>
                                        ₹
                                      </span>
                                    <%=resultSet.getInt("price") %>
                                  </h6>
                                </div>
                              </div>

                            </div>
                          </div>
         <%
            }
            k++;
         }
         %>
            </div>
          <%
          }
          for(int j=(count/5)*5;j<((count/5)*5)+(count%5);j++){
                %>
            <div style="display:flex;flex-direction:row">
                 <%
                      int k=0;
                      while(k<5)
                      {
                          if(resultSet.next())
                          {
                            System.out.println(resultSet.getString("medtype"));
                 %>
                      <div class="item" style="margin-right:60px">
                      <div class="box">
                      <div class="btn_container">
                      <a href=<%="search.jsp?medId="+resultSet.getInt("medid")+"&medName="+medName+"&medtype="+medtype+"&medComposition="+medComposition+"&manufacturedby="+manufacturedby+"&price="+price+"&lowerAge="+lowerAge+"&upperAge="+upperAge+"&uses="+uses %>>
                        Add Now
                      </a>
                    </div>
                     <div class="img-box">
                    <% if(resultSet.getString("medtype").equals("Shampoo")){%>
                                     <img src="images/new_shampoo.jpg" alt="">
                                   <% } %>
                                   <% if(resultSet.getString("medtype").equals("Facewash")){%>
                                   <img src="images/facewash.jpg" alt="">
                                   <% } %>
                                   <% if(resultSet.getString("medtype").equals("Drops")){%>
                                   <img src="images/eyedrops.jpg" alt="">
                                   <% } %>
                                   <% if(resultSet.getString("medtype").equals("Oil")){%>
                                   <img src="images/oil.jpg" alt="">
                                   <% } %>
                                   <% if(resultSet.getString("medtype").equals("Pills")){%>
                                   <img src="images/p-2.jpg" alt="">
                                   <% } %>
                                   <% if(resultSet.getString("medtype").equals("Ointment")){%>
                                     <img src="images/ointment.jpg" alt="">
                                   <% } %>
                                   <% if(resultSet.getString("medtype").equals("Cream")){%>
                                     <img src="images/cream.jpg" alt="">
                                   <% } %>
                                   <% if(resultSet.getString("medtype").equals("Syrup")){%>
                                   <img src="images/syrup.jpg" alt="">
                                   <% } %>
                       </div>
                      <div class="detail-box">
                       <div class="star_container">
                       <h6>
                       <%=resultSet.getString("medname") %>
                        </h6>
                        </div>
                        <div class="text">
                        <h6>
                        <%=resultSet.getString("medtype") %>
                        </h6>
                       </div>
                       </div>
                       <div class="detail-box">
                                <div class="star_container">
                                  <h6>
                                      <%=resultSet.getString("medcomposition") %>
                                  </h6>
                                </div>
                                <div class="text">
                                  <h6>
                                    <%=resultSet.getString("manufacturedby") %>
                                  </h6>
                                  <h6 class="price">
                                      <span>
                                        Rs
                                      </span>
                                    <%=resultSet.getInt("price") %>
                                  </h6>
                                </div>
                              </div>
                             </div>
                            </div>
                  <%
                            }
                        k++;
                    }
                   %>
                      </div>
                    <%
                    }

                        System.out.println("After the Code");
                        }
                        catch(Exception e){
                            System.out.println(e);
                            System.out.println("Cannot retrieve data! SQL ERROR");
                    }
                    %>

    </div>
    <div class="d-flex justify-content-center">
      <a href="">
        Order
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