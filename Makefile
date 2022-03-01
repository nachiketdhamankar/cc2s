DOCKER_COMPOSE := docker-compose
DOCKER_COMPOSE_YML := --file docker-compose.yml
ENV_FILE := --env-file env/.env.dev
ifneq ("$(wildcard docker-compose.local.yml)","")
DOCKER_COMPOSE_YML += --file docker-compose.local.yml
endif

language := go

SUCCESS_MESSAGE := "✅ $(language) quickstart is running on http://localhost:3000"

.PHONY: up
up:
	REACT_APP_API_HOST=http://$(language):8000 \
	$(DOCKER_COMPOSE) \
		$(DOCKER_COMPOSE_YML) \
		$(ENV_FILE) \
		$@ --build --detach --remove-orphans \
		$(language)
	@echo $(SUCCESS_MESSAGE)

.PHONY: logs
logs:
	$(DOCKER_COMPOSE) \
		$@ --follow \
		$(language) frontend

.PHONY: stop build
stop build:
	$(DOCKER_COMPOSE) \
		$(DOCKER_COMPOSE_YML) \
		$@ \
		$(language) frontend


#REACT_APP_API_HOST=http://go:8000 docker-compose --file docker-compose.yml --env-file env/.env.dev up --build --detach --remove-orphans go