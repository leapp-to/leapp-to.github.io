---
title: LeApp daemon API v1.0
language_tabs:
  - shell: Shell
  - http: HTTP
  - javascript: JavaScript
  - javascript--nodejs: Node.JS
  - ruby: Ruby
  - python: Python
  - java: Java
toc_footers: []
includes: []
search: true
highlight_theme: darkula
headingLevel: 2
---

# LeApp daemon API v1.0

> Scroll down for code samples, example requests and responses. Select a language for code samples from the tabs above or the mobile navigation menu.

LeApp daemon API

Base URLs:

* <a href="/v1">/v1</a>





<h1 id="LeApp-daemon-API-default">Default</h1>

## POST /destroy-container

> Code samples

```shell
# You can also use wget
curl -X POST /v1/destroy-container \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

```http
POST /v1/destroy-container HTTP/1.1
Host: null
Content-Type: application/json
Accept: application/json

```

```javascript
var headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

$.ajax({
  url: '/v1/destroy-container',
  method: 'post',

  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})
```

```javascript--nodejs
const request = require('node-fetch');
const inputBody = '{
  "container_name": "string",
  "target_user": "root",
  "target_host": "localhost"
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

fetch('/v1/destroy-container',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});
```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json'
}

result = RestClient.post '/v1/destroy-container',
  params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

r = requests.post('/v1/destroy-container', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("/v1/destroy-container");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());
```

*Delete the container on target*

> Body parameter

```json
{
  "container_name": "string",
  "target_user": "root",
  "target_host": "localhost"
}
```
<h3 id="POST-/destroy-container-parameters">Parameters</h3>

