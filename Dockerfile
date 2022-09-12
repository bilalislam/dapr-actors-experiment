FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine as build

COPY . .

WORKDIR /src/Server
RUN dotnet restore
RUN dotnet publish -o /app/published-app

FROM mcr.microsoft.com/dotnet/aspnet:5.0-alpine as runtime
WORKDIR /app
COPY --from=build /app/published-app /app
ENV ASPNETCORE_URLS=http://+:5003
EXPOSE 5003
ENTRYPOINT [ "dotnet", "/app/Server.dll" ]