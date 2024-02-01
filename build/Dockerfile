FROM mcr.microsoft.com/dotnet/sdk:8.0
ENV HOME=/
ENV DOTNET_NUGET_SIGNATURE_VERIFICATION=false
RUN mkdir /.dotnet && mkdir /.nuget && mkdir /.local
RUN dotnet workload update
RUN chmod -R 777 /.dotnet
RUN chmod -R 777 /.nuget
RUN chmod -R 777 /.local

