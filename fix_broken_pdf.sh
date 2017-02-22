#ghostscript converter from:
# http://tex.stackexchange.com/questions/64448/how-to-overcome-acrobat-reader-error-131-with-a-pdflatex-doc
gs -dSAFER -dBATCH -dNOPAUSE  -sDEVICE=pdfwrite -sOutputFile=output.pdf input.pdf
