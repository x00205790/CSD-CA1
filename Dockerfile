# Stage 1: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:6.0
ENV ASPNETCORE_ENVIRONMENT Production
WORKDIR app
COPY ./bp/publish/myapp/ .
ENTRYPOINT ["dotnet", "BPCalculator.dll"]
