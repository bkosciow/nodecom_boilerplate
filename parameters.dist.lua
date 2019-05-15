_WIFI_APS = {
    {["ssid"]="bubus", ["pwd"]="whoknowsme"},
    {["ssid"]="bubus1", ["pwd"]="whoknowsme1"}
}
PROTOCOL = "iot:1"
PROTOCOL_ALLOW_UNENCRYPTED  = true
PORT = 5053
CHANNELS = {2, 3, 4, 1}

RC522_PIN_RST = 2
RC522_PIN_SS = 4
RC522_SERVER_URL = "http://192.168.1.102:5000/card/"
PIN_RED = 3
PIN_GREEN = 1
PIN_BLUE = 8

BLINK_WIFI_FAILURE = 2

LED_CONFIRM_LEN = 1500

if file.exists('parameters-device.lc') then  
    dofile("parameters-device.lc")        
else
    dofile("parameters-device.lua")        
end
