<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLKhoa.aspx.cs" Inherits="WebQLDaoTao.QLKhoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <p>
        Quản Lý Khoa
    </p>
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Thêm môn học</button>

    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Thêm môn học</h4>
                </div>
                <div class="modal-body">
                    <div class="mb-3 row">
                        <label for="txtMaKH" class="col-sm-2 col-form-label">Mã khoa</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtMaMK" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="txtTenKH" class="col-sm-2 col-form-label">Tên khoa</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtTenKH" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button1" OnClick="btnSubmit_Click" runat="server" Text="Lưu" CssClass="btn btn-primary" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
      <div>
        <asp:GridView  ID="gvKhoa" runat="server" CssClass="table table-bordered table-hover"
            DataSourceID="obsKhoa" AutoGenerateColumns="false" Height="301px" DataKeyNames="MaKH"
            AllowPaging="true" PageSize="5" OnSelectedIndexChanged="gvKhoa_SelectedIndexChanged">

            <Columns>     
                <asp:BoundField HeaderText="Mã Khoa" DataField="MaKH" />
                <asp:BoundField HeaderText="Tên Khoa" DataField="TenKH" />
                <asp:CommandField HeaderText="Chức năng" ShowDeleteButton="true" ShowEditButton="true" ButtonType="Button"/>
            </Columns>
             <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#00FF00" ForeColor="#ffffff" />
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
        </asp:GridView>
    <asp:ObjectDataSource ID="obsKhoa" runat="server"
        DataObjectTypeName="WebQLDaoTao.Models.Khoa" DeleteMethod="Delete"
        InsertMethod="Insert" SelectMethod="getAll"
        TypeName="WebQLDaoTao.Models.KhoaDao"
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="MaKH" Type="String" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    </div>
</asp:Content>
