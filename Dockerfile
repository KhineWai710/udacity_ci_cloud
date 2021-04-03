FROM python:3.7.3-stretch

# Working Directory
WORKDIR /app

# Copy source code to working directory
COPY app.py /app/
COPY requirements.txt /app/
COPY Makefile /app/
COPY kube_config.yml /app/
COPY Dockerfile /app/

# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

# Expose port 80
EXPOSE 80

#Run app.py at container launch
# ENTRYPOINT [ "flask"]
# CMD [ "run", "--host", "0.0.0.0" ]

ENTRYPOINT ["python"]
CMD ["app.py"]