FROM python:3.7.3-stretch
WORKDIR /application
COPY . /application
RUN pip install --upgrade pip &&\
    pip install -r requirements.txt
EXPOSE 80
CMD ["python", "app.py"]
