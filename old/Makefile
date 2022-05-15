lua=$(shell which lua)
mds=$(shell ls *.md)
# 
all: $(mds:.md=.html) index

title=gawk 'gsub(/^#+ /,"") { print $0; exit}'#

%.html : %.md #etc/template.html etc/about.html
	@echo "$< ==> $@"
	@cd etc; $(lua)  lust.lua ../$<  markdown > ../$@
	@git  add $@
	
index :
	@echo "index0.html ==> index.html"
	@cd etc; $(lua)  lust.lua ../index0.html html > ../index.html
	@git  add index.html	

Make = $(MAKE) --no-print-directory #

all :
	@cd etc; $(MAKE) 

typo:  ready 
	@- git status
	@- git commit -am "saving"
	@- git push origin master

commit:   ready
	@- git status
	@- git commit -a
	@- git push origin master

update: ready; @- git pull origin master
status:; @- git status

ready: gitting timm

gitting:
	@git config --global credential.helper cache
	@git config credential.helper 'cache --timeout=3600'

your:
	@git config --global user.name "Your name"
	@git config --global user.email your@email.address

timm:
	@git config --global user.name "Tim Menzies"
	@git config --global user.email tim.menzies@gmail.com
