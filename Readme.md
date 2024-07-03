# OHMS-viewer

This is an automated repository creating a docker image based on [OHMS-viewer](https://github.com/uklibraries/ohms-viewer).

The image repository is available here: https://hub.docker.com/r/wjentner/ohms-viewer


## Usage

> This assumes you have docker/podman or similar installed on your machine.

OHMS viewer requires a configuration file (XML).
This file must be either created manually or preferably exported, e.g., through OHMS Studio.
In OHMS Studio, click on the three-dot-menu of a video/audio file and click "Export XML".
We assume here that the file is named `my_config.xml`.

Create a directory `ohms-viewer` and another directory in it `cachefiles`:

```
ohms-viewer
|-- cachefiles
|   |-- my_config.xml
```

Open a terminal from the `ohms-viewer` directory. Then use following command to start ohms-viewer:

```bash
docker run -p "8080:80" -v "$(pwd)/cachefiles:/usr/local/share/cachefiles" wjentner/ohms-viewer:latest
```

In your browser, go to the URL http://localhost:8080/viewer.php?cachefile=my_config.xml

You can add more XML files into the folder, then adjust the URL parameter.
