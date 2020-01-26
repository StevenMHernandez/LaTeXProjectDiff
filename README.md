# LaTeX Project Diff Script

When working on larger LaTeX projects such as on Overleaf, it can be useful to view a full pdf comparing the diff between two different versions of your project. For example, if you want to compare two different _labelled_ versions as a *fully formatted* pdf. 

1. `git clone https://github.com/StevenMHernandez/LaTeXProjectDiff.git`
2. `cd LaTeXProjectDiff`
3. Download and unzip from Overleaf
4. Copy all files from the older verion to `./latex_projects/1.original_project`. (Note: these scripts assume a `main.tex` file will be located at this directory)
5. Copy all files from the more recent verion to `./latex_projects/2.edited_project`. (Note: these scripts assume a `main.tex` file will be located at this directory)
6. Run this shell script: `sh run_diff.sh`

The diff-pdf should open after the script has completed.
