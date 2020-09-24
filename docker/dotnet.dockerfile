FROM mcr.microsoft.com/dotnet/core/sdk:latest

ENV PATH="${PATH}:/root/.dotnet/tools"

RUN dotnet tool install -g dotnet-format

