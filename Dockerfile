FROM goodrain.me/maven:3.6-alpine AS builder
WORKDIR /tmp/build
COPY . /tmp/build
RUN mvn clean install

FROM goodrain.me/tomcat:8.5.20-jre8-alpine
COPY --from=builder /tmp/build/target/*.war /usr/local/tomcat/webapps