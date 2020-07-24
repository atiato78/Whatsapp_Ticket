FROM mcr.microsoft.com/java/jre:8u202-zulu-debian9 AS base
EXPOSE 7547
WORKDIR /app

FROM mcr.microsoft.com/java/maven:8u202-zulu-debian9 AS build
WORKDIR /usr/src/app
COPY pom.xml ./
RUN /usr/local/bin/mvn-entrypoint.sh \
    mvn package -Dmaven.test.skip=true -Dcheckstyle.skip=true -Dmaven.javadoc.skip=true --fail-never
COPY . .
RUN mvn package -Dmaven.test.skip=true -Dcheckstyle.skip=true -Dmaven.javadoc.skip=true

FROM base AS final
COPY --from=build /usr/src/app/target/*.jar ./
ENTRYPOINT ["java","-jar","spring-1.0-SNAPSHOT.jar"]