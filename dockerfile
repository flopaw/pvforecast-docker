FROM python:3.10-bullseye

WORKDIR /usr/app/src

RUN apt-get update
RUN apt-get install -y  python3-pip python3-elementpath python3-protobuf \
                        netcdf-bin python3-bs4 python3-requests python3-numpy \
                        python3-pandas python3-h5py python3-tables python3-setuptools \
                        python3-astral python3-wheel python3-wrapt python3-yaml \
                        python3-isodate python3-scipy python3-netcdf4 python3-influxdb  

RUN python3 -m pip install pip --upgrade 
RUN python3 -m pip install pysolcast 
RUN python3 -m pip install astral --upgrade
RUN python3 -m pip install siphon --upgrade 
RUN python3 -m pip install numpy --upgrade 
RUN python3 -m pip install elementpath --upgrade 
RUN python3 -m pip install netcdf4 --upgrade 
RUN python3 -m pip install pvlib 

COPY ./PVForecast ./

CMD [ "python3", "PVForecasts.py"]