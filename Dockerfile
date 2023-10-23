FROM adoptopenjdk:11-jdk-hotspot

WORKDIR /app
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
RUN ./mvnw dependency:go-offline -B

COPY src ./src
RUN ./mvnw package -DskipTests

EXPOSE 8081
COPY target/song-service-1.0-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]