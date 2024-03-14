FROM maven:3.8.4 AS builder
RUN apt update && apt install git 
RUN git clone https://github.com/Sarang095/SimpleJavaApp.git 
RUN cd SimpleJavaApp

RUN mvn install


FROM openjdk:11-jre-slim

WORKDIR /app
COPY --from=builder /SimpleJavaApp/target/simple-java-app.jar .
EXPOSE 8090
CMD ["java", "-jar", "simple-java-app.jar"]

