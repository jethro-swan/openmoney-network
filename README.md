## openmoney-network

This is the client side application that accesses the [openmoney-api](https://github.com/openmoney/openmoney-api).

### Public Instance

[openmoney.network](https://openmoney.network) or [net.openmoney.gift](https://net.openmoney.gift)

### Installation

```sh
git clone https://github.com/openmoney/openmoney-network
cd openmoney-network
npm install
```

### Build

```sh
sudo npm install -g grunt
grunt
#ctrl-c to exit
```

### Hosting

You must have the [openmoney-api](https://github.com/openmoney/openmoney-api) installed and running on port 8080. Nginx is used to host the client code base and API end points on the same port(80) by using a reverse proxy of the port 8080 which is running the API.

#### (a) Remote hosting in VM

If the server is already running a number of applications via Apache2 it may be more convenient to create a VM (e.g. using VirtualBox) with a minimal installation of Ubuntu 20.04 or 19.10.  The sample Nginx file assumes the user is "om" (/home/om/).

In this case the host machine's Apache2 can be used to reverse proxy the VM's port 8080 to host port 80 and to provide the SSL layer.

```sh
sudo apt-get install nginx
sudo cp openmoney-network.nginx.conf /etc/nginx/sites-available/default
sudo service nginx reload
```
#### (b) Local Hosting (on development machine)

```sh
sudo apt-get install nginx
sudo cp openmoney-network.nginx.conf /etc/nginx/sites-available/default
sudo gedit /etc/nginx/sites-available/default #modify the root path and the location / alias path to this repo path
sudo service nginx reload
google-chrome http://localhost
```

It is strongly recommended to set up SSL for Nginx if you are hosting locally. [LetsEncrypt](https://letsencrypt.org/) is a free service to get SSL certificates.

### License

Copyright [2016] [Dominique Legault]

Minor revisions: 2020/01/04 - 2020/04/29 John Waters

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
