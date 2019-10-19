RESUME=resume-classica.tex
AWESOMECV=awesome-cv.cls
TEX=xelatex

resume: $(RESUME) awesome-cv.cls
	$(TEX) -file-line-error -interaction=nonstopmode $(RESUME)

awesome-cv.cls:
	wget -O $(AWESOMECV) https://raw.githubusercontent.com/npjg/Awesome-CV/master/awesome-cv.cls

clean:
	rm -f *.aux *.log *.fls *.fdb_latexmk *.out

PHONY: .clean
