.ONESHELL:
SHELL = /bin/bash

default: update

VIRTUAL_ENV?=~/venv/hack-assembler
TWINE_USERNAME=__token__

venv:
	@python3 -m venv $(VIRTUAL_ENV)

.PHONY: init
init: venv ## Initialize environment
	@source venv/bin/activate
	@pip install flake8
	@pip install twine

.PHONY: clean
clean: venv
	@source $(VIRTUAL_ENV)/bin/activate
	@python setup.py clean
	@rm -rf dist
	@rm -rf .tox
	@rm -rf build
	@rm -rf .pytest_cache
	@find . -name "*.pyc" -delete
	@rm -rf *.egg-info
	@pip uninstall hack-assembler -y

.PHONY: check
check: venv
	@source $(VIRTUAL_ENV)/bin/activate
	@pip -q install flake8
	@flake8 --ignore=W605,E501 assembler

.PHONY: install
install: venv
	@source $(VIRTUAL_ENV)/bin/activate
	@python setup.py install

.PHONY: update
update: venv
	@source $(VIRTUAL_ENV)/bin/activate
	$(MAKE) clean
	$(MAKE) check
	$(MAKE) install
	@clear

.PHONY: sdist
sdist: venv
	@source $(VIRTUAL_ENV)/bin/activate
	$(MAKE) clean
	@python setup.py sdist

.PHONY: upload
upload: venv
	@source $(VIRTUAL_ENV)/bin/activate
	$(MAKE) clean
	$(MAKE) sdist
	@twine upload dist/*
