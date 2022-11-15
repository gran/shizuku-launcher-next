mkdir singbox
cd singbox/
echo "Download singbox:"
curl -L -0 https://github.com/gran/shizuku-launcher-next/releases/download/v0.0.1/singbox-gg.tar -o singbox-gg.tar
tar -xf singbox-gg.tar 

echo "Singbox setup:"
mv sing-box /usr/bin/singbox
chmod -R 777 /usr/bin/singbox
if test ! -d "/etc/singbox"; then
    mkdir /etc/singbox
fi

mv config-server /etc/singbox/config.json && chmod -R 777 /etc/singbox

echo "Singbox service setup:"
chmod -R 777 singbox.service && mv singbox.service /usr/lib/systemd/system

echo "Singbox starting:"
systemctl enable singbox && systemctl restart singbox

echo "Finished"
