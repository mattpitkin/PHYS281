.SUFFIXES:

default: mkdocs.yml
	mkdocs build
	cp docs/img/minicondainstallation.cast site/demo-anaconda/
	cp docs/img/condacreate.cast site/demo-anaconda/

clean:
	rm -rf site __pycache__ docs/javascripts/glossary.js
