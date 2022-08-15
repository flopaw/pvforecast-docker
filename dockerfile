FROM python:bullseye

WORKDIR /usr/app/src

COPY ./PVForecast ./

RUN apt install -y python3-pip 
RUN apt install -y python3-elementpath 
RUN apt install -y python3-protobuf
RUN apt install -y netcdf-bin
RUN apt install -y python3-bs4
RUN apt install -y python3-requests 
RUN apt install -y python3-numpy
RUN apt install -y python3-pandas
RUN apt install -y python3-h5py
RUN apt install -y python3-tables
RUN apt install -y python3-setuptools 
RUN apt install -y python3-astral 
RUN apt install -y python3-wheel 
RUN apt install -y python3-wrapt 
RUN apt install -y python3-yaml 
RUN apt install -y python3-isodate
RUN apt install -y python3-scipy 
RUN apt install -y python3-netcdf4 
RUN apt install -y python3-influxdb 

RUN python3 -m pip install pip --upgrade 
RUN python3 -m pip install pysolcast 
RUN python3 -m pip install astral --upgrade
RUN python3 -m pip install siphon --upgrade 
RUN python3 -m pip install pvlib 

CMD [ "python3", "./PVForecast/PVForecasts.py"]