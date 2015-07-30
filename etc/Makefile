e=.
f=../src
t=..
files=$(shell cd $f; ls * | gawk '{print "'$t'/" $$1 ".html" }')

all: ${files}

# $(etc)/head.sh $(etc)/tail.sh

../%.html : $f/%
	@ echo $@
	@ - bash $e/make.sh "$e" "$<" > $@
	@ git add $@

install:
	brew install tidy-html5
