using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QLKhoa : System.Web.UI.Page
    {
        KhoaDao khDao = new KhoaDao();
        protected void Page_Load(object sender, EventArgs e)
        {
            //If (!Page.IsPostBack)
            //{
            //    Nạp dữ liệu cho gvKhoa
            //    gvKhoa.DataSource = khDao.getAll();
            //    gvKhoa.DataBind();

            //}
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string makh = txtMaMK.Text;
            string tenkh = txtTenKH.Text;
            Khoa kh = new Khoa { MaKH = makh, TenKH = tenkh };
            khDao.Insert(kh);
            gvKhoa.DataBind();

        }

        protected void gvKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
    }
}