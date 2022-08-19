FROM python:3.10-alpine

WORKDIR /usr/app/src

RUN apk update
RUN apk upgrade
RUN apk add py3-pip netcdf netcdf-dev netcdf-utils hdf5-dev \
            musl-dev linux-headers g++ gfortran cmake openblas-dev \
            py3-requests py3-protobuf py3-elementpath py3-wrapt \
            py3-wheel py3-h5py py3-pandas py3-isodate 

ENV PYTHONPATH=/usr/lib/python3.10/site-packages         

RUN python3 -m pip install pip --upgrade 

COPY ./requirements.txt ./
RUN python3 -m pip install -r requirements.txt --upgrade

COPY ./PVForecast ./

CMD [ "python3", "PVForecasts.py"]