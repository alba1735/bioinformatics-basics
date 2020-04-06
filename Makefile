DOCKER_PORT ?= 4000

jekyll-server-macos:
	docker run \
		-v `pwd`:/srv/jekyll \
		-v `pwd`/.gems:/usr/local/bundle \
		-p $(DOCKER_PORT):4000 \
		-it jekyll/jekyll:latest \
		jekyll serve

jekyll-server-windows:
	docker run \
		-e "JEKYLL_ENV=docker" \
		-v `pwd`:/srv/jekyll \
		-v `pwd`/.gems:/usr/local/bundle \
		-p $(DOCKER_PORT):4000 \
		-it jekyll/jekyll:latest \
		jekyll serve \
		--config _config.yml,_config.docker.yml \
		--force_polling

jekyll-build:
	docker run \
		-v `pwd`:/srv/jekyll \
		-v `pwd`/.gems:/usr/local/bundle \
		-it jekyll/jekyll:latest \
		jekyll build

upload:
	scp -r _site/* abagi@morty.soe.ucsc.edu:/soe/abagi/.html/pub/biobasics/.
