<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" BorderStyle="Groove" BorderWidth="2px" 
        Height="582px">
        <table style="width: 100%; height: 582px;">
            <tr>
                <td style="height: 78px">
                </td>
                <td style="height: 78px; text-align: center; width: 441px">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                        Font-Names="Franklin Gothic Demi Cond" Font-Size="X-Large" ForeColor="Maroon" 
                        Text="Medical Server Registration !"></asp:Label>
                </td>
                <td style="height: 78px">
                </td>
            </tr>
            <tr>
                <td style="height: 412px">
                </td>
                <td style="width: 441px; height: 412px">
                    <asp:Panel ID="Panel2" runat="server" BorderStyle="Ridge" BorderWidth="2px" 
                        Height="396px" Width="440px">
                        <table style="width: 100%; height: 397px;">
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
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text="Username"></asp:Label>
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
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text="Email ID"></asp:Label>
                                </td>
                                <td style="width: 19px">
                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text=":"></asp:Label>
                                </td>
                                <td style="width: 199px">
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="txtstyle" Height="21px" 
                                        Width="164px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="TextBox3" ErrorMessage="*" Font-Size="Medium"></asp:RequiredFieldValidator>
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
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ControlToValidate="TextBox3" ErrorMessage="Email is not valid" 
                                        ForeColor="#FF3300" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 54px">
                                    &nbsp;</td>
                                <td style="width: 110px">
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" 
                                        Text="Mobile no"></asp:Label>
                                </td>
                                <td style="width: 19px">
                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text=":"></asp:Label>
                                </td>
                                <td style="width: 199px">
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="txtstyle" Height="21px" 
                                        Width="164px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="TextBox4" ErrorMessage="*" Font-Size="Medium"></asp:RequiredFieldValidator>
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
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                        ControlToValidate="TextBox4" ErrorMessage="Mobile no is not valid" 
                                        ForeColor="#FF3300" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 54px">
                                    &nbsp;</td>
                                <td style="width: 110px">
                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" 
                                        Text="Date of Birth"></asp:Label>
                                </td>
                                <td style="width: 19px">
                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text=":"></asp:Label>
                                </td>
                                <td style="width: 199px">
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="txtstyle" Height="21px" 
                                        Width="164px"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                                        TargetControlID="TextBox5" PopupButtonID="TextBox5" PopupPosition="Right">
                                    </asp:CalendarExtender>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ControlToValidate="TextBox5" ErrorMessage="*" Font-Size="Medium"></asp:RequiredFieldValidator>
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
                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" 
                                        Text="Your City"></asp:Label>
                                </td>
                                <td style="width: 19px">
                                    <asp:Label ID="Label13" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text=":"></asp:Label>
                                </td>
                                <td style="width: 199px">
                                    <asp:TextBox ID="TextBox6" runat="server" CssClass="txtstyle" Height="21px" 
                                        Width="164px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                        ControlToValidate="TextBox6" ErrorMessage="*" Font-Size="Medium"></asp:RequiredFieldValidator>
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
                                    <asp:Button ID="Button1" runat="server" CssClass="submit2" Text="Submit" 
                                        Width="78px" onclick="Button1_Click" />
                                    &nbsp;&nbsp;
                                    <asp:Button ID="Button2" runat="server" CssClass="submit2" Text="Reset" 
                                        Width="78px" CausesValidation="False" onclick="Button2_Click" />
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
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td style="height: 412px">
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="width: 441px">
                    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </asp:ToolkitScriptManager>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

