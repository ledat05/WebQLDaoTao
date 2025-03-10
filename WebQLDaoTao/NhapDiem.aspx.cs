using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class NhapDiem : System.Web.UI.Page
    {
        KetQuaDao kqDAO = new KetQuaDao();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btLuu_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < gvDiem.Rows.Count; i++)
            {
                //lấy id(DataKey) của dòng
                int id = int.Parse(gvDiem.DataKeys[i].Value.ToString());
                //lấy điểm
                float diem = float.Parse(((TextBox)gvDiem.Rows[i].FindControl("txtDiem")).Text);
                //cập nhật điểm
                kqDAO.Update(id, diem);
            }
        }

        protected void btXoa_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < gvDiem.Rows.Count; i++)
            {
                //lấy id(DataKey) của dòng
                int id = int.Parse(gvDiem.DataKeys[i].Value.ToString());
                //kiểm tra có check chọn không
                CheckBox ck = (CheckBox)gvDiem.Rows[i].FindControl("ckChon");
                if (ck.Checked)
                    kqDAO.Delete(id);
            }
            gvDiem.DataBind();
        }

        protected void ckAll_checkedChanged(object sender, EventArgs e)
        {
            bool check = ((CheckBox)gvDiem.HeaderRow.FindControl("ckAll")).Checked;
            for (int i = 0; i < gvDiem.Rows.Count; i++)
            {
                ((CheckBox)gvDiem.Rows[i].FindControl("ckChon")).Checked = check;
            }
        }
    }
}