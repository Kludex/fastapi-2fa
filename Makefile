.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: lint
lint:  ## Linter the code.
	isort fastapi_2fa --check
	flake8 .
	mypy .

.PHONY: test
test:  ## Test your code.
	poetry run pytest tests/ --cov=fastapi_2fa --cov-report=term-missing:skip-covered --cov-report=xml
