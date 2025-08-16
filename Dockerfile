FROM maven:3.8.5-openjdk-17-slim AS buid
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=buid /target/Api-gateway-0.0.1-SNAPSHOT.jar Api-gateway.jar
EXPOSE 8082
ENTRYPOINT [ "java","-jar","Api-gateway.jar"]