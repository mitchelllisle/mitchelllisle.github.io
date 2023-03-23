.PHONY: install serve install-ruby install-jekyll
.DEFAULT_GOAL := help

install: ## to install the dependencies
	bundle install

serve:
	bundle exec jekyll serve

install-ruby:
	ruby-install ruby 3.1.3

install-jekyll:
	gem install jekyll
