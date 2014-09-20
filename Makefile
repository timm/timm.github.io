markdown="../sbse14.wiki"

all: publish commit

commit: ready
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
	@echo '<img align=right  src="{{site:base-url}}/img/pdfdownload.jpg" >'	 >> $@
	@echo '' >> $@
	@echo 'For more information of these files, [see here](http://goo.gl/BORLn4).' >> $@
	@echo '' >> $@
	@$(foreach f, $(shell ls pdf/*.pdf),echo '+ [$(notdir $f)]({{site:base-url}}/$f)' >> $@;)
