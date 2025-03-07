<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NhapDiem.aspx.cs" Inherits="WebQLDaoTao.NhapDiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>NHẬP ĐIỂM</h2>
    <div class="form-inline">
        Chọn môn
        <asp:DropDownList ID="ddlKhoa" AutoPostBack="true" DataSourceID="odsMonHoc" DataTextField="TenMH" DataValueField="MaMH" runat="server"></asp:DropDownList>
    </
    <asp:GridView ID="gvDiem" runat="server" AutoGenerateColumns="False" DataSourceID="odsDiem"
        AllowPaging="True" CssClass="table table-bordered table-hover" Width="70%" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id"></asp:BoundField>
            <asp:BoundField DataField="MaSV" HeaderText="MaSV" SortExpression="MaSV" />
            <asp:BoundField DataField="MaMH" HeaderText="MaMH" SortExpression="MaMH" />
            <asp:BoundField DataField="Diem" HeaderText="Diem" SortExpression="Diem" />
        </Columns>

        <EmptyDataTemplate>
            <div class="alert alert-warning">Không có dữ liệu</div>
        </EmptyDataTemplate>
        
        <PagerStyle HorizontalAlign="Center" CssClass="pagination-ys" />
    </asp:GridView>
    <asp:ObjectDataSource ID="odsDiem" runat="server" SelectMethod="getMaMH" TypeName="WebQLDaoTao.Models.KetQuaDao">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlKhoa" Name="mamh" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsMonHoc" runat="server" SelectMethod="getAll" TypeName="WebQLDaoTao.Models.MonHocDAO"></asp:ObjectDataSource>
</asp:Content>
