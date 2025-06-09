<%@ Page Language="C#" MasterPageFile="~/BS.master" AutoEventWireup="true" CodeFile="BSresponse.aspx.cs" Inherits="BSresponse" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" BorderStyle="Groove" BorderWidth="2px" 
    Height="431px">
    <table style="width: 100%; height: 433px;">
        <tr>
            <td style="height: 72px; width: 173px">
            </td>
            <td style="height: 72px; width: 503px">
                <table style="width: 100%">
                    <tr>
                        <td style="width: 100px">
                            &nbsp;</td>
                        <td style="width: 337px">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                                Font-Names="Franklin Gothic Demi Cond" Font-Size="X-Large" ForeColor="Maroon" 
                                Text="Forward admin Response to User!"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
            <td style="height: 72px">
            </td>
        </tr>
        <tr>
            <td style="height: 293px; width: 173px">
            </td>
            <td style="height: 293px; width: 503px">
                <asp:Panel ID="Panel2" runat="server" BorderStyle="Ridge" BorderWidth="2px" 
                    Height="292px" ScrollBars="Auto" Width="540px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                        CellPadding="4" DataSourceID="SqlDataSource1" GridLines="Horizontal" 
                        onrowcommand="GridView1_RowCommand" Width="547px">
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="LocID" HeaderText="LocID" SortExpression="LocID">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Place" HeaderText="Place" SortExpression="Place">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Username" HeaderText="Username" 
                                SortExpression="Username">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:ButtonField CommandName="Select" HeaderText="Forward" ShowHeader="True" 
                                Text="Forward to User">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="True" 
                                    ForeColor="#006600" />
                            </asp:ButtonField>
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:kNNCon %>" 
                        SelectCommand="SELECT [LocID], [City], [Place], [Username] FROM [UserQuery] WHERE ([Status] = @Status)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="RLBS" Name="Status" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
            </td>
            <td style="height: 293px">
            </td>
        </tr>
        <tr>
            <td style="width: 173px">
                &nbsp;</td>
            <td style="width: 503px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Panel>
</asp:Content>

