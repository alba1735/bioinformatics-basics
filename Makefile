#docker run -it --rm -e JEKYLL_UID=`id -u` -e JEKYLL_GID=`id -g` -v `pwd`/:/srv/jekyll jekyll/jekyll:latest jekyll new bmecrashcourse
#https://pmarsceill.github.io/just-the-docs/docs/configuration/
#DOCKER_PORT ?= 56222
DOCKER_PORT ?= 4000

jekyll-server:
	docker run \
	  -v `pwd`:/srv/jekyll \
	  -v `pwd`/.gems:/usr/local/bundle \
		-p $(DOCKER_PORT):4000 \
		-it jekyll/jekyll:latest \
		jekyll serve

jekyll-build:
	docker run \
  	-v `pwd`:/srv/jekyll \
	  -v `pwd`/.gems:/usr/local/bundle \
		-p $(DOCKER_PORT):4000 \
		-it jekyll/jekyll:latest \
		jekyll build
