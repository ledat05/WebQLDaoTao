using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace WebQLDaoTao.Models
{
    public class KetQuaDao
    {
        public List<KetQua> getAll()
        {
            List<KetQua> ds = new List<KetQua>();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from ketqua", conn);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                KetQua kq = new KetQua()
                {
                    Id = int.Parse(rd["id"].ToString()),
                    MaSV = rd["MaSV"].ToString(),
                    MaMH = rd["mamh"].ToString()
                };
                if (!string.IsNullOrEmpty(rd["diem"].ToString()))
                {
                    kq.Diem = float.Parse(rd["diem"].ToString());
                }
                ds.Add(kq);
            }

            return ds;

        }
        public List<KetQua> getMaMH(string mamh)
        {
            List<KetQua> ds = new List<KetQua>();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select ketqua.*, hosv, tensv from ketqua inner join sinhvien on ketqua.masv = sinhvien.masv where mamh = @mamh",conn);
            cmd.Parameters.AddWithValue("@mamh", mamh);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                KetQua kq = new KetQua()
                {
                    Id = int.Parse(rd["MaMH"].ToString()),
                    MaSV = rd["MaSV"].ToString(),
                    MaMH = rd["mamh"].ToString(),
                    hoTen = rd["hosv"].ToString() +" "+ rd["tensv"].ToString()
                };
                if (!string.IsNullOrEmpty(rd["diem"].ToString()))
                {
                    kq.Diem = float.Parse(rd["diem"].ToString());
                }
                ds.Add(kq);
            }

            return ds;

        }
    }
}