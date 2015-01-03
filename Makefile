Src=$(shell cd src; ls)


all: htmls commit

htmls: $(subst .md,.html,$(Src))

commit: 
	- git status
	- git commit -am "stuff"
	- git push origin master

update:
	- git pull origin master

status:
	- git status

%.html : src/%.md etc/template.html
	pandoc -s --toc \
	    --highlight-style=pygments \
	    --template=etc/template.html \
	    -o $@ $<

%.html : src/%.html etc/template.html
	pandoc -s --toc  \
	    --highlight-style=pygments \
	    --template=etc/template.html \
	    -o $@ $<

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
