from flask import Flask, render_template, request
import numpy as np

app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def index():
    result = {}
    if request.method == "POST":
        try:
            numbers = request.form["numbers"]
            data = np.fromstring(numbers, sep=",")
            result["sum"] = np.sum(data)
            result["mean"] = np.mean(data)
            result["std"] = np.std(data)
            result["data"] = data
        except:
            result["error"] = "Invalid input. Please enter comma-separated numbers."
    return render_template("index.html", result=result)

if __name__ == "__main__":
    app.run(debug=True)
