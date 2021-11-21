#!/bin/bash

yes | sudo yum install pip

pip install Flask

python3 flaskServer.py