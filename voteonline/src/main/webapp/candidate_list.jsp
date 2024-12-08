<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %> <%@page import="java.sql.ResultSet"%> <%@page
import="java.sql.PreparedStatement"%> <%@page import="voteonline.DConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
  <head>
    <title></title>
    <!-- CSS only -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <!-- JavaScript Bundle with Popper -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto+Slab&display=swap"
      rel="stylesheet"
    />
    <style type="text/css">
      .container {
        border: 2px solid #fff;
        background: #fff;
        border-radius: 5px;
      }
      h1,
      label {
        font-family: "Roboto Slab", serif;
      }
      a {
        font-size: 20px;
        text-decoration: none;
        color: #d66d75;
        padding: 10px 10px;
        background-color: #fff;
        border-radius: 5px;
        font-size: larger;
      }
    </style>
  </head>
  <body style="background: linear-gradient(#d66d75, #e29587)">
    <h1 align="center" class="mt-5" style="color: white">
      View All Candidates
    </h1>
    <center><a href="#">Add Candidate</a></center>
    <div class="container mt-5">
      <form>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Candidate Name</th>
              <th scope="col">Party Name</th>
              <th scope="col">Categorye</th>
              <th scope="col">Symbol</th>
              <th scope="col">Description</th>
            </tr>
          </thead>
          <tbody>
            <% DConnection dbcon = new DConnection(); Connection con =
            dbcon.getConn(); int cnt=0; String sql = "SELECT * FROM candidate_table"; 
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery(); while(rs.next()){ cnt++; %>

            <tr>
              <th scope="row" class="align-middle"><%=cnt %></th>

              <td class="align-middle"><%=rs.getString(2) %></td>
              <td class="align-middle text-center"><%=rs.getString(3) %></td>
              <td class="align-middle text-center"><%=rs.getString(4) %></td>
              <td class="align-middle text-center"><%=rs.getString(5) %></td>
              <td class="align-middle text-center"><%=rs.getString(6) %></td>
              <td class="align-middle">
                <a href="#" class="btn btn-success">View Profile</a>
              </td>
            </tr>
            <%} %>
          </tbody>
        </table>
      </form>
    </div>
  </body>
</html>
