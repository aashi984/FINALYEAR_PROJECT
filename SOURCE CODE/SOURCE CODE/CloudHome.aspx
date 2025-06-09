<%@ Page Language="C#" MasterPageFile="~/HOME1.master" AutoEventWireup="true" CodeFile="CloudHome.aspx.cs" Inherits="CloudHome" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" BorderStyle="Groove" BorderWidth="2px" 
        Height="375px">
       <table style="width: 100%; height: 373px;">
            <tr>
                <td style="height: 78px"></td>
                <td style="height: 78px; text-align: center; width: 441px">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                        Font-Names="Franklin Gothic Demi Cond" Font-Size="X-Large" 
                        ForeColor="Maroon" Text="Welcome Cloud !"></asp:Label>
                </td>
                <td style="height: 78px"></td>
            </tr>

            <tr>
                <td style="height: 227px"></td>
                <td style="width: 441px; height: 227px; text-align: center;">
                    <!-- Use asp:Image to load image from server -->
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/123.jpg" 
                        Width="400px" Height="400px" AlternateText="Welcome Image" />
                    
                    <!-- OR use plain HTML -->
                    <!-- <img src="Images/cloud_welcome.png" alt="Welcome Image" width="200" height="200" /> -->
                </td>
                <td style="height: 227px"></td>
            </tr>
        </table>
                      
    </asp:Panel>
</asp:Content>

