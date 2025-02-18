using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace WebQLDaoTao.Models
{
    public class KhoaDao
    {
        //Đọc tất cả môn học
        public List<Khoa> getAll()
        {
            List<Khoa> ds = new List<Khoa>();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from khoa", conn);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                ds.Add(new Khoa()
                {
                    MaKH = rd["MaKH"].ToString(),
                    TenKH = rd["TenKH"].ToString(),
                });
            }

            return ds;
        }

        //Thêm môn học
        public int Insert(Khoa mk)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("insert into KHOA values(@MaKH, @TenKH)", conn);
            cmd.Parameters.AddWithValue("MaKH", mk.MaKH);
            cmd.Parameters.AddWithValue("TenKH", mk.TenKH);
            return cmd.ExecuteNonQuery();
        }

        //Sửa môn học
        public int Update(Khoa mk)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("update KHOA set TenKH = @TenKH where MaKH = @MaKH", conn);
            cmd.Parameters.AddWithValue("MaKH", mk.MaKH);
            cmd.Parameters.AddWithValue("TenKH", mk.TenKH);
            return cmd.ExecuteNonQuery();
        }

        //Xóa môn học
        public int Delete(string MaKH)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("delete from KHOA where MaKH = @MaKH", conn);
            cmd.Parameters.AddWithValue("MaKH", MaKH);
            return cmd.ExecuteNonQuery();
        }
    }
}