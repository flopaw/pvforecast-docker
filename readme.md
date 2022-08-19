# RUN PVForecast Container

```bash
docker run -v $(pwd)/config.ini:/usr/app/src/config.ini pvforecast
```

# BUILD DOCKER IMAGE

```bash
docker build . -t pvforecast
```
