# mountebank-with-ui-node

Hosted at: https://hub.docker.com/r/djangofan/mountebank-with-ui-node/

A preconfigured docker image containing a [mountebank](http://www.mbtest.org/) server and also a pre-compiled [mountebank-UI](https://github.com/donhenton/mountebank-UI).   My intention here is to load pre-configured imposters on a port but also allow you to load more via the mountebank-UI.   For each new imposter you load, you may need to edit the Docker configuration to allow that new port.

When building docker image, Docker build will copy in UI content that comes from the mountebank-UI project, which I build separately.  If you want to build it yourself, I have left clues here on how to do that.

Please copy this project and alter it for your own use.

Hosted on Docker Hub.

For your rest client, I recommend using Insomnia, rather than Postman (because Postman is over-engineered).  I include an import file here if you want my default set of http queries.


## Easy Start

    ./build-it.sh

    ./run-container.sh

## Run

Run the image as follows

    docker run -p 2424:80 -p 2525:2525 -p 9000:9000 -d djangofan/mountebank-with-ui-node

Alternatively, use --net=host to use the host network and avoid need to specify all the imposter ports upfront

    docker run --net=host -d djangofan/mountebank-with-ui-node

## Configure

Once running, access mountebank-UI on port 2424.  Tell the mountebank-UI to import the restaurant imposters into 
  your mountebank back-end Java service on port 2525 .

Then, when query mountebank back-end Java service at /imposters,  you'll see one registered imposter on port 9000.


## Examples

    http://192.168.99.100:2424/ - access the mountebank-UI

    http://192.168.99.100:2525/imposters - access the imposter configuration

    ```
    # query an imposter registered on port 9000
    curl --request GET \
      --url http://192.168.99.100:9000/restaurant
    ```


## Technical

There is a gmaps-sample.xml file in the UI folder, that I think is the source of the sample restaurants imposters we load that are part of this project.

I would like to draw your attention to: https://hub.docker.com/r/portainer/portainer/
