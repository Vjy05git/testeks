From maven AS base
WORKDIR /app
COPY . /app
RUN mvn clean install


FROM lolhens/baseimage-openjre
WORKDIR /app
COPY --from=base /app/target/*.jar App.jar
EXPOSE 80
ENTRYPOINT ["java", "-jar", "App.jar"]
