# Usage
# docker build -t mosazhaw/djl-footwear-classification .
# docker run --name djl-footwear-classification -p 8080:8080 -d mosazhaw/djl-footwear-classification

FROM eclipse-temurin:25-jdk-noble

# Copy Files
WORKDIR /usr/src/app
COPY models models
COPY src src
COPY .mvn .mvn
COPY pom.xml mvnw ./

# Install
RUN ./mvnw -Dmaven.test.skip=true package

# Docker Run Command
EXPOSE 8080
CMD ["java","-jar","/usr/src/app/target/playground-0.0.1-SNAPSHOT.jar"]