
FROM gradle:6.8.0-jdk8 AS build

COPY . /lib

WORKDIR /lib

COPY . /src

WORKDIR /src

RUN gradle build

FROM gradle:6.8.0-jdk8 
 
RUN mkdir app

COPY --from=build /src/build/libs/lib-1.jar app/app.jar

COPY . /app

WORKDIR /app

EXPOSE 7000:7000

RUN gradle build

ENTRYPOINT [ "java", "-jar", "app.jar" ]


# for run Server
# ENTRYPOINT ["gradle", "runServer"]  

# for the Client side
# ENTRYPOINT ["gradle", "runClient"]  
