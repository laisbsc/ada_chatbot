FROM python:3.7-slim
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN python -m nltk.downloader all
COPY . /app/
WORKDIR /app
RUN python train_chatbot.py
RUN python chatbot_function.py
CMD gunicorn --bind 0.0.0.0:80 wsgi:app