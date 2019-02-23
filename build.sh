pandoc src/*.md src/metadata.yaml --template latekiss --resource-path src -V hidelinks -V monochrome -o src/thesis_monochrome_oneside.tex
pandoc src/*.md src/metadata.yaml --template latekiss --resource-path src -V hidelinks -V monochrome -V twoside -o src/thesis_monochrome_twoside.tex
pandoc src/*.md src/metadata.yaml --template latekiss --resource-path src -o src/thesis_color_oneside.tex
pandoc src/*.md src/metadata.yaml --template latekiss --resource-path src -V twoside -o src/thesis_color_twoside.tex
cd src
pdflatex thesis_monochrome_oneside.tex 
bibtex thesis_monochrome_oneside  
pdflatex thesis_monochrome_oneside.tex 

pdflatex thesis_monochrome_twoside.tex 
bibtex thesis_monochrome_twoside  
pdflatex thesis_monochrome_twoside.tex 

pdflatex thesis_color_oneside.tex 
bibtex thesis_color_oneside  
pdflatex thesis_color_oneside.tex 

pdflatex thesis_color_twoside.tex 
bibtex thesis_color_twoside  
pdflatex thesis_color_twoside.tex 
cd ..

mkdir out
mv src/*.pdf out/
rm src/thesis*
