FROM python:bullseye

WORKDIR /usr/app/src

RUN apt-get update
RUN apt-get install -y python3-pip netcdf-bin 

RUN python3 -m pip install pip --upgrade 

COPY ./requirements.txt ./
RUN python3 -m pip install -r requirements.txt --upgrade

COPY ./PVForecast ./

CMD [ "python3", "PVForecasts.py"]