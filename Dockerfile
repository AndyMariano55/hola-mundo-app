# Imagen base para compilar
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copiar archivo .csproj desde la carpeta correcta
COPY WebApplication1/WebApplication1/*.csproj ./

# Restaurar dependencias
RUN dotnet restore

# Copiar todo el código
COPY WebApplication1/WebApplication1/ ./

# Publicar app
RUN dotnet publish -c Release -o /app/out

# Imagen final
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/out .

EXPOSE 80
ENTRYPOINT ["dotnet", "WebApplication1.dll"]
