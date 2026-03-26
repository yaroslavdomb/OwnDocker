FROM python:3.12-slim
# declaration of new user creation
RUN useradd --no-create-home --shell /bin/false --uid 1000 appuser
#all the below will be executed as ROOT - as we do not switch user context
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
#change privileges for app and all internals folders
RUN chown -R appuser:appuser /app
#from here we are under appuser
USER appuser
CMD ["python", "app.py"]