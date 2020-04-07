# LaTeX Project Diff Script

When working on larger LaTeX projects such as on Overleaf, it can be useful to view a full PDF comparing the diff between two different versions of your project. 
For example, if you want to compare two different _labelled_ versions as a *fully formatted* PDF. 
This script automatically loads new changes from a git repository containing your LaTeX project (for example, from the git functionality offered by Overleaf). 
The system can be setup with a cronjob to automatically load changes and generate an output PDF with additions and deletions plainly marked in red and blue. 

1. `git clone https://github.com/StevenMHernandez/LaTeXProjectDiff.git`
2. `cd LaTeXProjectDiff`
3. Download and unzip from Overleaf
4. Copy all files from the older verion to `./latex_projects/1.original_project`. (Note: these scripts assume a `main.tex` file will be located at this directory)
5. Git clone overleaf project: `git clone https://git.overleaf.com/ ./latex_projects/2.edited_project`. (Note: these scripts assume a `main.tex` file will be located at this directory)
6. Run this shell script: `sh run_diff.sh`

The `diff.pdf` should open after the script has completed.

Alternatively, automatically copy the `diff.pdf` to some other directory: `sh run_diff.sh "/User/Some/Random/Output/Folder"`. 
Note, the selected directory should be fully qualified (beware of relative paths!). 
In this case, the PDF will not be opened automatically, but instead simply copied to the given folder.

The script may be setup as a cronjob:

```
crontab -e
```

To run the script every ten minutes add:

```
*/10 * * * * cd /User/.../.../LaTeXProjectDiff && /bin/sh ./run_diff.sh /User/Some/Random/Output/Folder >/dev/null 2>&1
```

Cron usage is currently not fully tested. User `$PATH` variable and git credentials may not be shared between the terminal user and the cron user.