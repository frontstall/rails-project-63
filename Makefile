install:
	bundle install

test:
	rake test

lint:
	rake rubocop

.PHONY: test
