
wget -qO- https://get.docker.io/ | sh;
mkdir /var/discourse;
git clone https://github.com/discourse/discourse_docker.git /var/discourse;
cd /var/discourse;
cp samples/standalone.yml containers/app.yml;

read -p "Enter the email address you use to register your account [ex: webeindustry@gmail.com] " mail;
sed -i "/^me@example.com/s/$/$mail/g" containers/app.yml;
read -p "Enter the name of your domain [ex: www.webeindustry.com] " domain;
sed -i "s/"discourse.example.com"/$domain/g" containers/app.yml;
sed -i 's/smtp.example.com/smtp.mandrillapp.com' containers/app.yml;


