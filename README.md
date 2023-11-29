# Rumbl.Umbrella

Start your Phoenix app with:
```mix phx.server```

## launch virtual display
```
sudo Xvfb :1 -screen 0 1920x1080x24 &
startxfce4 &
x11vnc -display :1 &
/opt/novnc/utils/novnc_proxy  --vnc localhost:5900 &
```

## required enviroment variable
* WOLFRAM_APP_ID: wolfram developer API key for app/info_sys