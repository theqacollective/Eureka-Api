FROM maven:latest as maven-build
WORKDIR /build
COPY . /build
RUN mvn clean package
FROM java:8
WORKDIR /opt/website
EXPOSE 8761
COPY --from=maven-build /build/target/EurekaDiscoveryServer-0.0.1-SNAPSHOT.jar discovery.jar
ENTRYPOINT ["java", "-jar", "discovery.jar"]