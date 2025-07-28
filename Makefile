NAME	= inception
YAML	= ./srcs/docker-compose.yml
COMPOSE	= docker-compose -p $(NAME) -f $(YAML)

all: up

up:
	mkdir -p ${HOME}/data/wordpress
	mkdir -p ${HOME}/data/mariadb
	$(COMPOSE) up --build -d

clean:
	$(COMPOSE) down --remove-orphans

fclean:
	$(COMPOSE) down --remove-orphans --volumes
	docker system prune -af
	docker volume prune -f
	sudo rm -rf ${HOME}/data/wordpress
	sudo rm -rf ${HOME}/data/mariadb

dclean: fclean
	docker stop $(docker ps -qa); \
	docker rm $(docker ps -qa); \
	docker rmi -f $(docker images -qa); \
	docker volume rm $(docker volume ls -q); \
	docker network rm $(docker network ls -q) 2>/dev/null

re:
	$(COMPOSE) down
	$(COMPOSE) up --build -d

.PHONY: all up clean fclean dclean re
