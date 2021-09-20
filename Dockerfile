FROM alpine:3.13.2

ENV midscribe_url https://github.com/Evolveum/midscribe
ENV version master

RUN apk add --no-cache maven openjdk11 git

RUN mkdir -p /app && \
    git clone ${midscribe_url} -b ${version} /app/midscribe && \
    mvn clean install -DskipTests -f /app/midscribe/pom.xml

WORKDIR /app

ENTRYPOINT ["java", "-jar", "/app/midscribe/midscribe-cmd/target/midscribe-executable.jar"] 
CMD [ "generate", "-eo", "/mnt/documentation.html", "-ef", "HTML", "-s", "/mnt" ]
