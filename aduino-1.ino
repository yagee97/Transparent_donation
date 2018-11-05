#include <WiFi.h>
#include <SPI.h>

char ssid[] = "AndroidHotspot7430";     //  Connected wifi
char pass[] = "0000";  // password of connected wifi
int status = WL_IDLE_STATUS;

WiFiServer server(80); // port no. 80 

void setup() {
  Serial.begin(9600); 
  
  // check the wifi shield
  if (WiFi.status() == WL_NO_SHIELD) {
    Serial.println("WiFi shield is connected yet"); 
    // else
    while(true);
  } 
  
 // Attempt connection 
  while ( status != WL_CONNECTED) { // while it become connected 
    Serial.print("Attempting to connect to WPA SSID: ");
    Serial.println(ssid);
    // Connect WPA/WAP2 Network 
    status = WiFi.begin(ssid, pass);

    delay(10000);
  }
   
  // print information of connected network and confirm msg if it is connected successful. 
  Serial.print("You're connected to the network");

  server.begin();
  printCurrentNet();
  printWifiData();

}

void loop() { 
  int ldrval = analogRead(A0); // Cds sensor's value
  // 방사 조도 1400–1600 kwh/ m2(서울 기준)
  int sun_value = map(Idrval,0,1024,1400,1600);

  WiFiClient client = server.available(); 
  if (client) {  
    Serial.println("new client");  
    boolean currentLineIsBlank = true;

    while (client.connected ()) { 
      if (client.available()) {
        char c = client.read();
        
        if (c == '\n' && currentLineIsBlank) {
          client.println("HTTP/1.1 200 OK");
          client.println("Content-Type: text/html");
          client.println("Connection: close");
          client.println("Refresh: 1"); // refresh the page 1 sec 
          client.println();
          client.println("<!DOCTYPE HTML>");
          client.println("<meta charset=utf-8/>");
          client.print("<meta name=view content=width=device-width, ");
          client.println("initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no />");
          client.println("<html>");
          client.println("<head>");  
          client.println("<title>Sun Sensor</title>");
          client.println("</head>");
          client.println("<h1>Sun Sensor</h1>");
          client.println("<div data-role=content>");
          client.print("CDS Sensor value : ");
          client.println(ldrval);  // print the value Cds sensor
          client.println("<br>");
          client.println("</div>");
          client.println("</body>");
          client.println("</html>");
          break;
        }
        if (c == '\n') { 
          currentLineIsBlank = true;
        }

        else if (c != '\r') {
          currentLineIsBlank = false;
        }
      }
    }
    delay(1);
    client.stop();
    Serial.println("client disonnected");
    // disconnect with client
  }
}

void printWifiData() {
  // print IP of WI-FI shield
  IPAddress ip = WiFi.localIP();
    Serial.print("IP Address: ");
  Serial.println(ip);
  Serial.println(ip);
  
  // print Mac Address
  byte mac[6];  
  WiFi.macAddress(mac);
  Serial.print("MAC address: ");
  Serial.print(mac[5],HEX);
  Serial.print(":");
  Serial.print(mac[4],HEX);
  Serial.print(":");
  Serial.print(mac[3],HEX);
  Serial.print(":");
  Serial.print(mac[2],HEX);
  Serial.print(":");
  Serial.print(mac[1],HEX);
  Serial.print(":");
  Serial.println(mac[0],HEX);
 
}

void printCurrentNet() {
  // print SSID of accessed network
  Serial.print("SSID: ");
  Serial.println(WiFi.SSID());

  // print MAC Address of accessed router
  byte bssid[6];
  WiFi.BSSID(bssid);    
  Serial.print("BSSID: ");
  Serial.print(bssid[5],HEX);
  Serial.print(":");
  Serial.print(bssid[4],HEX);
  Serial.print(":");
  Serial.print(bssid[3],HEX);
  Serial.print(":");
  Serial.print(bssid[2],HEX);
  Serial.print(":");
  Serial.print(bssid[1],HEX);
  Serial.print(":");
  Serial.println(bssid[0],HEX);

  // print signal strength.
  long rssi = WiFi.RSSI();
  Serial.print("signal strength (RSSI):");
  Serial.println(rssi);

  // print encryption type
  byte encryption = WiFi.encryptionType();
  Serial.print("Encryption Type:");
  Serial.println(encryption,HEX);
  Serial.println();
}

 

