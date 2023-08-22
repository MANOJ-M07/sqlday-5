using System;
using System.Data;
using System.Data.SqlClient;

namespace ConAppAdoReader
{
    internal class Program
    {
        static SqlConnection con;
        static SqlCommand cmd;
        static SqlDataReader reader;
        static string constr = "server=LAPTOP-DLI2FL88;database=OurDb;trusted_connection=true;";
        static void Main(string[] args)
        {
            try
            {
                con = new SqlConnection(constr);
                cmd = new SqlCommand("select * from Employees", con);
                con.Open();
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Console.WriteLine("Id:" + reader["Id"]);
                    Console.WriteLine("First Name: " + reader["FirstName"]);
                    Console.WriteLine("Last Name: " + reader["LastName"]);
                    Console.WriteLine("Manager ID: " + reader["ManagerID"]);
                    Console.WriteLine("---------------------------------------------"); ;

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error!!!"+ex.Message);
            }
            finally
            {
                con.Close();
                Console.ReadKey();  
            }
        }
    }
}
