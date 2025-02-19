all:
	@mkdir -p /home/lgernido/data/wordpress
	@mkdir -p /home/lgernido/data/mariadb
	@docker compose -f ./srcs/docker-compose.yml up --build

down:
	@docker compose -f ./srcss/docker-compose.yml down

re:
	@docker compose -f srcs/docker-compose.yml up --build

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\

.PHONY: all re down clean