Parameter|In|Type|Required|Description
---|---|---|---|---|
body|body|[DestroyContainerInput](#schemadestroycontainerinput)|true|No description
» container_name|body|string|true|No description
» target_user|body|string|false|No description
» target_host|body|string|false|No description


> Example responses

```json
{
  "errors": [],
  "data": {}
}
```
<h3 id="POST-/destroy-container-responses">Responses</h3>

Status|Meaning|Description|Schema
---|---|---|---|
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Success response|[Result](#schemaresult)

<aside class="success">
This operation does not require authentication
</aside>

## POST /port-inspect

> Code samples

```shell
# You can also use wget
curl -X POST /v1/port-inspect \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

```http
POST /v1/port-inspect HTTP/1.1
Host: null
Content-Type: application/json
Accept: application/json

```

```javascript
var headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

$.ajax({
  url: '/v1/port-inspect',
  method: 'post',

  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})
```

```javascript--nodejs
const request = require('node-fetch');
const inputBody = '{
  "scan_options": {
    "port_range": "",
    "shallow_scan": false
  },
  "target_host": "localhost"
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

fetch('/v1/port-inspect',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});
```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json'
}

result = RestClient.post '/v1/port-inspect',
  params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

r = requests.post('/v1/port-inspect', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("/v1/port-inspect");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());
```

*Inspect ports on target*

> Body parameter

```json
{
  "scan_options": {
    "port_range": "",
    "shallow_scan": false
  },
  "target_host": "localhost"
}
```
<h3 id="POST-/port-inspect-parameters">Parameters</h3>

Parameter|In|Type|Required|Description
---|---|---|---|---|
body|body|[PortInspectInput](#schemaportinspectinput)|true|No description
» scan_options|body|object|false|No description
»» port_range|body|string|false|No description
»» shallow_scan|body|boolean|false|No description
» target_host|body|string|false|No description


> Example responses

```json
{
  "errors": [],
  "data": {}
}
```
<h3 id="POST-/port-inspect-responses">Responses</h3>

Status|Meaning|Description|Schema
---|---|---|---|
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Success response|[Result](#schemaresult)

<aside class="success">
This operation does not require authentication
</aside>

## POST /port-map

> Code samples

```shell
# You can also use wget
curl -X POST /v1/port-map \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

```http
POST /v1/port-map HTTP/1.1
Host: null
Content-Type: application/json
Accept: application/json

```

```javascript
var headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

$.ajax({
  url: '/v1/port-map',
  method: 'post',

  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})
```

```javascript--nodejs
const request = require('node-fetch');
const inputBody = '{
  "tcp_ports": {
    "ports": [
      {
        "protocol": "tcp",
        "exposed_port": 0,
        "port": 0
      }
    ]
  },
  "excluded_tcp_ports": {
    "tcp": {
      "port": "string",
      "port_data": {
        "name": ""
      }
    },
    "udp": {
      "port": "string",
      "port_data": {
        "name": ""
      }
    }
  },
  "default_port_map": true,
  "target_host": "localhost",
  "source_host": "string"
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

fetch('/v1/port-map',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});
```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json'
}

result = RestClient.post '/v1/port-map',
  params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

r = requests.post('/v1/port-map', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("/v1/port-map");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());
```

*Map ports given by use or detected on source to ports available on target*

> Body parameter

```json
{
  "tcp_ports": {
    "ports": [
      {
        "protocol": "tcp",
        "exposed_port": 0,
        "port": 0
      }
    ]
  },
  "excluded_tcp_ports": {
    "tcp": {
      "port": "string",
      "port_data": {
        "name": ""
      }
    },
    "udp": {
      "port": "string",
      "port_data": {
        "name": ""
      }
    }
  },
  "default_port_map": true,
  "target_host": "localhost",
  "source_host": "string"
}
```
<h3 id="POST-/port-map-parameters">Parameters</h3>

Parameter|In|Type|Required|Description
---|---|---|---|---|
body|body|[PortMapInput](#schemaportmapinput)|true|No description
» tcp_ports|body|[PortMappingBase](#schemaportmappingbase)|false|No description
»» ports|body|[[PortMappingItemBase](#schemaportmappingitembase)]|false|No description
»»» protocol|body|string|true|Port protocol
»»» exposed_port|body|integer|true|Port on which the service will be mapped to
»»» port|body|integer|true|Port on which the service is currently listening
» excluded_tcp_ports|body|[PortListBase](#schemaportlistbase)|false|A map of TCP/UDP ports
»» tcp|body|[PortListItemBase](#schemaportlistitembase)|true|A map of ports with their respective data (can be just an empty map)
»»» port|body|string|true|No description
»»» port_data|body|object|true|No description
»»»» name|body|string|true|The name of a service running on this port, can be empty
»» udp|body|[PortListItemBase](#schemaportlistitembase)|true|A map of ports with their respective data (can be just an empty map)
»»» port|body|string|true|No description
»»» port_data|body|object|true|No description
»»»» name|body|string|true|The name of a service running on this port, can be empty
» default_port_map|body|boolean|false|No description
» target_host|body|string|false|No description
» source_host|body|string|true|No description


#### Enumerated Values

|Parameter|Value|
|---|---|
»»» protocol|tcp|
»»» protocol|udp|

> Example responses

```json
{
  "errors": [],
  "data": {}
}
```
<h3 id="POST-/port-map-responses">Responses</h3>

Status|Meaning|Description|Schema
---|---|---|---|
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Success response|[Result](#schemaresult)

<aside class="success">
This operation does not require authentication
</aside>

## POST /check-target

> Code samples

```shell
# You can also use wget
curl -X POST /v1/check-target \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

```http
POST /v1/check-target HTTP/1.1
Host: null
Content-Type: application/json
Accept: application/json

```

```javascript
var headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

$.ajax({
  url: '/v1/check-target',
  method: 'post',

  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})
```

```javascript--nodejs
const request = require('node-fetch');
const inputBody = '{
  "target_user_name": "root",
  "check_target_service_status": false,
  "target_host": "localhost"
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

fetch('/v1/check-target',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});
```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json'
}

result = RestClient.post '/v1/check-target',
  params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

r = requests.post('/v1/check-target', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("/v1/check-target");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());
```

*Check services on a target system*

> Body parameter

```json
{
  "target_user_name": "root",
  "check_target_service_status": false,
  "target_host": "localhost"
}
```
<h3 id="POST-/check-target-parameters">Parameters</h3>

Parameter|In|Type|Required|Description
---|---|---|---|---|
body|body|[CheckTargetInput](#schemachecktargetinput)|true|No description
» target_user_name|body|string|false|No description
» check_target_service_status|body|boolean|false|No description
» target_host|body|string|false|No description


> Example responses

```json
{
  "errors": [],
  "data": {}
}
```
<h3 id="POST-/check-target-responses">Responses</h3>

Status|Meaning|Description|Schema
---|---|---|---|
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Success response|[Result](#schemaresult)

<aside class="success">
This operation does not require authentication
</aside>

# Schemas

## TargetHostBase

<a name="schematargethostbase"></a>

```json
{
  "target_host": "localhost"
} 
```

### Properties

Name|Type|Required|Description
---|---|---|---|
target_host|string|false|No description



## SourceHostBase

<a name="schemasourcehostbase"></a>

```json
{
  "source_host": "string"
} 
```

### Properties

Name|Type|Required|Description
---|---|---|---|
source_host|string|true|No description



## PortListItemBase

<a name="schemaportlistitembase"></a>

```json
{
  "port": "string",
  "port_data": {
    "name": ""
  }
} 
```

### Properties

Name|Type|Required|Description
---|---|---|---|
port|string|true|No description
port_data|object|true|No description
» name|string|true|The name of a service running on this port, can be empty



## PortListBase

<a name="schemaportlistbase"></a>

```json
{
  "tcp": {
    "port": "string",
    "port_data": {
      "name": ""
    }
  },
  "udp": {
    "port": "string",
    "port_data": {
      "name": ""
    }
  }
} 
```

### Properties

Name|Type|Required|Description
---|---|---|---|
tcp|[PortListItemBase](#schemaportlistitembase)|true|A map of ports with their respective data (can be just an empty map)
» port|string|true|No description
» port_data|object|true|No description
»» name|string|true|The name of a service running on this port, can be empty
udp|[PortListItemBase](#schemaportlistitembase)|true|A map of ports with their respective data (can be just an empty map)
» port|string|true|No description
» port_data|object|true|No description
»» name|string|true|The name of a service running on this port, can be empty



## PortMappingItemBase

<a name="schemaportmappingitembase"></a>

```json
{
  "protocol": "tcp",
  "exposed_port": 0,
  "port": 0
} 
```

### Properties

Name|Type|Required|Description
---|---|---|---|
protocol|string|true|Port protocol
exposed_port|integer|true|Port on which the service will be mapped to
port|integer|true|Port on which the service is currently listening


#### Enumerated Values

|Property|Value|
|---|---|
protocol|tcp|
protocol|udp|


## PortMappingBase

<a name="schemaportmappingbase"></a>

```json
{
  "ports": [
    {
      "protocol": "tcp",
      "exposed_port": 0,
      "port": 0
    }
  ]
} 
```

### Properties

Name|Type|Required|Description
---|---|---|---|
ports|[[PortMappingItemBase](#schemaportmappingitembase)]|false|No description
» protocol|string|true|Port protocol
» exposed_port|integer|true|Port on which the service will be mapped to
» port|integer|true|Port on which the service is currently listening


#### Enumerated Values

|Property|Value|
|---|---|
» protocol|tcp|
» protocol|udp|


## DestroyContainerInput

<a name="schemadestroycontainerinput"></a>

```json
{
  "container_name": "string",
  "target_user": "root",
  "target_host": "localhost"
} 
```

### Properties

Name|Type|Required|Description
---|---|---|---|
container_name|string|true|No description
target_user|string|false|No description
target_host|string|false|No description



## PortInspectInput

<a name="schemaportinspectinput"></a>

```json
{
  "scan_options": {
    "port_range": "",
    "shallow_scan": false
  },
  "target_host": "localhost"
} 
```

### Properties

Name|Type|Required|Description
---|---|---|---|
scan_options|object|false|No description
» port_range|string|false|No description
» shallow_scan|boolean|false|No description
target_host|string|false|No description



## PortMapInput

<a name="schemaportmapinput"></a>

```json
{
  "tcp_ports": {
    "ports": [
      {
        "protocol": "tcp",
        "exposed_port": 0,
        "port": 0
      }
    ]
  },
  "excluded_tcp_ports": {
    "tcp": {
      "port": "string",
      "port_data": {
        "name": ""
      }
    },
    "udp": {
      "port": "string",
      "port_data": {
        "name": ""
      }
    }
  },
  "default_port_map": true,
  "target_host": "localhost",
  "source_host": "string"
} 
```

### Properties

Name|Type|Required|Description
---|---|---|---|
tcp_ports|[PortMappingBase](#schemaportmappingbase)|false|No description
» ports|[[PortMappingItemBase](#schemaportmappingitembase)]|false|No description
»» protocol|string|true|Port protocol
»» exposed_port|integer|true|Port on which the service will be mapped to
»» port|integer|true|Port on which the service is currently listening
excluded_tcp_ports|[PortListBase](#schemaportlistbase)|false|A map of TCP/UDP ports
» tcp|[PortListItemBase](#schemaportlistitembase)|true|A map of ports with their respective data (can be just an empty map)
»» port|string|true|No description
»» port_data|object|true|No description
»»» name|string|true|The name of a service running on this port, can be empty
» udp|[PortListItemBase](#schemaportlistitembase)|true|A map of ports with their respective data (can be just an empty map)
»» port|string|true|No description
»» port_data|object|true|No description
»»» name|string|true|The name of a service running on this port, can be empty
default_port_map|boolean|false|No description
target_host|string|false|No description
source_host|string|true|No description


#### Enumerated Values

|Property|Value|
|---|---|
»» protocol|tcp|
»» protocol|udp|


## CheckTargetInput

<a name="schemachecktargetinput"></a>

```json
{
  "target_user_name": "root",
  "check_target_service_status": false,
  "target_host": "localhost"
} 
```

### Properties

Name|Type|Required|Description
---|---|---|---|
target_user_name|string|false|No description
check_target_service_status|boolean|false|No description
target_host|string|false|No description



## Result

<a name="schemaresult"></a>

```json
{
  "errors": [],
  "data": {}
} 
```

### Properties

Name|Type|Required|Description
---|---|---|---|
data|object|false|No description
errors|[[Error](#schemaerror)]|false|No description
» code|integer|true|Error codes:   * `1` - Error manipulating input data   * `2` - Error in the execution of actor-runner   * `3` - Error manipulating data generated by actors 
» message|string|false|No description


#### Enumerated Values

|Property|Value|
|---|---|
» code|1|
» code|2|
» code|3|


## Error

<a name="schemaerror"></a>

```json
{
  "code": 1,
  "message": ""
} 
```

### Properties

Name|Type|Required|Description
---|---|---|---|
code|integer|true|Error codes:   * `1` - Error manipulating input data   * `2` - Error in the execution of actor-runner   * `3` - Error manipulating data generated by actors 
message|string|false|No description


#### Enumerated Values

|Property|Value|
|---|---|
code|1|
code|2|
code|3|




