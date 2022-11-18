FROM jupyter/datascience-notebook:python-3.9.2

EXPOSE 8080

ENTRYPOINT ["jupyter", "lab", "--ip", "0.0.0.0", "--allow-root", "--config", "/etc/jupyter/jupyter_notebook_config.py"]

COPY jupyter_notebook_config.py /etc/jupyter/
COPY requirements.txt .

RUN pip install -r requirements.txt

WORKDIR /src
COPY . /src