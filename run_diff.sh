DIRECTORY1=latex_projects/1.original_project
DIRECTORY2=latex_projects/2.edited_project

for DIR in "$DIRECTORY1" "$DIRECTORY2"
do
    if [ ! -d "$DIR" ]; then
        echo "Directory $DIR does not exist"
        exit
    fi
done


if [ -n "$1" ] && [ ! -d "$1" ]; then
    echo "Directory $1 does not exist"
    exit
fi

for FILE in "$DIRECTORY1/main.tex" "$DIRECTORY2/main.tex"
do
    if [ ! -f "$FILE" ]; then
        echo "File $FILE does not exist"
        exit
    fi
done

cd $DIRECTORY2
GIT_STATUS=`git fetch --dry-run 2>&1`

if [ -z "$GIT_STATUS" ]
then
      echo "No new updates found on server. Nothing to Compile."
      exit
else
      echo "New updates found on server"
      echo $GIT_STATUS
      echo ""
      git fetch
      git pull
      cd ../../

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

      if [ -n "$1" ]
      then
        cp diff.pdf "$1"
      else
        open diff.pdf
      fi
      cd ../../
fi

