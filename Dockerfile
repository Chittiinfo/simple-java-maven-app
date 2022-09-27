FROM maven:latest AS build
# Environment Variable that defines the endpoint of sentiment-analysis python api.
COPY . /usr/app
WORKDIR /usr/app
RUN mvn package

FROM openjdk:8-jdk-alpine
# Environment Variable that defines the endpoint of sentiment-analysis python api.
WORKDIR /
CMD ["java", "-jar", "/my-app-1.0-SNAPSHOT.jar"]
COPY --from=build /usr/app/target/my-app-1.0-SNAPSHOT.jar /
