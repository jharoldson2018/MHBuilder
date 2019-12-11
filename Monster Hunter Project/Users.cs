using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Monster_Hunter_Project
{
    public class Users
    {

        public String GetUserData(int UserID)
        {

            DBManager myDBManager = new DBManager();

            string myQuery = "spSelectUserByID";
            SqlParameter[] myParameters = new SqlParameter[1];
            myParameters[0] = new SqlParameter("userID", UserID);


            DataSet myDataSet = myDBManager.createDataSet(myQuery, myParameters);

            string finalResult = "";

            for (int i = 0; i < myDataSet.Tables[0].Rows.Count; i++)
            {


                finalResult += myDataSet.Tables[0].Rows[i]["firstName"] + " " + myDataSet.Tables[0].Rows[i]["lastName"] + "<br>";
            }

            return finalResult;

        }
        public String GetAllPlayers()
        {

            DBManager myDBManager = new DBManager();

            string myQuery = "spSelectAllUsers";
            //SqlParameter[] myParameters = new SqlParameter[1];
            // myParameters[0] = new SqlParameter("userID", UserID);


            DataSet myDataSet = myDBManager.createDataSet(myQuery);

            string finalResult = "";

            for (int i = 0; i < myDataSet.Tables[0].Rows.Count; i++)
            {


                finalResult += myDataSet.Tables[0].Rows[i]["firstName"] + " " + myDataSet.Tables[0].Rows[i]["lastName"] + ": " + myDataSet.Tables[0].Rows[i]["gamerTag"] + "<br>";
            }

            return finalResult;
        }

        public String getProfileData(int UserID)
        {

            DBManager myDBManager = new DBManager();

            string myQuery = "spGetProfile";
            SqlParameter[] myParameters = new SqlParameter[1];
            myParameters[0] = new SqlParameter("userID", UserID);


            DataSet myDataSet = myDBManager.createDataSet(myQuery, myParameters);

            string finalResult = "";

            for (int i = 0; i < myDataSet.Tables[0].Rows.Count; i++)
            {


                finalResult += "First Name: " + myDataSet.Tables[0].Rows[i]["firstName"] + "<br>" + "<br>"
                             + "Last Name: " + myDataSet.Tables[0].Rows[i]["lastName"] + "<br>" + "<br>"
                             + "Gamer Tag: " + myDataSet.Tables[0].Rows[i]["gamerTag"] + "<br>" + "<br>"
                             + "Email: " + myDataSet.Tables[0].Rows[i]["email"] + "<br>" + "<br>"
                             + "Address: " + myDataSet.Tables[0].Rows[i]["address"] + "<br>" + "<br>"
                             + "Phone Number: " + myDataSet.Tables[0].Rows[i]["phone"] + "<br>" + "<br>"
                             + "Payment info: " + myDataSet.Tables[0].Rows[i]["paymentInfo"] + "<br>" + "<br>";

            }

            return finalResult;

        }

        public int updateUser(int UserID, string firstName, string lastName)
        {
            DBManager myDBManager = new DBManager();
            string myQuery = "spUpdateUser";

            SqlParameter[] myParameters = new SqlParameter[3];
            myParameters[0] = new SqlParameter("firstName", firstName);
            myParameters[1] = new SqlParameter("lastName", lastName);
            myParameters[2] = new SqlParameter("userID", UserID);

            int rows = myDBManager.executeNonQuery(myQuery, myParameters);
            return rows;
        }
        public int insertUser(string firstName, string lastName, string username, string password, string gamertag, string email)
        {
            DBManager myDBManager = new DBManager();
            string myQuery = "spInsertIntoUsers";

            Byte[] EncryptedPwd = encrypt(password);

            SqlParameter[] myParameters = new SqlParameter[6];
            myParameters[0] = new SqlParameter("firstName", firstName);
            myParameters[1] = new SqlParameter("lastName", lastName);
            myParameters[2] = new SqlParameter("userName", username);
            myParameters[3] = new SqlParameter("gamerTag", gamertag);
            myParameters[4] = new SqlParameter("email", email);
            myParameters[5] = new SqlParameter("password", EncryptedPwd);


            int rows = myDBManager.executeNonQuery(myQuery, myParameters);
            return rows;
        }
        public int insertUser(string username, string password)
        {
            DBManager myDBManager = new DBManager();
            string myQuery = "spInsertIntoUsers";
            Byte[] EncryptedPwd = encrypt(password);
            SqlParameter[] myParameters = new SqlParameter[2];
            myParameters[0] = new SqlParameter("username", username);
            myParameters[1] = new SqlParameter("password", EncryptedPwd);
            int rows = myDBManager.executeNonQuery(myQuery, myParameters);
            return rows;
        }
        public int checkUserPwd(string username, string password)
        {
            DBManager myDBManager = new DBManager();
            string myQuery = "spCheckUserPass";

            Byte[] EncryptedPwd = encrypt(password);

            SqlParameter[] myParameters = new SqlParameter[2];

            myParameters[0] = new SqlParameter("userName", username);
            myParameters[1] = new SqlParameter("password", EncryptedPwd);


            int Count = myDBManager.getscaler(myQuery, myParameters);
            return Count;
        }
        public string getUserID(string username, string password)
        {
            DBManager myDBManager = new DBManager();
            string myQuery = "spGetUserID";

            Byte[] EncryptedPwd = encrypt(password);

            SqlParameter[] myParameters = new SqlParameter[2];

            myParameters[0] = new SqlParameter("userName", username);
            myParameters[1] = new SqlParameter("password", EncryptedPwd);


            DataSet myDataSet = myDBManager.createDataSet(myQuery, myParameters);

            string finalResult = "";

            for (int i = 0; i < myDataSet.Tables[0].Rows.Count; i++)
            {


                finalResult += myDataSet.Tables[0].Rows[i]["UserID"];
            }

            return finalResult;
        }
        private Byte[] encrypt(string unencryptedString)
        {
            // encrypt password before inserted..
            Byte[] hashedDataBytes = null;
            UTF8Encoding encoder = new UTF8Encoding();

            MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();

            hashedDataBytes = md5Hasher.ComputeHash(encoder.GetBytes(unencryptedString));

            return hashedDataBytes;
        }
        public int updateUserFirstName(int UserID, string firstname)
        {
            DBManager myDBManager = new DBManager();
            string myQuery = "spUpdateUserFirstName";

            SqlParameter[] myParameters = new SqlParameter[2];

            myParameters[0] = new SqlParameter("userID", UserID);
            myParameters[1] = new SqlParameter("lastName", firstname);

            int rows = myDBManager.executeNonQuery(myQuery, myParameters);
            return rows;
        }
        public string getUserByTag(string gamertag)
        {
            DBManager myDBManager = new DBManager();
            string myQuery = "spSpecificUserByGamerTag";

            SqlParameter[] myParameters = new SqlParameter[1];

            myParameters[0] = new SqlParameter("gamerTag", gamertag);



            DataSet myDataSet = myDBManager.createDataSet(myQuery, myParameters);

            string finalResult = "";

            for (int i = 0; i < myDataSet.Tables[0].Rows.Count; i++)
            {


                finalResult += myDataSet.Tables[0].Rows[i]["firstName"] + " " + myDataSet.Tables[0].Rows[i]["lastName"] + myDataSet.Tables[0].Rows[i]["gamerTag"] + " " + "<br>";
            }

            return finalResult;
        }
        public int updateUserLastName(int UserID, string lastname)
        {
            DBManager myDBManager = new DBManager();
            string myQuery = "spUpdateLastName";

            SqlParameter[] myParameters = new SqlParameter[2];

            myParameters[0] = new SqlParameter("userID", UserID);
            myParameters[1] = new SqlParameter("lastName", lastname);

            int rows = myDBManager.executeNonQuery(myQuery, myParameters);
            return rows;
        }
        public int updateUserGamerTag(int UserID, string gtag)
        {
            DBManager myDBManager = new DBManager();
            string myQuery = "spUpdateGamerTag";

            SqlParameter[] myParameters = new SqlParameter[2];

            myParameters[0] = new SqlParameter("userID", UserID);
            myParameters[1] = new SqlParameter("lastName", gtag);

            int rows = myDBManager.executeNonQuery(myQuery, myParameters);
            return rows;
        }
        public int updateUserAddress(int UserID, string address)
        {
            DBManager myDBManager = new DBManager();
            string myQuery = "spUpdateAddress";

            SqlParameter[] myParameters = new SqlParameter[2];

            myParameters[0] = new SqlParameter("userID", UserID);
            myParameters[1] = new SqlParameter("lastName", address);

            int rows = myDBManager.executeNonQuery(myQuery, myParameters);
            return rows;
        }
        public int updateUserPhone(int UserID, string phone)
        {
            DBManager myDBManager = new DBManager();
            string myQuery = "spUpdatePhone";

            SqlParameter[] myParameters = new SqlParameter[2];

            myParameters[0] = new SqlParameter("userID", UserID);
            myParameters[1] = new SqlParameter("lastName", phone);

            int rows = myDBManager.executeNonQuery(myQuery, myParameters);
            return rows;
        }
        public int updateUserPayment(int UserID, string payinfo)
        {
            DBManager myDBManager = new DBManager();
            string myQuery = "spUpdatePayInfo";

            SqlParameter[] myParameters = new SqlParameter[2];

            myParameters[0] = new SqlParameter("userID", UserID);
            myParameters[1] = new SqlParameter("lastName", payinfo);

            int rows = myDBManager.executeNonQuery(myQuery, myParameters);
            return rows;
        }
        public int updateUserEmail(int UserID, string email)
        {
            DBManager myDBManager = new DBManager();
            string myQuery = "spUpdateEmail";

            SqlParameter[] myParameters = new SqlParameter[2];

            myParameters[0] = new SqlParameter("userID", UserID);
            myParameters[1] = new SqlParameter("email", email);

            int rows = myDBManager.executeNonQuery(myQuery, myParameters);
            return rows;
        }
        public int deleteUser(int UserID)
        {
            DBManager myDBManager = new DBManager();
            string myQuery = "spUpdateEmail";
            SqlParameter[] myParameters = new SqlParameter[1];

            myParameters[0] = new SqlParameter("userID", UserID);
            int rows = myDBManager.executeNonQuery(myQuery, myParameters);
            return rows;
        }
        public bool checkAdmin(string username)
        {
            DBManager myDBManager = new DBManager();
            string myQuery = "spCheckAdmin";
            SqlParameter[] myParameters = new SqlParameter[1];

            myParameters[0] = new SqlParameter("username", username);
            DataSet myDataSet = myDBManager.createDataSet(myQuery, myParameters);

            bool finalResult = false;

            if (myDataSet.Tables[0].Rows.Count > 0)
            {


                finalResult = Convert.ToBoolean(myDataSet.Tables[0].Rows[0]["isAdmin"]);
            }

            return finalResult;
        }
        public string getUserbySearch(string search)
        {
            DBManager myDBManager = new DBManager();
            string myQuery = "spSpecificUserByGamerTag";

            SqlParameter[] myParameters = new SqlParameter[1];

            myParameters[0] = new SqlParameter("gamerTag", search);



            DataSet myDataSet = myDBManager.createDataSet(myQuery, myParameters);

            string finalResult = "";

            for (int i = 0; i < myDataSet.Tables[0].Rows.Count; i++)
            {


                finalResult += myDataSet.Tables[0].Rows[i]["firstName"] + " " + myDataSet.Tables[0].Rows[i]["lastName"] + myDataSet.Tables[0].Rows[i]["gamerTag"] + " " +
                    myDataSet.Tables[0].Rows[i]["userID"] + " " + myDataSet.Tables[0].Rows[i]["userName"] + " " + myDataSet.Tables[0].Rows[i]["email"] + " " + myDataSet.Tables[0].Rows[i]["CurrencyPoints"] + " " + "<br>";
            }
            return finalResult;
        }
        public int updateCurrencyPoints(int UserID, int value)
        {
            DBManager myDBManager = new DBManager();
            string myQuery = "spUpdatePayInfo";

            SqlParameter[] myParameters = new SqlParameter[2];

            myParameters[0] = new SqlParameter("userID", UserID);
            myParameters[1] = new SqlParameter("CurrencyPoints", value);

            int rows = myDBManager.executeNonQuery(myQuery, myParameters);
            return rows;
        }
        public string selectWeapons()
        {
            DBManager myDBManager = new DBManager();
            string myQuery = "spSelectAllWeaponsXML";
            SqlParameter[] myParameters = new SqlParameter[1];
            DataSet myDataSet = myDBManager.createDataSet(myQuery);
            //myParameters[0] = new SqlParameter("userID", UserID);
            string finalresults = " ";

            finalresults = "<P>" + myDataSet.GetXml() + "</P>";

            return finalresults;
        }

        public Users()
        {



        }
    }

}