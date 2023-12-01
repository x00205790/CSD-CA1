# Use the official ASP.NET Core runtime as a base image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1

# Set the working directory to /app
WORKDIR /app

# Copy the published output of your application into the container
COPY bin/Release/netcoreapp3.1/publish/ .

# Expose the port your application will run on
EXPOSE 80

# Define the entry point for the application
ENTRYPOINT ["dotnet", "YourAppName.dll"]
