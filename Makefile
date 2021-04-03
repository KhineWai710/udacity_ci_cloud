install:
	pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb


lint:
	pylint --disable=R,C app.py

all: install lint test

build:
	docker build -t flask-hello:latest .

run:
	docker run -p 8080:5000 flask-hello
	
run-kube:
	kubectl apply -f kube_config.yaml
	
invoke:
	curl http://127.0.0.1:8080/