FROM adoptopenjdk:14-jre-hotspot as builder
WORKDIR application
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} application.jar
RUN java -Djarmode=layertools -jar application.jar extract

FROM adoptopenjdk:14-jre-hotspot

WORKDIR application
COPY --from=builder application/dependencies/ ./
COPY --from=builder application/spring-boot-loader/ ./
COPY --from=builder application/snapshot-dependencies/ ./

ENV JAVA_OPTS=""
ENV SPRING_OPTS=""
ENV MEM_OPTS=""

EXPOSE 8080

COPY --from=builder application/application/ ./
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS $MEM_OPTS -Djava.security.egd=file:/dev/./urandom org.springframework.boot.loader.JarLauncher $SPRING_OPTS" ]
