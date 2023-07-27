
FROM gradle:6.8.0-jdk8 AS build

COPY . /lib

WORKDIR /lib

COPY . /src

WORKDIR /src

RUN gradle build

FROM gradle:6.8.0-jdk8
 
RUN mkdir app

COPY --from=build /src/* app/

COPY . /app

WORKDIR /app

EXPOSE 7000:7000

RUN gradle build

# for run Server
ENTRYPOINT ["gradle", "runServer"]  

# for the Client side
# ENTRYPOINT ["gradle", "runClient"]  
