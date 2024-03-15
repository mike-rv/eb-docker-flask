from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello, Mati!"

# This condition ensures that the app only runs if this script is executed directly
if __name__ == '__main__':
    # Run the app on the development server
    app.run(debug=True, host='0.0.0.0')
