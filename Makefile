.PHONY: help install lint test format clean

help:
	@echo "Доступные команды:"
	@echo "  make install    - Установка зависимостей"
	@echo "  make lint       - Запуск flake8"
	@echo "  make test       - Запуск тестов"
	@echo "  make format     - Форматирование кода (если добавишь black/isort)"

install:
	pip install -r requirements.txt

lint:
	flake8 src/ notebooks/ --max-line-length=100 --extend-ignore=E501

test:
	pytest tests/ -v

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete