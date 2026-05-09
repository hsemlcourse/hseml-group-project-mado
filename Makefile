.PHONY: help install lint run docker-build docker-up docker-down docker-clean

help:
	@echo "Доступные команды:"
	@echo "  make install      - установка зависимостей"
	@echo "  make lint         - запуск flake8 (проверка кода)"
	@echo "  make run          - запуск Jupyter Notebook"
	@echo "  make docker-build - сборка Docker образа"
	@echo "  make docker-up    - запуск Docker контейнера"
	@echo "  make docker-down  - остановка Docker контейнера"

install:
	pip install -r requirements.txt

lint:
	flake8 src/ --count --select=E9,F63,F7,F82 --show-source --statistics
	flake8 src/ --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics

run:
	jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root

docker-build:
	docker-compose build

docker-up:
	docker-compose up

docker-down:
	docker-compose down

docker-clean:
	docker-compose down -v
	docker system prune -f