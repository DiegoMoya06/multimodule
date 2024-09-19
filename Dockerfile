FROM openjdk:17-jdk-alpine
ARG JAR_FILE=backend/target/*.jar
COPY ./backend/target/backend-*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]

# RUN mkdir -p backend/workspace
# WORKDIR backend/workspace
# COPY backend/pom.xml backend/workspace
# RUN mvn -B package --file backend/pom.xml -DskipTests

# FROM openjdk:17-slim
# COPY --from=build backend/workspace/target/*.jar app.jar
# EXPOSE 6379
# ENTRYPOINT ["java","-jar","app.jar"]
