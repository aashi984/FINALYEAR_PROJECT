<%@ Page Language="C#" MasterPageFile="~/LBS.master" AutoEventWireup="true" CodeFile="LocationDetails.aspx.cs" Inherits="LocationDetails" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" BorderStyle="Groove" BorderWidth="2px" 
        Height="624px">
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAdeWOHJWdj2SZy9nlVVxwFumnUHzeS92A&callback=initMap"></script>
<script type="text/javascript">


   
    var markers = [
        {
            "title": 'Puducherry',
            "lat": '11.9363045',
            "lng": '79.778142',
            "description": 'Pondicherry is a Union Territory of India.'
        }
    ];
    window.onload = function () {

        var mapOptions = {
            center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
            zoom: 4,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var infoWindow = new google.maps.InfoWindow();
        var latlngbounds = new google.maps.LatLngBounds();
        var geocoder = geocoder = new google.maps.Geocoder();
        var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
        for (var i = 0; i < markers.length; i++) {
            var data = markers[i]
            var myLatlng = new google.maps.LatLng(data.lat, data.lng);
            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: data.title,
                draggable: true,
                animation: google.maps.Animation.DROP
            });
            (function (marker, data) {
                google.maps.event.addListener(marker, "click", function (e) {
                    infoWindow.setContent(data.description);
                    infoWindow.open(map, marker);
                });
                google.maps.event.addListener(marker, "dragend", function (e) {
                    var lat, lng, address;
                    geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            lat = marker.getPosition().lat();
                            lng = marker.getPosition().lng();
                            address = results[0].formatted_address;
                            document.getElementById("latTxt").value = lat;
                            document.getElementById("lngTxt").value = lng;                            
                            //alert("Latitude: " + lat + "\nLongitude: " + lng + "\nAddress: " + address);
                        }
                    });
                });
            })(marker, data);
            latlngbounds.extend(marker.position);
        }
        var bounds = new google.maps.LatLngBounds();
        map.setCenter(latlngbounds.getCenter());
        map.fitBounds(latlngbounds);
    }
   
    
</script>

        <table style="width: 100%; height: 582px;" >
            <tr>
                <td style="height: 46px">
                </td>
                <td style="height: 46px; text-align: center; width: 441px">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                        Font-Names="Franklin Gothic Demi Cond" Font-Size="X-Large" ForeColor="Maroon" 
                        Text="Find Location !"></asp:Label>
                </td>
                <td style="height: 46px">
                </td>
            </tr>
            <tr>
                <td style="height: 329px">
                </td>
                <td style="width: 441px; height: 329px">
                    <div id="dvMap" style="width: 500px; height: 350px">
</div>
                </td>
                <td style="height: 329px">
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="width: 441px">
                    <asp:Panel ID="Panel2" runat="server" Height="212px">
                        <table style="width: 100%; height: 186px;">
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
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text="Latitude"></asp:Label>
                                </td>
                                <td style="width: 19px">
                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text=":"></asp:Label>
                                </td>
                                <td style="width: 199px">
                                    <input id="latTxt" class="txtstyle" name="Latitude" type="text"/></td>
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
                            <tr>
                                <td style="width: 54px">
                                    &nbsp;</td>
                                <td style="width: 110px">
                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" 
                                        Text="Longitude"></asp:Label>
                                </td>
                                <td style="width: 19px">
                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" 
                                        Font-Names="Iskoola Pota" Font-Size="Medium" ForeColor="Yellow" Text=":"></asp:Label>
                                </td>
                                <td style="width: 199px">
                                    <input ID="lngTxt" class="txtstyle" name="Longitude" type="text" /></td>
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
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;</td>
            </tr>           
        </table>
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
    </script><script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAdeWOHJWdj2SZy9nlVVxwFumnUHzeS92A&callback=initMap"></script>
    </asp:Panel>
 
    <input id="addressinput" style="width: 75px; display:none" type="text" value="Chennai"  />
</asp:Content>

