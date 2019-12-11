<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Monster_Hunter_Project.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
    <link rel="stylesheet" href="LoginPage.css" />
</head>
<body>
    
        <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex">
             <!-- Background image for card set in CSS! -->
          </div>
          <div class="card-body">
            <h5 class="card-title text-center">Login</h5>
            <form class="form-signin" runat="server" novalidate="novalidate">
              <div class="form-label-group">
                   <asp:TextBox ID="usernameBox" runat="server" CssClass="form-control"></asp:TextBox>
             <!--   <input type="text" id="inputUsername" class="form-control" placeholder="Username" required="required" autofocus="autofocus" runat="server"/> -->
                <label for="inputUserame">Username</label>
              </div>


              
              <hr/>

              <div class="form-label-group">
                  <asp:TextBox ID="passwordBox" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            <!--    <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required" runat="server"/>-->
                <label for="inputPassword">Password</label>
              </div>
              

              
              <asp:button id="button1" OnClick="Button1_Click" CssClass="btn btn-lg btn-primary btn-block text-uppercase" type="submit" runat="server" Text="Submit"></asp:button>
              <a class="d-block text-center mt-2 small" href="#">forgot password?</a><br />
              <a class="d-block text-center mt-2 small" href="#" data-toggle="modal" data-target="#mymodal2">register</a>
               <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
              <hr class="my-4"/>
                             <div class="modal fade" id="mymodal2" data-keyboard="false" data-backdrop="static">
   
              <div class="modal-dialog modal-lg modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Register</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>                   
                    <div class="modal-body">
        Username:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtUsername" runat="server" ></asp:TextBox>
        <br />
        <br />
        Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" ></asp:TextBox>
        <br />
        <br />
        Re-Type Password:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtRePassword" runat="server" TextMode="Password" ></asp:TextBox>
        
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" Text="Register" OnClick="Button2_Click" />
        <br />
        <br />
                       
                        </div>                                    
                    <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
                    </div>              
                </div>
  </div>
              
            </form>
          </div>
        </div>
      </div>
    </div>
 
  





<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
