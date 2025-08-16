FROM maven:3.8.5-openjdk-17-slim AS buid
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=buid /target/gateway-0.0.1-SNAPSHOT.jar api-gateway.jar
EXPOSE 8082
ENTRYPOINT [ "java","-jar","api-gateway.jar"]
