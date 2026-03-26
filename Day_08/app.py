from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Day 07, task 2, path=/"

@app.route("/health")
def health():
    return "Day 07, task 2 - HEALTHY"
#comment
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=4567)