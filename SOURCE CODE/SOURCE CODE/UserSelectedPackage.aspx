<%@ Page Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="UserSelectedPackage.aspx.cs" Inherits="UserSelectedPackage" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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



    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:Panel ID="Panel1" runat="server" BorderStyle="Groove" BorderWidth="2px" 
        Height="1130px" BackColor="Gainsboro">
        <table style="width: 100%">
            <tr>
                <td>
                    &nbsp;</td>
                <td style="width: 283px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="width: 283px">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                        Font-Names="Simplified Arabic Fixed" Font-Size="X-Large" ForeColor="#0066FF" 
                        Text="Welcome!" Visible="False"></asp:Label>
                    &nbsp;
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                        Font-Names="Simplified Arabic Fixed" Font-Size="X-Large" 
                        ForeColor="#FF3300" Visible="False"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="width: 283px">
                    &nbsp;</td>
                <td>
                <%
                    string p1 = Request.QueryString["poi1"].ToString();
                    string p2 = Request.QueryString["poi2"].ToString();
                    string p3 = Request.QueryString["poi3"].ToString();
                    string p4 = Request.QueryString["poi4"].ToString();
                    
                     %>
                    &nbsp;</td>
                    <caption>
                        <select ID="waypoints" multiple style="display:none">
                            <option value="<%=p1 %>"><%=p1 %></option>
                            <option value="<%=p2 %>"><%=p2 %></option>
                            <option value="<%=p3 %>"><%=p3 %></option>
                            <option value="<%=p4 %>"><%=p4 %></option>
                        </select>
                </caption>
            </tr>
        </table>
        <asp:Panel ID="Panel2" runat="server" Height="497px">
            <table style="width: 100%">
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        &nbsp;</td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        &nbsp;</td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td colspan="3">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" 
                            Font-Names="Imprint MT Shadow" Font-Size="Medium" ForeColor="#993300" 
                            Text="Selected Tour Package!"></asp:Label>
                    </td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        &nbsp;</td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        &nbsp;</td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        <asp:Label ID="Label3" runat="server" Font-Size="X-Small" ForeColor="#666666" 
                            Text="FROM"></asp:Label>
                        &nbsp;
                        </td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        <asp:Label ID="Label4" runat="server" Font-Size="X-Small" ForeColor="#666666" 
                            Text="TO"></asp:Label>
                        &nbsp;
                        </td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        <asp:Label ID="Label17" runat="server" Font-Size="X-Small" ForeColor="#000099"></asp:Label>
                    </td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        <asp:Label ID="Label19" runat="server" Font-Size="X-Small" ForeColor="#000099"></asp:Label>
                    </td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        &nbsp;</td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        &nbsp;</td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        &nbsp;<asp:Label ID="Label28" runat="server" Font-Size="X-Small" ForeColor="#666666" 
                            Text="SEASON"></asp:Label>
                        </td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        <asp:Label ID="Label8" runat="server" Font-Size="X-Small" ForeColor="#666666" 
                            Text="POI 1"></asp:Label>
                        &nbsp;
                        </td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        <asp:Label ID="Label29" runat="server" Font-Size="X-Small" ForeColor="#000099"></asp:Label>
                    </td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        <asp:Label ID="Label21" runat="server" Font-Size="X-Small" ForeColor="#000099"></asp:Label>
                    </td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        &nbsp;</td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        &nbsp;</td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        <asp:Label ID="Label9" runat="server" Font-Size="X-Small" ForeColor="#666666" 
                            Text="POI 2"></asp:Label>
                        &nbsp;
                        </td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        <asp:Label ID="Label10" runat="server" Font-Size="X-Small" ForeColor="#666666" 
                            Text="POI 3"></asp:Label>
                        &nbsp;
                        </td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        <asp:Label ID="Label22" runat="server" Font-Size="X-Small" ForeColor="#000099"></asp:Label>
                    </td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        <asp:Label ID="Label23" runat="server" Font-Size="X-Small" ForeColor="#000099"></asp:Label>
                    </td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        &nbsp;</td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        &nbsp;</td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        <asp:Label ID="Label11" runat="server" Font-Size="X-Small" ForeColor="#666666" 
                            Text="POI 4"></asp:Label>
                        &nbsp;
                        </td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        <asp:Label ID="Label12" runat="server" Font-Size="X-Small" ForeColor="#666666" 
                            Text="DATE"></asp:Label>
                        &nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="TextBox8" ErrorMessage="Field Required" Font-Size="10px"></asp:RequiredFieldValidator>
                    </td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        <asp:Label ID="Label24" runat="server" Font-Size="X-Small" ForeColor="#000099"></asp:Label>
                    </td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        <asp:TextBox ID="TextBox8" runat="server" placeholder="ENTER DATE" 
                            style="text-align: center" Width="200px" Height="21px"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="TextBox8" TargetControlID="TextBox8">
                        </asp:CalendarExtender>
                    </td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        &nbsp;</td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        &nbsp;</td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px; height: 20px;">
                        </td>
                    <td style="width: 194px; height: 20px;">
                        <asp:Label ID="Label13" runat="server" Font-Size="X-Small" ForeColor="#666666" 
                            Text="TIME"></asp:Label>
                        &nbsp;
                        </td>
                    <td style="width: 17px; height: 20px;">
                        </td>
                    <td style="width: 218px; height: 20px;">
                        <asp:Label ID="Label14" runat="server" Font-Size="X-Small" ForeColor="#666666" 
                            Text="COST"></asp:Label>
                        &nbsp;
                        </td>
                    <td style="width: 62px; height: 20px;">
                        </td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        <asp:Label ID="Label25" runat="server" Font-Size="X-Small" ForeColor="#000099"></asp:Label>
                    </td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        <asp:Label ID="Label26" runat="server" Font-Size="X-Small" ForeColor="#000099"></asp:Label>
                    </td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        &nbsp;</td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        &nbsp;</td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        &nbsp;
                        </td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        &nbsp;</td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        &nbsp;</td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        <asp:Button ID="Button1" runat="server" BackColor="#006600" 
                            BorderColor="#CCFF99" BorderStyle="Ridge" BorderWidth="2px" Font-Size="Medium" 
                            ForeColor="#CCFFCC" Height="29px" onclick="Button1_Click" Text="Take Trip" 
                            Width="207px" />
                    </td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                      
                    </td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        &nbsp;</td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        &nbsp;</td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        <asp:Button ID="Button2" runat="server" BackColor="#000099" 
                            BorderColor="#CCFF99" BorderStyle="Ridge" BorderWidth="2px" Font-Size="Medium" 
                            ForeColor="#CCFFCC" Height="29px" onclick="Button2_Click" 
                            Text="*** Write a Review ***" Width="207px" />
                    </td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px">
                        &nbsp;</td>
                    <td style="width: 194px">
                        &nbsp;</td>
                    <td style="width: 17px">
                        &nbsp;</td>
                    <td style="width: 218px">
                        &nbsp;</td>
                    <td style="width: 62px">
                        &nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
        <table style="width: 100%">
            <tr>
                <td>
                    &nbsp;</td>
                <td style="width: 287px">
                    <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Names="Bodoni MT" 
                        Font-Size="Large" ForeColor="Blue" Text="Optimized Route Recommendation!"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <%
            string sval = Request.QueryString["from"].ToString();
            string eval = Request.QueryString["to"].ToString();           
            
             %>
        
        <table ID="control">
            <tr>
                <td style="width: 183px">
                    <table style="display:none">
                        <tr>
                            <td>
                                <input id="start" style="width: 115px" type="text" value="<%=sval %>" />
                                <input id="end" type="text" value="<%=eval %>" style="width: 116px" /></td>
                            
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 183px" valign="top">
                    <div id="map" style="height: 446px; width: 638px;">
                    </div>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
        </table>
         &nbsp;</div><script>
      function initMap() {
        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 6,
          center: {lat: 10.826, lng: 78.530}
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
        }, function(response, status) {
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
    </script><script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAdeWOHJWdj2SZy9nlVVxwFumnUHzeS92A&callback=initMap"></script>
    </asp:Panel>
</asp:Content>
