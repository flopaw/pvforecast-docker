FROM python:bullseye

WORKDIR /usr/app/src

COPY ./PVForecast ./

RUN apt-get install -qy python3-pip 
RUN apt-get install -qy python3-elementpath 
RUN apt-get install -qy python3-protobuf
RUN apt-get install -qy netcdf-bin
RUN apt-get install -qy python3-bs4
RUN apt-get install -qy python3-requests 
RUN apt-get install -qy python3-numpy
RUN apt-get install -qy python3-pandas
RUN apt-get install -qy python3-h5py
RUN apt-get install -qy python3-tables
RUN apt-get install -qy python3-setuptools 
RUN apt-get install -qy python3-astral 
RUN apt-get install -qy python3-wheel 
RUN apt-get install -qy python3-wrapt 
RUN apt-get install -qy python3-yaml 
RUN apt-get install -qy python3-isodate
RUN apt-get install -qy python3-scipy 
RUN apt-get install -qy python3-netcdf4 
RUN apt-get install -qy python3-influxdb 

RUN python3 -m pip install pip --upgrade 
RUN python3 -m pip install pysolcast 
RUN python3 -m pip install astral --upgrade
RUN python3 -m pip install siphon --upgrade 
RUN python3 -m pip install pvlib 

CMD [ "python3", "./PVForecast/PVForecasts.py"]

netcdf-bin