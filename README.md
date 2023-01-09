[![CircleCI](https://dl.circleci.com/status-badge/img/gh/RikuVan/ml-microservice-k8s/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/RikuVan/ml-microservice-k8s/tree/main)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

## Getting started

### Prerequisites

To run the app locally you will need to have python@3.7.3 installed on your system. Alternatively you can just build the docker image, which requires Docker to be installed.

#### Setup the Environment

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
* Run `make install` to install the necessary dependencies

#### Starting the app

```bash
python app.py

```

#### With Docker

```
./run_docker.sh
```

### Run in Kubernetes:

```
./run_kubernetes.sh
```

Other `make` commands include `lint` to lint the dockerfile and python code.

#### Deployment to Kubernetes


* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container via `./upload_docker.sh` script
* Run via kubectl or `./run_kubernetes.sh`


### Specification

#### Files Submitted

- [x] All files are submitted

The submitted repository includes a .circleci folder, a README.md file, a Dockerfile and Makefile, as well as an app.py file, a prediction script, and the necessary scripts to run and upload a microservice on Docker and Kubernetes.
There should also be two output text files: docker_out.txt and kubernetes_out.txt that include the log output after a prediction is made, given some sample input data.

NOTE: Before submitting a link to your complete, project repository, make sure you have included all required and complete files (including run_kubernetes.sh, run_docker.sh, docker_out.txt, kubernetes_out.txt, and a .circleci build directory).

- [x] .circleci folder is included

A .circleci folder is included in the Github repository. The directory holds a config.yml that checks the project code for errors. Your project should pass, as indicated by a CircleCI status badge in the repository README.

#### Code Quality & Enhancement

- [x] Extend app.py to log a prediction value

Add an additional logging statement to app.py that prints as “info” the output prediction for some given input data.

- [x] The project shows the proper use of documentation

The README file includes a summary of the project, how to run the Python scripts and web app, and an explanation of the files in the repository.

- [x] The project passes linting via a Makefile

Both the Dockerfile and the python file pass linting using pylint and hadolint. This may involve selectively customizing lint overrides in both tools. The lint should be run for both tools via the command make lint. Circleci build server validates step.

### Docker Configuration

 - [x] Dockerfile is complete

The Dockerfile should create a working directory, install the necessary dependencies, expose port 80, and specify that app.py run at container launch.

 - [x] Dockerfile passes linting via a Makefile

The Dockerfile should pass make lint without errors. Circleci build server validates step.

 - [x] Log output is saved in docker_out.txt

While running the docker container, call the prediction script, make_predictions.sh; the log output, which includes the output prediction value, should be included in your submission as a text file, docker_out.txt.

 - [x] run_docker.sh is complete

Build, list, and run steps are completed in run_docker.sh.

 - [x] Docker image is uploaded to docker via upload_docker.sh

The built docker image is uploaded to your own personal Docker ID, as indicated by a complete upload_docker.sh.

#### Kubernetes Configuration

- [x] run_kubernetes.sh is complete

- [x] This script runs a docker image with kubernetes, lists the kubernetes pod(s), and forwards the container port to a host, using kubectl appropriately.

- [x] An output prediction is saved in kubernetes_out.txt

- [x] While running on kubernetes, call make_predictions.sh; the terminal output should be included in your submission as a text file, kubernetes_out.txt.