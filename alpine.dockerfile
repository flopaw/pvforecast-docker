FROM python:3.10-alpine AS builder

WORKDIR /usr/app/src

RUN apk update
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN apk add py3-pip netcdf netcdf-dev netcdf-utils hdf5-dev \
            musl-dev linux-headers g++ gfortran cmake openblas-dev
 
RUN python3 -m pip install pip --upgrade 
RUN python3 -m pip install wheel --upgrade 
RUN python3 -m pip install numpy 

COPY ./requirements.txt ./
RUN python3 -m pip install -r requirements.txt


FROM python:3.10-alpine

WORKDIR /usr/app/src

RUN apk add openblas hdf5 netcdf

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY --from=builder /opt/venv /opt/venv

COPY ./PVForecast ./

CMD [ "python3", "PVForecasts.py"]