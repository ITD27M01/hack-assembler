.ONESHELL:
SHELL = /bin/bash

default: update

VIRTUAL_ENV?=~/venv/hack-assembler

.PHONY: clean
clean:
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
check:
	@source $(VIRTUAL_ENV)/bin/activate
	@pip -q install flake8
	@flake8 --ignore=W605,E501 assembler

.PHONY: install
install:
	@source $(VIRTUAL_ENV)/bin/activate
	@python setup.py install

.PHONY: update
update:
	@source $(VIRTUAL_ENV)/bin/activate
	$(MAKE) clean
	$(MAKE) check
	$(MAKE) install
	@clear

.PHONY: sdist
sdist:
	@source $(VIRTUAL_ENV)/bin/activate
	$(MAKE) clean
	@python setup.py sdist

.PHONY: upload
upload:
	@source $(VIRTUAL_ENV)/bin/activate
	$(MAKE) clean
	$(MAKE) sdist
	@twine upload dist/*
