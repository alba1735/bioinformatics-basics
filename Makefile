docker run -it --rm -e JEKYLL_UID=`id -u` -e JEKYLL_GID=`id -g` -v `pwd`/:/srv/jekyll jekyll/jekyll:latest jekyll new bmecrashcourse
