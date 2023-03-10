FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY requirements.txt app.py ./
COPY model_data ./model_data

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --no-cache-dir --upgrade setuptools wheel --use-pep517 pip &&\
    pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

## Step 4:
# Expose port 80
EXPOSE 80

# Need if pipe the logs to a file and map to volume
# RUN mkdir logs

## Step 5:
# Run app.py at container launch
CMD ["python", "app.py"]