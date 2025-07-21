# Spring Boot Hello World API

This is a small Spring-Boot Hello World application to demonstrate a quick and simple API.

It has one endpoint which returns a JSON response containing the hostname and IP of the server and an obligatory hello world message. 

## Requirements
 * Java 1.17
 * Maven
 
## Using the API
Simply start the app and make a HTTP GET request to http://localhost:8080/ and you will get a JSON response.


## How To

#### Clean and Build
```
mvn clean package
```

#### Run
```
mvn spring-boot:run
open http://localhost:8080/
```
Or
```
java -jar ./target/spring-boot-hello-world-1.0.0-SNAPSHOT.jar
```

#### Test
```
mvn verify
```

#### Docker Build with Maven
```
mvn package docker:build
```
Or

```
mvn package docker:build -Dmaven.test.skip=true
```

#### Docker Push
```
docker login
docker tag hello-world-spring-boot kimb88/hello-world-spring-boot
docker push kimb88/hello-world-spring-boot
```

