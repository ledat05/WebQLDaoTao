using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

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
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString))
            {
                conn.Open();
                string query = "SELECT ketqua.Id, ketqua.MaSV, ketqua.MaMH, ketqua.Diem, sinhvien.hoSV, sinhvien.tenSV " +
                               "FROM ketqua " +
                               "INNER JOIN sinhvien ON ketqua.MaSV = sinhvien.MaSV " +
                               "WHERE ketqua.MaMH = @mamh";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@mamh", mamh);
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    KetQua kq = new KetQua()
                    {
                        Id = int.Parse(rd["Id"].ToString()),  // ✅ Đúng: Lấy ID từ bảng ketqua
                        MaSV = rd["MaSV"].ToString(),
                        MaMH = rd["MaMH"].ToString(),
                        hoTen = rd["hoSV"].ToString() + " " + rd["tenSV"].ToString()
                    };
                    if (!string.IsNullOrEmpty(rd["Diem"].ToString()))
                    {
                        kq.Diem = float.Parse(rd["Diem"].ToString());
                    }
                    ds.Add(kq);
                }
            }
            return ds;
        }


        public int Delete(int id)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("delete from ketqua where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", id);
            return cmd.ExecuteNonQuery();
        }

        public int Update(int id, float diem)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("update ketqua set diem = @diem where id = @id", conn);
            cmd.Parameters.AddWithValue("@diem", diem);
            cmd.Parameters.AddWithValue("@id", id);
            return cmd.ExecuteNonQuery();
        }
    }
}