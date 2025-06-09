<%@ Page Language="C#" MasterPageFile="~/LBS.master" AutoEventWireup="true" CodeFile="Deleteloc.aspx.cs" Inherits="Deleteloc" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" BorderStyle="Groove" BorderWidth="2px" 
    Height="431px">
    <table style="width: 100%; height: 433px;">
        <tr>
            <td style="height: 72px; width: 150px">
            </td>
            <td style="height: 72px; width: 503px">
                <table style="width: 100%">
                    <tr>
                        <td style="width: 100px">
                            &nbsp;</td>
                        <td style="width: 337px">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                                Font-Names="Franklin Gothic Demi Cond" Font-Size="X-Large" ForeColor="Maroon" 
                                Text="View Doctor Request!"></asp:Label>
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
            <td style="height: 293px; width: 150px">
            </td>
            <td style="height: 293px; width: 503px">
                <asp:Panel ID="Panel2" runat="server" BorderStyle="Ridge" BorderWidth="2px" 
                    Height="292px" ScrollBars="Auto" Width="578px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="4" DataSourceID="SqlDataSource1" 
                        onrowcommand="GridView1_RowCommand" Width="577px">
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="LocID">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PatientEmail" HeaderText="Patient Email" SortExpression="City">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DoctorEmail" HeaderText="Doctor Email" SortExpression="Place">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                           
                            
                            <asp:ButtonField CommandName="Select" HeaderText="Request" ShowHeader="True" 
                                Text="Send">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="True" 
                                    ForeColor="Blue" />
                            </asp:ButtonField>
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:kNNCon %>" 
                        SelectCommand="SELECT [ID], [PatientEmail], [DoctorEmail] FROM [AccessRequests] ">
                        
                    </asp:SqlDataSource>
                </asp:Panel>
            </td>
            <td style="height: 293px">
            </td>
        </tr>
        <tr>
            <td style="width: 150px">
                &nbsp;</td>
            <td style="width: 503px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Panel>
</asp:Content>

