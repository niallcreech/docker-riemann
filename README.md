# Reimann Docker Image

##### Usage

* Reimann container

    docker run --net host -p 5555:5555 -p 5556:5556 registry.service.dsd.io/platforms/riemann:master.latest

* Reimann Dashboard

    docker run --net host -p 4567 registry.service.dsd.io/platforms/riemann-dash:master.latest
