FROM python:2.7.17-slim-buster AS base
RUN apt-get update && apt-get upgrade -y --no-install-recommends
RUN apt-get install -y ca-certificates

FROM base as tools
RUN apt-get install -y wget build-essential python-dev

FROM tools AS deps
RUN apt-get install -y fontconfig libfreetype6 libjpeg62-turbo libpng16-16 libx11-6 libxcb1 libxext6 libxrender1 xfonts-75dpi xfonts-base

FROM deps AS install
WORKDIR /tmp
RUN wget -nv https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.buster_amd64.deb
RUN dpkg -i wkhtmltox_0.12.5-1.buster_amd64.deb
RUN ldconfig

FROM install AS dev
WORKDIR /code

FROM install AS final
WORKDIR /tmp
RUN apt-get purge -y --auto-remove wget build-essential python-dev \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm wkhtmltox_0.12.5-1.buster_amd64.deb
WORKDIR /app

CMD ["bash"]