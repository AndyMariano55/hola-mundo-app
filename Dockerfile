# Imagen base para construir la aplicación
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copiar csproj y restaurar dependencias
COPY WebApplication1/WebApplication1.csproj WebApplication1/
RUN dotnet restore WebApplication1/WebApplication1.csproj

# Copiar el resto del código
COPY WebApplication1/ WebApplication1/

# Publicar la app
RUN dotnet publish WebApplication1/WebApplication1.csproj -c Release -o /app/publish

# Imagen final para ejecución
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .

# Exponer puerto
EXPOSE 8080

# Render usa este env var para el puerto
ENV PORT=8080

# Ejecutar la app
ENTRYPOINT ["dotnet", "WebApplication1.dll"]
