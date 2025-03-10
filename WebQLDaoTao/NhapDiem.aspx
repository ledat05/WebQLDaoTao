<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NhapDiem.aspx.cs" Inherits="WebQLDaoTao.NhapDiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>NHẬP ĐIỂM</h2>
    <div class="form-inline">
        Chọn môn
        <asp:DropDownList ID="ddlKhoa" AutoPostBack="true" DataSourceID="odsMonHoc" DataTextField="TenMH" DataValueField="MaMH" runat="server"></asp:DropDownList>
        </div>
    <asp:GridView ID="gvDiem" runat="server" AutoGenerateColumns="False" DataSourceID="odsDiem"
         CssClass="table table-bordered" Width="50%" ShowFooter="True" DataKeyNames="Id">
        <Columns>
             <asp:BoundField DataField="MaSV" HeaderText="Mã sinh viên" ReadOnly="true"></asp:BoundField>
            <asp:BoundField DataField="hoTen" HeaderText="Họ tên sinh viên" ></asp:BoundField>
            <asp:TemplateField HeaderText="Diem">
                <ItemTemplate>              
                        <asp:TextBox ID="txtDiem" runat="server" Text='<%# Eval("Diem")%>' CssClass="form-control" Width="150px"></asp:TextBox>
                </ItemTemplate>
                    <footertemplate>
                        <asp:Button ID="btLuu" runat="server" Text="Lưu điểm" CssClass="btn btn-success" OnClick="btLuu_Click"/>
                    </footertemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="Chọn xóa">
                <HeaderTemplate>
                    <asp:CheckBox ID="ckAll" runat="server" Text="Chọn tất cả" AutoPostBack="true" OnCheckedChanged="ckAll_checkedChanged" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="ckChon" runat="server" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btXoa" runat="server" Text="Xoá" CssClass="btn btn-danger" OnClick="btXoa_Click" />
                </FooterTemplate>
            </asp:TemplateField>
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
