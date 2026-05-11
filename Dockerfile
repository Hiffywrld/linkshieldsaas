FROM maven:3.9.6-eclipse-temurin-21 AS build
COPY . .
WORKDIR /LinkSheildSaas
RUN mvn clean package -DskipTests
FROM eclipse-temurin:21-jdk
COPY --from=build /LinkSheildSaas/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]
