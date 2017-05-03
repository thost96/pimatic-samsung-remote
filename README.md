# pimatic-samsung-remote

[![npm version](https://badge.fury.io/js/pimatic-samsung-remote.svg)](http://badge.fury.io/js/pimatic-samsung-remote)
[![dependencies status](https://david-dm.org/thost96/pimatic-samsung-remote/status.svg)](https://david-dm.org/thost96/pimatic-samsung-remote)

A pimatic plugin to control your Samsung TV.

## Plugin Configuration
	{
          "plugin": "samsung-remote",
          "debug": false
    }
The plugin has the following configuration properties:

| Property          | Default  | Type    | Description                                 |
|:------------------|:---------|:--------|:--------------------------------------------|
| debug             | false    | Boolean | Debug mode. Writes debug messages to the pimatic log, if set to true |


## Device Configuration
The following device can be used:

#### SamsungTvControl

	{
			"id": "",
			"class": "SamsungTvControl",
			"name": "",
			"ip": ""
	}


| Property      | Default  | Type    | Description                                 |
|:--------------|:---------|:--------|:--------------------------------------------|
| ip 			| -        | String  | IP address of your samsung tv |


## History

See [Release History](https://github.com/thost96/pimatic-samsung-remote/blob/master/History.md).

## License 

Copyright (c) 2016, Thorsten Reichelt and contributors. All rights reserved.

License: [GPL-2.0](https://github.com/thost96/pimatic-samsung-remote/blob/master/LICENSE).