<%@ Page Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="UserQuery.aspx.cs" Inherits="UserQuery" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" BorderStyle="Groove" BorderWidth="2px" 
        Height="624px">       


        <table style="width: 100%; height: 582px;">
            <tr>
                <td style="height: 46px">
                </td>
                <td style="height: 46px; text-align: center; width: 441px">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                        Font-Names="Franklin Gothic Demi Cond" Font-Size="X-Large" ForeColor="Maroon" 
                        Text="Search Location !"></asp:Label>
                </td>
                <td style="height: 46px">
                </td>
            </tr>
            <tr>
                <td style="height: 90px">
                </td>
                <td style="width: 441px; height: 90px">
                    <asp:Panel ID="Panel2" runat="server" Height="138px">
                        <table style="width: 115%; height: 132px;">
                            <tr>
                                <td style="width: 24px">
                                    &nbsp;</td>
                                <td style="width: 141px">
                                    &nbsp;</td>
                                <td style="width: 19px">
                                    &nbsp;</td>
                                <td style="width: 199px">
                                    <asp:Label ID="Label9" runat="server" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 24px">
                                    &nbsp;</td>
                                <td style="width: 141px">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" 
                                        Text="Enter the Location"></asp:Label>
                                </td>
                                <td style="width: 19px">
                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text=":"></asp:Label>
                                </td>
                                <td style="width: 199px">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="txtstyle" Height="21px" 
                                        Width="164px" placeholder="Search Location..."></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="txtstyle" Height="21px" 
                                        placeholder="Search Location..." Width="164px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 24px">
                                    &nbsp;</td>
                                <td style="width: 141px">
                                    &nbsp;</td>
                                <td style="width: 19px">
                                    &nbsp;</td>
                                <td style="width: 199px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 24px">
                                    &nbsp;</td>
                                <td style="width: 141px">
                                    &nbsp;</td>
                                <td style="width: 19px">
                                    &nbsp;</td>
                                <td style="width: 199px">
                                    &nbsp;&nbsp;
                                    <asp:Button ID="Button4" runat="server" CssClass="submit2" 
                                        onclick="Button1_Click" Text="Search" Width="78px" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 24px">
                                    &nbsp;</td>
                                <td style="width: 141px">
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
                <td style="height: 90px">
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="width: 441px">
                    <asp:Panel ID="Panel3" runat="server" Height="379px" Visible="False" 
                        Width="506px" BorderStyle="Ridge" BorderWidth="2px" ScrollBars="Auto">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                            CellPadding="3" CellSpacing="2" 
                            Width="503px" onrowcommand="GridView1_RowCommand">
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <Columns>
                                <asp:BoundField DataField="LocID" HeaderText="LocID" SortExpression="LocID">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="City" HeaderText="City" SortExpression="EncCity">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Place" HeaderText="Place" 
                                    SortExpression="EncPlace">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                 <asp:BoundField DataField="Speed" HeaderText="Distance" 
                                    SortExpression="EncPlace">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="encpoi1" HeaderText="Address" 
                                    SortExpression="EncAddress">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="encpoi2" HeaderText="Description" 
                                    SortExpression="EncDesc">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                

                                <asp:ButtonField CommandName="Select" HeaderText="View Location" 
                                    ShowHeader="True" Text="View Place">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle Font-Bold="True" ForeColor="Blue" HorizontalAlign="Center" 
                                        VerticalAlign="Middle" />
                                </asp:ButtonField>
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>

                        
                        <br />

                        
                        <br />
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" onrowcommand="GridView2_RowCommand" Width="503px">
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <Columns>
                                <asp:BoundField DataField="LocID" HeaderText="LocID" SortExpression="LocID">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="City" HeaderText="City" SortExpression="EncCity">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Place" HeaderText="Place" SortExpression="EncPlace">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Speed" HeaderText="Distance" SortExpression="EncPlace">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="encpoi1" HeaderText="Address" SortExpression="EncAddress">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="encpoi2" HeaderText="Description" SortExpression="EncDesc">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:ButtonField CommandName="Select" HeaderText="View Location" ShowHeader="True" Text="View Place">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Font-Bold="True" ForeColor="Blue" HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:ButtonField>
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>

                        
                        <br />

                        
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

