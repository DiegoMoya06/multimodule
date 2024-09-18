FROM maven:3.8.5-openjdk-17-slim AS build
RUN mkdir -p backend/workspace
WORKDIR /workspace
COPY backend/pom.xml backend/workspace
COPY backend/src backend/workspace/src
RUN mvn -B package --file backend/pom.xml -DskipTests

FROM openjdk:17-slim
COPY --from=build backend/workspace/target/*.jar app.jar
EXPOSE 6379
ENTRYPOINT ["java","-jar","app.jar"]
