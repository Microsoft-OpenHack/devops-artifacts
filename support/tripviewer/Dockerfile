FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine AS build
WORKDIR /src
COPY . .
RUN dotnet publish "web/TripViewer.csproj" -c Release -o /publish

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine
ENV USER_ROOT_URL="https://devopsohuserprofile.azurewebsites.net"
ENV POI_ROOT_URL="https://devopsohpoi.azurewebsites.net"
ENV TRIPS_ROOT_URL="https://devopsohtrips.azurewebsites.net"
ENV USER_JAVA_ROOT_URL="https://devopsohuserjava.azurewebsites.net"
ENV STAGING_USER_ROOT_URL="https://devopsohuserprofile-staging.azurewebsites.net"
ENV STAGING_POI_ROOT_URL="https://devopsohpoi-staging.azurewebsites.net"
ENV STAGING_TRIPS_ROOT_URL="https://devopsohtrips-staging.azurewebsites.net"
ENV STAGING_USER_JAVA_ROOT_URL="https://devopsohuserjava-staging.azurewebsites.net"
ENV BING_MAPS_KEY="changeme"

WORKDIR /app
COPY --from=build /publish .
ENTRYPOINT ["dotnet", "TripViewer.dll"]
