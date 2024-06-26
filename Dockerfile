FROM python:3.10
WORKDIR /app
COPY . /app
RUN apt-get update && apt-get install -y libpq-dev build-essential
RUN pip install --no-cache-dir -r requirements.txt

# Default port for Jupyter notebooks
EXPOSE 8888

ENTRYPOINT [ "jupyter", "notebook", "--ip='0.0.0.0'", "--allow-root" ]

# docker build -t nb .
# docker run -it --gpus all -p 8888:8888 nb