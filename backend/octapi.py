from flask import Flask, render_template, request, jsonify
from oct2py import Oct2Py

app = Flask(__name__, static_folder='static')
oc = Oct2Py()
oc.addpath('../octave')

@app.route('/')
def index():
    return render_template("index.html")

@app.route('/api/calcular', methods=['GET'])
def calcular():
    x = request.args.get('x', type=float, default=0.0)
    try:
        out = oc.calcular(x)
        result = float(out)
        return jsonify({'x': x, 'result': result})
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(port=5000, debug=True)
