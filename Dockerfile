FROM mcr.microsoft.com/dotnet/sdk:7.0 as build

WORKDIR /source
COPY *.csproj .
RUN dotnet restore -a amd64

COPY . .
RUN dotnet publish -c release -o /app -a amd64 --self-contained false --no-restore

# app image
FROM mcr.microsoft.com/dotnet/runtime:7.0
WORKDIR /app
COPY --from=build /app .

# Install apache2-utils for ab
RUN apt-get update && apt-get install -y apache2-utils

ENTRYPOINT ["dotnet", "Worker.dll"]
