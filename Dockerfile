# Step 1: Build stage
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app

# Copy the entire project to the container
COPY . .

# Build the project and create the JAR file
RUN mvn clean install -pl backend -am

# Step 2: Runtime stage
FROM openjdk:17-jdk-alpine
WORKDIR /app

# Copy the JAR file from the build stage to the runtime stage
COPY --from=build /app/backend/target/*.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]




# FROM openjdk:17-jdk-alpine
# RUN mvn clean install -pl backend -am -DskipTests
# ARG JAR_FILE=backend/target/*.jar
# COPY backend/target/*.jar app.jar
# ENTRYPOINT ["java","-jar","app.jar"]

# RUN mkdir -p backend/workspace
# WORKDIR backend/workspace
# COPY backend/pom.xml backend/workspace
# RUN mvn -B package --file backend/pom.xml -DskipTests

# FROM openjdk:17-slim
# COPY --from=build backend/workspace/target/*.jar app.jar
# EXPOSE 6379
# ENTRYPOINT ["java","-jar","app.jar"]
