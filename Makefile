markdown="../sbse14.wiki"

all: publish commit

commit: #ready
	- git status
	- git commit -am "stuff"
	- git push origin master

ready: pdf.md

update:
	- git pull origin master

status:
	- git status

markup:
	@$(foreach  f, $(shell ls *.py), bash py2md $f --force ; )

publish: markup
	cd $(markdown); git add *py.md; make commit

files:
	@echo "# Code:"
	@$(foreach  f, $(shell ls *.py), echo "+ [[$f]]: $f"; )


pdf.md : pdf/*
	@echo '---' > $@
	@echo 'title: Pdf file archive' >> $@
	@echo 'layout: page' >> $@
	@echo '---' >> $@	
	@echo '' >> $@	
	@echo '<img width=100 align=middle  src="{{site:base-url}}/img/pdfdownload.jpg" >'	 >> $@
	@echo 'For more information on any of these files, [please see here](http://goo.gl/BORLn4).<br clear=all><hr>' >> $@
	@echo '' >> $@
	@$(foreach f, $(shell ls pdf/*.pdf),echo '+ [$(notdir $f)]({{site:base-url}}/$f)' >> $@;)
