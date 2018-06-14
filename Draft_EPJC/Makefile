article:
	pdflatex article
	bibtex article
	pdflatex article
	pdflatex article

clean:
	rm  *.out *.log *.aux *.pdf *.bbl *.blg *.tgz
 
tarball:
	tar -czvf article.tgz article.tex article.bbl feynman figures svepjc3.clo svglov3.clo svjour3.cls utphys.bst

diff:
	latexdiff ../Draft_arXiv/article.tex article.tex > article_diff.tex
	pdflatex article_diff
	bibtex article_diff
	pdflatex article_diff
	pdflatex article_diff

