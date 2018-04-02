#!/bin/bash
nohup /bin/bash -c "http-server -p 80 /ui" &
nohup /bin/bash -c "mb --port 2525 --configfile /mb/imposters.ejs --allowInjection --allow-CORS"
