<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebQLDaoTao.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form>
        <div class="form-group">
            <label for="email">User Email</label>
           <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
           <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="Submit" CssClass="btn btn-default" OnClick="btnSubmit_Click" runat="server"/>
    </form>
</body>
</html>
