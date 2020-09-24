FROM mcr.microsoft.com/dotnet/core/sdk:latest

ENV PATH="${PATH}:/root/.dotnet/tools"

RUN dotnet tool install -g dotnet-format --version 5.0.135301 --add-source https://dotnet.myget.org/F/format/api/v3/index.json

