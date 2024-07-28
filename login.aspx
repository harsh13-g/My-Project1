<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">   
    <title></title>
    <link href="Admin/assets/login.css" rel="stylesheet" />
    <link rel="shortcut icon" href="Admin/Images/hlogo.jpg" />
</head>
<body>
    <form id="form1" runat="server">
     <div>
      <div class="container">
         <header>Login Now</header>
            <div class="input-field">
               <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvl1" runat="server" ErrorMessage="Plz Inter Uname/Email" ForeColor="red" ControlToValidate="txtname"></asp:RequiredFieldValidator>
               <label>Email or Username</label>
            </div>
            <div class="input-field">
               <asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvl2" runat="server" ErrorMessage="Plz Enter Password" ForeColor="Red" ControlToValidate="txtpass"></asp:RequiredFieldValidator>
               <span class="show">SHOW</span>
               <label>Password</label>
            </div>
            <div class="button">
               <div class="inner"></div>
                <asp:Button ID="btn_login" runat="server" class="inner" Text="Login" OnClick="btn_login_Click1" />
            </div>
         
         <div class="signup">
            Not a member? <a href="Register.aspx">Signup now</a>
         </div>
      </div>
    </div>
    </form>
</body>
    <script>
        var input = document.querySelector('.pswrd');
        var show = document.querySelector('.show');
        show.addEventListener('click', active);
        function active() {
            if (input.type === "password") {
                input.type = "text";
                show.style.color = "#1DA1F2";
                show.textContent = "HIDE";
            } else {
                input.type = "password";
                show.textContent = "SHOW";
                show.style.color = "#111";
            }
        }
      </script>
</html>
