FROM openjdk:8-jdk as builder
COPY . /project
WORKDIR /project
RUN ./gradlew build -x test

FROM openjdk:8-jre-alpine
COPY --from=builder /project/build/libs/*.jar /vnfm-dummy-amqp.jar
RUN mkdir -p /var/log/openbaton
COPY --from=builder /project/src/main/resources/application.properties /etc/openbaton/vnfm-dummy-amqp.properties
ENTRYPOINT ["java", "-jar", "/vnfm-dummy-amqp.jar", "--spring.config.location=file:/etc/openbaton/vnfm-dummy-amqp.properties"]
