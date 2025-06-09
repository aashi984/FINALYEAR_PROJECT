<%@ Page Language="C#" MasterPageFile="~/LBS.master" AutoEventWireup="true" CodeFile="Add Location.aspx.cs" Inherits="Add_Location" Title="Untitled Page" %>

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
                        Text="Add Location !"></asp:Label>
                </td>
                <td style="height: 78px">
                </td>
            </tr>
            <tr>
                <td style="height: 397px">
                </td>
                <td style="width: 441px; height: 397px">
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
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" 
                                        Text="Source"></asp:Label>
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
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" 
                                        Text="Destination"></asp:Label>
                                </td>
                                <td style="width: 19px">
                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text=":"></asp:Label>
                                </td>
                                <td style="width: 199px">
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="txtstyle" Height="21px" 
                                        Width="164px"></asp:TextBox>
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
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" 
                                        Text="POI1"></asp:Label>
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
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 54px">
                                    &nbsp;</td>
                                <td style="width: 110px">
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" 
                                        Text="POI2"></asp:Label>
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
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 54px">
                                    &nbsp;</td>
                                <td style="width: 110px">
                                    <asp:Label ID="Label14" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" 
                                        Text="POI3"></asp:Label>
                                </td>
                                <td style="width: 19px">
                                    <asp:Label ID="Label15" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text=":"></asp:Label>
                                </td>
                                <td style="width: 199px">
                                    <asp:TextBox ID="TextBox6" runat="server" CssClass="txtstyle" Height="21px" 
                                        Width="164px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
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
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 54px">
                                    &nbsp;</td>
                                <td style="width: 110px">
                                    <asp:Label ID="Label16" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" 
                                        Text="POI4"></asp:Label>
                                </td>
                                <td style="width: 19px">
                                    <asp:Label ID="Label17" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text=":"></asp:Label>
                                </td>
                                <td style="width: 199px">
                                    <asp:TextBox ID="TextBox7" runat="server" CssClass="txtstyle" Height="21px" 
                                        Width="164px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
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
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 54px">
                                    &nbsp;</td>
                                <td style="width: 110px">
                                    <asp:Label ID="Label18" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" 
                                        Text="Distance in Km"></asp:Label>
                                </td>
                                <td style="width: 19px">
                                    <asp:Label ID="Label19" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text=":"></asp:Label>
                                </td>
                                <td style="width: 199px">
                                    <asp:TextBox ID="TextBox8" runat="server" CssClass="txtstyle" Height="21px" 
                                        Width="164px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
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
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 54px">
                                    &nbsp;</td>
                                <td style="width: 110px">
                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" 
                                        Text="Secret Key"></asp:Label>
                                </td>
                                <td style="width: 19px">
                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text=":"></asp:Label>
                                </td>
                                <td style="width: 199px">
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="txtstyle" Height="21px" 
                                        Width="164px"></asp:TextBox>
                                    
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
                                        Text="Upload Image"></asp:Label>
                                </td>
                                <td style="width: 19px">
                                    <asp:Label ID="Label13" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text=":"></asp:Label>
                                </td>
                                <td style="width: 199px">
                                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="txtstyle" 
                                        Width="168px" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                        ControlToValidate="FileUpload1" ErrorMessage="*" Font-Size="Medium"></asp:RequiredFieldValidator>
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
                <td style="height: 397px">
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="width: 441px">
                    
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

