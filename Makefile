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

.PHONY: install
install:
	@source $(VIRTUAL_ENV)/bin/activate
	@python setup.py install

.PHONY: update
update:
	@source $(VIRTUAL_ENV)/bin/activate
	$(MAKE) clean
	$(MAKE) install
	@clear

.PHONY: check
check:
	@source $(VIRTUAL_ENV)/bin/activate
	@pip -q install pycodestyle
	@pycodestyle --ignore=W605,E501 assembler
