DIRECTORY1=latex_projects/1.original_project
DIRECTORY2=latex_projects/2.edited_project

for DIR in "$DIRECTORY1" "$DIRECTORY2"
do
    if [ ! -d "$DIR" ]; then
        echo "Directory $FILE does not exist"
        exit
    fi
done

for FILE in "$DIRECTORY1/main.tex" "$DIRECTORY2/main.tex"
do
    if [ ! -f "$FILE" ]; then
        echo "File $FILE does not exist"
        exit
    fi
done

cd $DIRECTORY1
pdflatex -interaction=nonstopmode main.tex
bibtex main
cd ../../

cd $DIRECTORY2
pdflatex -interaction=nonstopmode main.tex
bibtex main
cd ../../

latexdiff $DIRECTORY1/main.tex $DIRECTORY2/main.tex --flatten > latex_projects/2.edited_project/diff.tex

cd $DIRECTORY2
pdflatex -interaction=nonstopmode diff.tex

open diff.pdf
cd ../../

