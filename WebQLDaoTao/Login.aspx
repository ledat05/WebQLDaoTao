<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebQLDaoTao.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body class="d-flex justify-content-center align-items-center vh-100">
    <form id="form1" runat="server" class="p-4 border rounded shadow bg-light" style="width: 350px;">
        <h3 class="text-center">Sign in</h3>

        <!-- Email-->
        <div data-mdb-input-init class="form-outline mb-4">
            <label class="form-label" for="txtUserName">Email</label>
            <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox>
        </div>

        <!-- Password  -->
        <div data-mdb-input-init class="form-outline mb-4">
            <label class="form-label" for="txtPassword">Mật khẩu</label>
            <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
        </div>

        <!-- Ghi nhớ và quên mật khẩu -->
        <div class="row mb-4">
            <div class="col d-flex justify-content-center">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="rememberMe" checked />
                    <label class="form-check-label" for="rememberMe">Lưu mật khẩu </label>
                </div>
            </div>
            <div class="col text-end">
                <a href="#">Quên mật khẩu?</a>
            </div>
        </div>

        <!-- Nút Login -->
        <div class="d-flex justify-content-center">
            <asp:Button ID="btLogin" CssClass="btn btn-primary btn-block mb-4" Text="Đăng nhập" OnClick="btnSubmit_Click" runat="server" />
        </div>
        <!-- Thông báo lỗi -->
        <asp:Label ID="lbThongBao" runat="server" Text="" CssClass="text-danger d-block text-center"></asp:Label>
        <div class="d-flex justify-content-center mt-4">
            <a href="https://www.facebook.com/" target="_blank" class="btn btn-link btn-floating mx-1">
                <i class="fab fa-facebook-f"></i>
            </a>
            <a href="https://accounts.google.com/" target="_blank" class="btn btn-link btn-floating mx-1">
                <i class="fab fa-google"></i>
            </a>
            <a href="https://twitter.com/" target="_blank" class="btn btn-link btn-floating mx-1">
                <i class="fab fa-twitter"></i>
            </a>
        </div>
    </form>
</body>
</html>
