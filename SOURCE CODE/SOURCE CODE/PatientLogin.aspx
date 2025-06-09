<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="PatientLogin.aspx.cs" Inherits="PatientLogin" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" BorderStyle="Groove" BorderWidth="2px" 
        Height="375px">
        <table style="width: 100%; height: 373px;">
            <tr>
                <td style="height: 78px">
                </td>
                <td style="height: 78px; text-align: center; width: 441px">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                        Font-Names="Franklin Gothic Demi Cond" Font-Size="X-Large" ForeColor="Maroon" 
                        Text="Patient Login !"></asp:Label>
                </td>
                <td style="height: 78px">
                </td>
            </tr>
            <tr>
                <td style="height: 227px">
                </td>
                <td style="width: 441px; height: 227px">
                    <asp:Panel ID="Panel2" runat="server" BorderStyle="Ridge" BorderWidth="2px" 
                        Height="211px" Width="440px">
                        <table style="width: 100%; height: 212px;">
                            <tr>
                                <td style="width: 54px">
                                    &nbsp;</td>
                                <td style="width: 110px">
                                    &nbsp;</td>
                                <td style="width: 19px">
                                    &nbsp;</td>
                                <td style="width: 199px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 54px">
                                    &nbsp;</td>
                                <td style="width: 110px">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text="Email"></asp:Label>
                                </td>
                                <td style="width: 19px">
                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text=":"></asp:Label>
                                </td>
                                <td style="width: 199px">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="txtstyle" Height="21px" 
                                        Width="164px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="TextBox1" ErrorMessage="*" Font-Size="Medium"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 54px">
                                    &nbsp;</td>
                                <td style="width: 110px">
                                    &nbsp;</td>
                                <td style="width: 19px">
                                    &nbsp;</td>
                                <td style="width: 199px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 54px">
                                    &nbsp;</td>
                                <td style="width: 110px">
                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text="Password"></asp:Label>
                                </td>
                                <td style="width: 19px">
                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text=":"></asp:Label>
                                </td>
                                <td style="width: 199px">
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="txtstyle" Height="21px" 
                                        TextMode="Password" Width="164px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="TextBox2" ErrorMessage="*" Font-Size="Medium"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 54px">
                                    &nbsp;</td>
                                <td style="width: 110px">
                                    &nbsp;</td>
                                <td style="width: 19px">
                                    &nbsp;</td>
                                <td style="width: 199px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                               <tr>
                                <td style="width: 54px">
                                    &nbsp;</td>
                                <td style="width: 110px">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text="OTP"></asp:Label>
                                </td>
                                <td style="width: 19px">
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text=":"></asp:Label>
                                </td>
                                <td style="width: 199px">
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="txtstyle" Height="21px" 
                                        TextMode="Password" Width="164px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="TextBox2" ErrorMessage="*" Font-Size="Medium"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 54px">
                                    &nbsp;</td>
                                <td style="width: 110px">
                                    &nbsp;</td>
                                <td style="width: 19px">
                                    &nbsp;</td>
                                <td style="width: 199px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 54px">
                                    &nbsp;</td>
                                <td style="width: 110px">
                                    &nbsp;</td>
                                <td style="width: 19px">
                                    &nbsp;</td>
                                <td style="width: 199px">
                                    <asp:Button ID="Button1" runat="server" CssClass="submit2" 
                                        onclick="Button1_Click" Text="Submit" Width="78px" />
                                    &nbsp;&nbsp;
                                    <asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                        CssClass="submit2" onclick="Button2_Click" Text="Reset" Width="78px" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 54px">
                                    &nbsp;</td>
                                <td style="width: 110px">
                                    &nbsp;</td>
                                <td style="width: 19px">
                                    &nbsp;</td>
                                <td style="width: 199px">
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                        ControlToValidate="TextBox2" ErrorMessage="Invalid Login" ForeColor="#FF3300" 
                                        onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td style="height: 227px">
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="width: 441px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

