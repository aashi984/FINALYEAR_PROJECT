<%@ Page Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="UserViewLocation.aspx.cs" Inherits="UserViewLocation" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCEP3ZnAgNscRueu3P80YbhbiaQ-XBRkx0&callback=initMap"></script>
     <%--<script language="javascript" type="text/javascript">
    var directionsDisplay;
    var directionsService = new google.maps.DirectionsService();

    function InitializeMap() {
        directionsDisplay = new google.maps.DirectionsRenderer();
        var latlng = new google.maps.LatLng(-34.397, 150.644);
        var myOptions =
        {
            zoom: 8,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map"), myOptions);

        directionsDisplay.setMap(map);
        directionsDisplay.setPanel(document.getElementById('directionpanel'));

        var control = document.getElementById('control');
        control.style.display = 'block';

calcRoute();
    }



    function calcRoute() {

        var start = document.getElementById('startvalue').value;
        var end = document.getElementById('endvalue').value;
        var request = {
            origin: start,
            destination: end,
            travelMode: google.maps.DirectionsTravelMode.DRIVING
        };
        directionsService.route(request, function (response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                directionsDisplay.setDirections(response);
            }
        });

    }
    
    window.onload = InitializeMap;

    </script>--%>
     <script type="text/javascript">

         window.onload = function () {
             var mapOptions = {
                 center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
                 zoom: 8,
                 mapTypeId: google.maps.MapTypeId.ROADMAP
             };
             var infoWindow = new google.maps.InfoWindow();
             var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
             for (i = 0; i < markers.length; i++) {
                 var data = markers[i]
                 var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                 var marker = new google.maps.Marker({
                     position: myLatlng,
                     map: map,
                     title: data.title
                 });
                 (function (marker, data) {
                     google.maps.event.addListener(marker, "click", function (e) {
                         infoWindow.setContent(data.description);
                         infoWindow.open(map, marker);
                     });
                 })(marker, data);
             }
         }
    </script>
    <asp:Panel ID="Panel1" runat="server" BorderStyle="Groove" BorderWidth="2px" 
        Height="798px">
        <table style="width: 100%; height: 582px;">
            <tr>
                <td style="height: 46px; width: 141px;">
                </td>
                <td style="height: 46px; text-align: center; width: 441px">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                        Font-Names="Franklin Gothic Demi Cond" Font-Size="X-Large" ForeColor="Maroon" 
                        Text="View Location !"></asp:Label>
                </td>
                <td style="height: 46px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <%
                    string p1 = Session["poi1"].ToString();
                    string p2 = Session["poi2"].ToString();
                    string p3 = Session["poi3"].ToString();
                    string p4 = Session["poi4"].ToString();
                    
                     %>&nbsp;</td>
                <caption>
                    <select ID="waypoints" multiple style="display:none">
                        <option value="<%=p1 %>"><%=p1 %></option>
                        <option value="<%=p2 %>"><%=p2 %></option>
                        <option value="<%=p3 %>"><%=p3 %></option>
                        <option value="<%=p4 %>"><%=p4 %></option>
                    </select>
                </caption>
                <tr>
                    <td style="height: 62px; width: 141px;">
                    </td>
                    <td style="width: 441px; height: 62px">
                        <asp:Panel ID="Panel2" runat="server" Height="186px" Width="542px">
                            <table style="width: 115%; height: 132px;">
                                <tr>
                                    <td style="width: 24px">
                                        &nbsp;</td>
                                    <td style="width: 141px">
                                        &nbsp;</td>
                                    <td style="width: 19px">
                                        &nbsp;</td>
                                    <td style="width: 199px">
                                        <asp:Label ID="Label15" runat="server" Visible="False"></asp:Label>
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
                                            Text="Your Place"></asp:Label>
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
                                        <asp:TextBox ID="TextBox7" runat="server" CssClass="txtstyle" Height="21px" 
                                            Width="164px"></asp:TextBox>
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
                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" 
                                            Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" 
                                            Text="Security Key"></asp:Label>
                                    </td>
                                    <td style="width: 19px">
                                        <asp:Label ID="Label10" runat="server" Font-Bold="True" 
                                            Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text=":"></asp:Label>
                                    </td>
                                    <td style="width: 199px">
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="txtstyle" Height="21px" 
                                            placeholder="Enter Secret Key" Width="164px"></asp:TextBox>
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
                                <tr>
                                    <td style="width: 24px">
                                        &nbsp;</td>
                                    <td style="width: 141px">
                                        &nbsp;</td>
                                    <td style="width: 19px">
                                        &nbsp;</td>
                                    <td style="width: 199px">
                                        <asp:Button ID="Button1" runat="server" CssClass="submit2" 
                                            onclick="Button1_Click" Text="Submit" Width="84px" />
                                        &nbsp;&nbsp;
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
                    <td style="height: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 141px">
                        &nbsp;</td>
                    <td style="width: 441px">
                        <asp:Panel ID="Panel3" runat="server" Height="522px" Visible="False" 
                            Width="544px">
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 79px">
                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" 
                                            Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text="POI1"></asp:Label>
                                    </td>
                                    <td style="width: 169px">
                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="txtstyle" Height="21px" 
                                            Width="164px"></asp:TextBox>
                                    </td>
                                    <td style="width: 103px">
                                        <asp:Label ID="Label12" runat="server" Font-Bold="True" 
                                            Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text="POI2"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="txtstyle" Height="21px" 
                                            Width="164px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 79px">
                                        &nbsp;</td>
                                    <td style="width: 169px">
                                        &nbsp;</td>
                                    <td style="width: 103px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 79px">
                                        <asp:Label ID="Label13" runat="server" Font-Bold="True" 
                                            Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text="POI3"></asp:Label>
                                    </td>
                                    <td style="width: 169px">
                                        <asp:TextBox ID="TextBox8" runat="server" CssClass="txtstyle" Height="21px" 
                                            Width="164px"></asp:TextBox>
                                    </td>
                                    <td style="width: 103px">
                                        <asp:Label ID="Label14" runat="server" Font-Bold="True" 
                                            Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text="POI 4"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox9" runat="server" CssClass="txtstyle" Height="21px" 
                                            Width="164px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 79px">
                                        &nbsp;</td>
                                    <td style="width: 169px">
                                        &nbsp;</td>
                                    <td style="width: 103px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <%
            string sval = Session["City"].ToString();
            string sval1 = Session["Speed"].ToString();
            string eval = Request.QueryString["Place"].ToString();           
            
             %>
                            <table ID="control">
                                <tr>
                                    <td style="width: 183px">
                                        <table style="display:none">
                                            <tr>
                                                <td>
                                                    <input id="start" style="width: 115px" type="text" value="<%=sval %>" />
                                                     <input id="speed" style="width: 115px" type="text" value="<%=sval1 %>" />
                                                    <input id="end" type="text" value="<%=eval %>" style="width: 116px" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 183px" valign="top">
                                        <div ID="map" style="height: 446px; width: 638px;">
                                        </div>
                                    </td>
                                    <td valign="top">
                                        &nbsp;</td>
                                </tr>
                            </table>
                            &nbsp;</div>
                            <script>

                         function initMap() {
                             var directionsService = new google.maps.DirectionsService;
                             var directionsDisplay = new google.maps.DirectionsRenderer;
                             var map = new google.maps.Map(document.getElementById('map'), {
                                 zoom: 6,
                                 center: { lat: 10.826, lng: 78.530 }
                             });
                             directionsDisplay.setMap(map);
                             calculateAndDisplayRoute(directionsService, directionsDisplay);


                         }

                         function calculateAndDisplayRoute(directionsService, directionsDisplay) {
                             var waypts = [];
                             var checkboxArray = document.getElementById('waypoints');
                             for (var i = 0; i < checkboxArray.length; i++) {
                                 waypts.push({
                                     location: checkboxArray[i].value,
                                     stopover: true
                                 });

                             }

                             directionsService.route({
                                 origin: document.getElementById('start').value,
                                 destination: document.getElementById('end').value,
                               
                                 waypoints: waypts,
                                 optimizeWaypoints: true,
                                 travelMode: 'DRIVING'
                             }, function (response, status) {
                                 if (status === 'OK') {
                                     directionsDisplay.setDirections(response);
                                     var route = response.routes[0];
                                     var summaryPanel = document.getElementById('directions-panel');
                                     summaryPanel.innerHTML = '';
                                     // For each route, display summary information.
                                     for (var i = 0; i < route.legs.length; i++) {
                                         var routeSegment = i + 1;
                                         summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment +
                  '</b><br>';
                                         summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
                                         summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
                                         summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
                                     }
                                 } else {
                                     window.alert('Directions request failed due to ' + status);
                                 }
                             });
                         }
    </script><script 
                                src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAdeWOHJWdj2SZy9nlVVxwFumnUHzeS92A&amp;callback=initMap" 
                                type="text/javascript">
</script>
                        </asp:Panel>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

