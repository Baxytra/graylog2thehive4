# Graylog2TheHive4

Simple app to create TheHive4 alerts from Graylog

## Environment

This app has been tested with the following versions:
- CentOS 7.9.2009 (Core)
- Graylog 4.0.7
- TheHive4 4.0.4-1

This app should be installed on the host where TheHive4 is installed.
## Setup
## Setup Graylog2TheHive4 application

- Clone repo:

```
git clone https://github.com/Baxytra/graylog2thehive4
```

- Configure `TheHive4 URL`, `API key`, `Graylog url`, `Ip where application will be work` and `Port where application will be work (optional)` in graylog2thehive4.py:

```
vim graylog2thehive4.py
```

- Run docker-compose

```
cd graylog2thehive4
docker-compose up -d
```

## Setup Graylog Notification

Create new `Notification` with  in `Alerts -> Notifications`:

- Specify: `Title`;
- Notification Type: `HTTP Notification`;
- URL: `http{s}://TheHive4:Port/webhook`; For example: `http://192.168.0.1:5000/webhook`
- Add this URL to Graylog whitelist or disable whitelist in `System -> Configurations`;

## Adding artifacts to TheHive4 alert

- In TheHive4 | Add dataType: `Admin -> Observable types` | For example: *`src_ip`*
- In Graylog | Add fields in `Event Definitions -> Fields -> Add Custom Field` | For example: Name of this field is *`src_ip`*
- Add this dataType in `graylog2thehive4.py` | For example:

```
if key == 'src_ip':
            artifacts.append(AlertArtifact(dataType='src_ip', data=fields[key]))
```

## Logging

For debug you can use log with message from graylog and message that sending to thehive4. It located in `./log/graylog2thehive4.log`

## Credits

Based on [graylog2thehive4](https://github.com/H2Cyber/Graylog2TheHive4) 
