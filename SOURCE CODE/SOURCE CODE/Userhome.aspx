<%@ Page Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Userhome.aspx.cs" Inherits="Userhome" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" BorderStyle="Groove" BorderWidth="2px" 
        Height="533px">
        <table style="width: 100%; height: 527px;">
            <tr>
                <td>
                    &nbsp;</td>
                <td style="width: 329px">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                        Font-Names="Iskoola Pota" Font-Size="X-Large" ForeColor="Fuchsia" 
                        Text="Welcome !"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                        Font-Names="Iskoola Pota" Font-Size="X-Large" ForeColor="#003300"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="height: 49px">
                </td>
                <td style="height: 49px; width: 329px">
                </td>
                <td style="height: 49px">
                </td>
            </tr>
            <tr>
                <td style="height: 317px">
                </td>
                <td style="width: 329px; height: 317px">
                    <asp:Image ID="Image1" runat="server" Height="296px" ImageUrl="~/images/123.jpg" 
                        Width="413px" />
                </td>
                <td style="height: 317px">
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="width: 329px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="width: 329px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="width: 329px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

