using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Security.Cryptography;

public partial class Add_Location : System.Web.UI.Page
{
    int ID;
    String h1, h2, h3, h4, h5, h6, h7, h8, h9, h10;
    const int keySize = 512;
    string publicAndPrivateKey;
    string publicKey;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        autoid();
        Random rm = new Random();
        int rno = rm.Next(111111, 999999);
        TextBox5.Text = rno.ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        FileUpload1.SaveAs(Server.MapPath("~/images/upload/")+FileUpload1.FileName);
        string fpath = Server.MapPath("~/images/upload/") + FileUpload1.FileName;

        FileStream fs = new FileStream(fpath,FileMode.Open,FileAccess.ReadWrite);
        byte[] buffer = new byte[fs.Length];
        fs.Read(buffer, 0, (int)fs.Length);
        fs.Close();
        string fname = FileUpload1.FileName;

        RSAEncryption.GenerateKeys(keySize, out publicKey, out publicAndPrivateKey);
        string start = RSAEncryption.EncryptText(TextBox1.Text, keySize, publicKey);
        string destination = RSAEncryption.EncryptText(TextBox2.Text, keySize, publicKey);
        string poi1 = RSAEncryption.EncryptText(TextBox3.Text, keySize, publicKey);
        string poi2 = RSAEncryption.EncryptText(TextBox4.Text, keySize, publicKey);
        string poi3 = RSAEncryption.EncryptText(TextBox6.Text, keySize, publicKey);
        string poi4 = RSAEncryption.EncryptText(TextBox7.Text, keySize, publicKey);
        string skey = RSAEncryption.EncryptText(TextBox5.Text, keySize, publicKey);
        string photoname = RSAEncryption.EncryptText(fname, keySize, publicKey);

        
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into Location(LocID,City,Place,poi1,poi2,poi3,poi4,encpoi1,encpoi2,encpoi3,encpoi4,SecretKey,Photo,EncCity,EncPlace,Speed) values(@LocID,@City,@Place,@poi1,@poi2,@poi3,@poi4,@encpoi1,@encpoi2,@encpoi3,@encpoi4,@SecretKey,@Photo,@EncCity,@EncPlace,@Speed)", con);
     
        cmd.Parameters.AddWithValue("@LocID", ID);
        cmd.Parameters.AddWithValue("@City",TextBox1.Text);
        cmd.Parameters.AddWithValue("@Place", TextBox2.Text);
        cmd.Parameters.AddWithValue("@poi1", TextBox3.Text);

        cmd.Parameters.AddWithValue("@poi2", TextBox4.Text);
        cmd.Parameters.AddWithValue("@poi3", TextBox6.Text);
        cmd.Parameters.AddWithValue("@poi4", TextBox7.Text);
        cmd.Parameters.AddWithValue("@Speed",TextBox8.Text);
        cmd.Parameters.AddWithValue("@encpoi1", poi1);

        cmd.Parameters.AddWithValue("@encpoi2", poi2);
        cmd.Parameters.AddWithValue("@encpoi3", poi3);
        cmd.Parameters.AddWithValue("@encpoi4", poi4);

        cmd.Parameters.AddWithValue("@SecretKey", skey);

        cmd.Parameters.AddWithValue("@EncCity", start);

        cmd.Parameters.AddWithValue("@EncPlace", destination);

        cmd.Parameters.AddWithValue("@Photo",buffer);

       
        cmd.ExecuteNonQuery();
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
       
        TextBox6.Text = "";
        TextBox7.Text = "";
        TextBox8.Text = "";
        
        con.Close();

        Response.Write("<script>alert('Location details added successfully')</script>");
    }
    private void autoid()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select max(LocID) from Location ", con);
        object result = cmd.ExecuteScalar();
        
        if (result.GetType() != typeof(DBNull))
        {
            ID = Convert.ToInt32(result);
        }
        else
        {
            ID = 0;
        }

        ID = ID + 1;
        con.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
}

public static class RSAEncryption
{
    private static bool _optimalAsymmetricEncryptionPadding = false;

    public static void GenerateKeys(int keySize, out string publicKey, out string publicAndPrivateKey)
    {
        using (var provider = new RSACryptoServiceProvider(keySize))
        {
            publicKey = provider.ToXmlString(false);
            publicAndPrivateKey = provider.ToXmlString(true);
        }
    }

    public static string EncryptText(string text, int keySize, string publicKeyXml)
    {
        var encrypted = Encrypt(Encoding.UTF8.GetBytes(text), keySize, publicKeyXml);
        return Convert.ToBase64String(encrypted);
    }

    public static byte[] Encrypt(byte[] data, int keySize, string publicKeyXml)
    {
        if (data == null || data.Length == 0) throw new ArgumentException("Data are empty", "data");
        int maxLength = GetMaxDataLength(keySize);
        if (data.Length > maxLength) throw new ArgumentException(String.Format("Maximum data length is {0}", maxLength), "data");
        if (!IsKeySizeValid(keySize)) throw new ArgumentException("Key size is not valid", "keySize");
        if (String.IsNullOrEmpty(publicKeyXml)) throw new ArgumentException("Key is null or empty", "publicKeyXml");

        using (var provider = new RSACryptoServiceProvider(keySize))
        {
            provider.FromXmlString(publicKeyXml);
            return provider.Encrypt(data, _optimalAsymmetricEncryptionPadding);
        }
    }

    public static string DecryptText(string text, int keySize, string publicAndPrivateKeyXml)
    {
        var decrypted = Decrypt(Convert.FromBase64String(text), keySize, publicAndPrivateKeyXml);
        return Encoding.UTF8.GetString(decrypted);
    }

    public static byte[] Decrypt(byte[] data, int keySize, string publicAndPrivateKeyXml)
    {
        if (data == null || data.Length == 0) throw new ArgumentException("Data are empty", "data");
        if (!IsKeySizeValid(keySize)) throw new ArgumentException("Key size is not valid", "keySize");
        if (String.IsNullOrEmpty(publicAndPrivateKeyXml)) throw new ArgumentException("Key is null or empty", "publicAndPrivateKeyXml");

        using (var provider = new RSACryptoServiceProvider(keySize))
        {
            provider.FromXmlString(publicAndPrivateKeyXml);
            return provider.Decrypt(data, _optimalAsymmetricEncryptionPadding);
        }
    }

    public static int GetMaxDataLength(int keySize)
    {
        if (_optimalAsymmetricEncryptionPadding)
        {
            return ((keySize - 384) / 8) + 7;
        }
        return ((keySize - 384) / 8) + 37;
    }

    public static bool IsKeySizeValid(int keySize)
    {
        return keySize >= 384 &&
                keySize <= 16384 &&
                keySize % 8 == 0;
    }
}
