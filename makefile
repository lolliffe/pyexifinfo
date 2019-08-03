npm-install:
	@rm --force package-lock.json
	@rm --force --recursive npm-modules/
	@npm install

runserver:
	python manage.py runserver 0:8000

local-stendup: npm-install
	grunt
	python manage.py runserver 0:8000

pip_install:
	pip install --no-cache-dir -r ./requirements.txt

pip_uninstall:
	pip uninstall -y -r ./requirements.txt

help:
	@echo "clean"
	@echo "Удаляет промежуточные файлы сборки проекта."

	@echo "upload"
	@echo "Загружает версию сборки kaf-pas"

clean:
	rm --force --recursive build/
	rm --force --recursive dist/
	rm --force --recursive *.egg-info

migrate:
	python3 manage.py migrate

makemigrations:
	python3 manage.py makemigrations

upload: clean
	python3 setup.py sdist bdist_wheel
	twine upload -u ivc-inform  dist/*
