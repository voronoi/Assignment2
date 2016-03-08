using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Excersise_2.Forms
{
    public class User
    {
        public int? SaionTestID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
    }

    public partial class SaionTestApp : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static User[] Get()
        {
            try
            {
                List<User> details = FetchData("pr_LoadData", null);
                return details.ToArray();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public static User[] GetByID(string SaionTestID)
        {
            try
            {
                List<User> details = FetchData("pr_Load", SaionTestID);
                return details.ToArray();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        [WebMethod]
        public static string Update(string SaionTestID, string firstname, string lastname, string email, string phone)
        {
            try
            {
                if (string.IsNullOrEmpty(SaionTestID))
                {
                    Save("pr_InsertSaionTest", SaionTestID, firstname, lastname, email, phone);
                }
                else
                {
                    Save("pr_UpdateSaionTest", SaionTestID, firstname, lastname, email, phone);
                }

                return "True";
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        [WebMethod]
        public static void Delete(string SaionTestID)
        {
            using (SqlConnection m_Connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConSaionTest"].ConnectionString))
            {
                m_Connection.Open();
                using (SqlCommand m_Command = new SqlCommand())
                {
                    m_Command.Connection = m_Connection;
                    m_Command.CommandType = CommandType.StoredProcedure;
                    m_Command.CommandText = "pr_DeleteSaionTest";
                    m_Command.Parameters.AddWithValue("@SaionTestID", SaionTestID);

                    m_Command.ExecuteNonQuery();
                }
            }
        }

        private static List<User> FetchData(string procName, string SaionTestID)
        {
            List<User> details = new List<User>();
            DataTable dt = new DataTable();

            using (SqlConnection m_Connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConSaionTest"].ConnectionString))
            {
                m_Connection.Open();
                using (SqlCommand m_Command = new SqlCommand())
                {
                    m_Command.Connection = m_Connection;
                    m_Command.CommandType = CommandType.StoredProcedure;
                    m_Command.CommandText = procName;

                    if (!string.IsNullOrEmpty(SaionTestID))
                    {
                        m_Command.Parameters.AddWithValue("@SaionTestID", SaionTestID);
                    }
                    SqlDataAdapter adptr = new SqlDataAdapter(m_Command);
                    adptr.Fill(dt);
                }
            }

            foreach (DataRow dtrow in dt.Rows)
            {
                User oUser = new User();
                oUser.SaionTestID = Convert.ToInt32(dtrow["SaionTestID"]);
                oUser.FirstName = dtrow["FirstName"].ToString();
                oUser.LastName = dtrow["LastName"].ToString();
                oUser.Email = dtrow["Email"].ToString();
                oUser.Phone = dtrow["Phone"].ToString();

                details.Add(oUser);
            }


            return details;
        }

        private static void Save(string procName, string SaionTestID, string firstname, string lastname, string email, string phone)
        {
            using (SqlConnection m_Connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConSaionTest"].ConnectionString))
            {
                m_Connection.Open();
                using (SqlCommand m_Command = new SqlCommand())
                {
                    m_Command.Connection = m_Connection;
                    m_Command.CommandType = CommandType.StoredProcedure;
                    m_Command.CommandText = procName;

                    if (!string.IsNullOrEmpty(SaionTestID))
                    {
                        m_Command.Parameters.AddWithValue("@SaionTestID", SaionTestID);
                    }
                    m_Command.Parameters.AddWithValue("@FirstName", firstname);
                    m_Command.Parameters.AddWithValue("@LastName", lastname);
                    m_Command.Parameters.AddWithValue("@Email", email);
                    m_Command.Parameters.AddWithValue("@Phone", phone);

                    m_Command.ExecuteNonQuery();
                }
            }
        }
    }
}