<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Admin/assets/login.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>   
      <div class="container">
         <header>Register Now</header>
            <div class="input-field">
               <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
               <label>Name</label>
               <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage ="PLZ Enter name" ForeColor="Red" ControlToValidate="txtname" />
            </div>
            <div class="input-field">
               <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
               <label>Email</label>
                <asp:RegularExpressionValidator ID="rev1" runat="server" ErrorMessage="PLZ Enter Proper Email" ForeColor="Red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtemail"></asp:RegularExpressionValidator>
            </div>
            <div class="input-field">
               <asp:TextBox ID="txtmobile" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="rev2" runat="server" ErrorMessage="PLZ Enter Proper Mobile Number" ForeColor="Red" ValidationExpression="[0-9]{10}" ControlToValidate="txtmobile"></asp:RegularExpressionValidator>
               <label>Mobile</label>
            </div>
            <div class="input-field">
               <asp:TextBox ID="txtpass" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rqv1" runat="server" ErrorMessage="PLZ Enter password" ForeColor="Red" ControlToValidate="txtpass"></asp:RequiredFieldValidator>
               <label>Password</label>
            </div>
            <div class="button">  
               <asp:Button CssClass="inner" ID="btn_reg" runat="server" Text="Register"/>
            </div>
          <div class="signup">
            Already have an account <a href="Login.aspx">Login</a>
         </div>
          <div>
              <asp:Label ID="lbl_motion" runat="server"></asp:Label>
          </div>
            </div>
      </div>
    </form>
</body>
</html>
