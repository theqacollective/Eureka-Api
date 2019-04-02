FROM maven as build
WORKDIR /build
COPY pom.xml .
COPY . .
RUN mvn clean package

FROM openjdk:8
COPY --from=build /build/target/EurekaDiscoveryServer-0.0.1-SNAPSHOT.jar  discovery.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","discovery.jar"]
