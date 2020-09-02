FROM mcr.microsoft.com/dotnet/core/sdk:latest

RUN dotnet tool install -g dotnet-format

ENV PATH="${PATH}:/root/.dotnet/tools"
