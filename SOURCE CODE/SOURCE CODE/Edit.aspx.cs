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

public partial class Edit : System.Web.UI.Page
{
    int ID;
    String h1, h2, h3, h4, h5, h6, h7, h8, h9, h10,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r;
    const int keySize = 512;
    string publicAndPrivateKey;
    string publicKey;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        a = Session["LocID"].ToString();
        b = Session["City"].ToString();
        c = Session["Place"].ToString();
        d = Session["Speed"].ToString();

        con.Open();
        SqlDataAdapter sq = new SqlDataAdapter("select * from Location where LocID='" + a + "' and City='" + b + "' and Place='" +c + "' and Speed='" +d + "'", con);
        DataSet ds = new DataSet();
        sq.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            f = ds.Tables[0].Rows[0]["poi1"].ToString();
            g = ds.Tables[0].Rows[0]["poi2"].ToString();
            h = ds.Tables[0].Rows[0]["poi3"].ToString();
            i = ds.Tables[0].Rows[0]["poi4"].ToString();
            q = ds.Tables[0].Rows[0]["SecretKey"].ToString();
            r = ds.Tables[0].Rows[0]["Photo"].ToString();

        }
        con.Close();
        TextBox1.Text = b;
        TextBox2.Text = c;
        
        TextBox3.Text = f;
        TextBox4.Text = g;
        TextBox6.Text = h;
        TextBox7.Text = i;
        TextBox8.Text = d;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        j = TextBox5.Text;
        k = TextBox9.Text;
        l = TextBox10.Text;
        m = TextBox11.Text;
        n = TextBox12.Text;
        o = TextBox13.Text;
        p = TextBox14.Text;

        RSAEncryption.GenerateKeys(keySize, out publicKey, out publicAndPrivateKey);
        string start = RSAEncryption.EncryptText(j, keySize, publicKey);
        string destination = RSAEncryption.EncryptText(k, keySize, publicKey);
        string poi1 = RSAEncryption.EncryptText(l, keySize, publicKey);
        string poi2 = RSAEncryption.EncryptText(m, keySize, publicKey);
        string poi3 = RSAEncryption.EncryptText(n, keySize, publicKey);
        string poi4 = RSAEncryption.EncryptText(o, keySize, publicKey);
        string speed = RSAEncryption.EncryptText(p, keySize, publicKey);



        con.Open();
        SqlCommand cmd1 = new SqlCommand("update Location set LocID=@LocID,City=@City,Place=@Place,poi1=@poi1,poi2=@poi2,poi3=@poi3,poi4=@poi4,encpoi1=@encpoi1,encpoi2=@encpoi2,encpoi3=@encpoi3,encpoi4=@encpoi4,EncCity=@EncCity,EncPlace=@EncPlace,Speed=@Speed  where LocID='" + a + "' and City='" + b + "' and Place='" + c + "' and Speed='" + d + "'", con);
        cmd1.Parameters.AddWithValue("@LocID", a);
        cmd1.Parameters.AddWithValue("@City", b);
        cmd1.Parameters.AddWithValue("@Place", c);
        cmd1.Parameters.AddWithValue("@poi1", l);
        cmd1.Parameters.AddWithValue("@poi2", m);
        cmd1.Parameters.AddWithValue("@poi3", n);
        cmd1.Parameters.AddWithValue("@poi4", o);
        cmd1.Parameters.AddWithValue("@encpoi1", poi1);
        cmd1.Parameters.AddWithValue("@encpoi2", poi2);
        cmd1.Parameters.AddWithValue("@encpoi3", poi3);
        cmd1.Parameters.AddWithValue("@encpoi4", poi4);
        
      
        cmd1.Parameters.AddWithValue("@EncCity", start);
        cmd1.Parameters.AddWithValue("@EncPlace", destination);
        cmd1.Parameters.AddWithValue("@Speed", p);

        cmd1.ExecuteNonQuery();
        
        con.Close();

       
        Response.Write("<script>alert('Location details updated successfully')</script>");
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
