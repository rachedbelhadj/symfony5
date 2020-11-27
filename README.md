Symfony + Nginx + MySql + Elasticsearch + Kibana
==============

[![Build Status](https://travis-ci.org/rachedbelhadj/symfony5.svg?branch=master)](https://travis-ci.org/rachedbelhadj/symfony5)

## Installation

First, clone this repository:

```bash
$ git clone git@github.com:rachedbelhadj/symfony5.git
```

```bash
$ cp .env.dist .env
```

Then, run:

```bash
$ docker-compose up
```

You are done, you can visit your application on the following URL: 

`http://formastore.loc` 

(and access Kibana on `http://formastore.loc:81/`)

_Note :_ you can rebuild all Docker images by running:

```bash
$ docker-compose build
```

## How it works?

Here are the `docker-compose` built images:

* `db`: This is the MySQL database container (can be changed to postgresql or whatever in `docker-compose.yml` file),
* `php`: This is the PHP-FPM container including the application volume mounted on,
* `nginx`: This is the Nginx webserver container in which php volumes are mounted too,
* `phpmyadmin`: this is the web application to manger you database. 
* `elasticsearch`: This is the Elasticsearch server used to store our web server and application logs,
* `logstash`: This is the Logstash tool from Elastic Stack that allows to read logs and send them into our Elasticsearch server,
* `kibana`: This is the Kibana UI that is used to render logs and create beautiful dashboards. 


### Read logs

You can access Nginx and Symfony application logs in the following directories on your host machine:

* `logs/nginx`
* `logs/symfony`

### Use PhpMyAdmin!

You can also use PhpMyAdmin:

`http://formastore.loc:8088`

### Use Kibana!

You can also use Kibana to visualize Nginx & Symfony logs by visiting:

`http://formastore.loc:81`

### Use xdebug!

Configure your IDE to use port 5902 for XDebug.
Docker versions below 18.03.1 don't support the Docker variable `host.docker.internal`.  
In that case you'd have to swap out `host.docker.internal` with your machine IP address in php-fpm/xdebug.ini.

### Use simple commands 

##### Clear cache

```bash
$ make docker-dev-clean-cache
```

##### Restart containers

```bash
$ make docker-dev-start
```

##### Doctrine schema update

```bash
$ make docker-doctrine-schema-update
```
