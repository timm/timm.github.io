Baked=.#
Raw=.#
Bake=.
Htmls=$(subst .md,.html,$(Src))
Template=$(Bake)/etc/template.html
Hilite=pygments

Src=$(shell cd $(Raw)/src; ls)

commit: htmls save

save:
	- git status
	- git commit -am "stuff"
	- git push origin master

update:
	- git pull origin master

status:
	- git status

htmls: $(Baked)/$(subst .html ,.html $(Baked)/,$(Htmls))

$(Baked)/%.html : $(Raw)/src/%.md $(Template)
	pandoc -s --toc \
             -f markdown+definition_lists+pipe_tables\
	    --highlight-style=$(Hilite) \
	    --template=$(Template) \
	    -o $@ $<

$(Baked)/%.html : $(Raw)/src/%.html $(Template)
	pandoc -s --toc  \
             -f markdown+definition_lists+pipe_tables\
	    --highlight-style=$(Hilite) \
	    --template=$(Template) \
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
