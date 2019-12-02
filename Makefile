help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

submodules: ## Instala los submodulos de git, bajando y actualizando desde los repositorios
	git submodule init
	git submodule update --recursive --remote

build: ## Genera las imagenes de docker
	docker-compose build

docker: ## Genera y corre las imagenes de docker
	docker-compose up --build -d

all: submodules build ## Realiza "submodules" -> "build" en ese orden.

.PHONY: help submodule mongo build all
