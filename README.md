# Docker midscribe #

Simple docker file for https://github.com/Evolveum/midscribe (permit to create HTML / ADOC documentation of midpont xml file).

## Build it ##

```shell
git clone 
cd docker-midscribe
docker build . -t docker-midscribe
```

## Run it from dockerHub ##

You need to mount your configuration folder under docker container. For this exemple, we use in /home/user/my_configuration_midpoint folder.

This image use this by default : 

```dockerfile
ENTRYPOINT ["java", "-jar", "/app/midscribe/midscribe-cmd/target/midscribe-executable.jar"]
CMD [ "generate", "-eo", "/mnt/documentation.html", "-ef", "HTML", "-s", "/mnt" ]
```

So for generate HTML documentation use 

```shell
cd /home/user/my_configuration_midpoint
docker run --rm -v $PWD:/mnt mysiki/docker-midscribe

#or
docker run --rm -v /home/user/my_configuration_midpoint:/mnt mysiki/docker-midscribe
```

For use other command, just overwrite it by adding your options at the end, like `docker run --rm -v $PWD:/mnt docker-midscribe <Options than will replace CMD>`. 

Exemple, for generate ADOC doc :

```shell
docker run --rm -v $PWD:/mnt mysiki/docker-midscribe generate -s /mnt -ao /mnt/documentation.adoc
```

See midscribe documentation for command line and other options. 

Tips : Enter in shell mode `docker run --rm -v $PWD:/mnt --entrypoint sh -it mysiki/docker-midscribe`

## Run it from local ##

### Build it locally ###

```shell
git clone
cd docker-midscribe
docker build . -t docker-midscribe
```

### Run it ###

```shell
docker run --rm -v $PWD:/mnt docker-midscribe
```
