RED = \033[0;31m
NC = \033[0m # No Color
all :
	@echo "still need change volumes path..."
	@mkdir -p ~/Desktop/data/mariadb
	@mkdir -p ~/Desktop/data/wordpress
	@rm -rf mariadb/* wordpress/*
	@docker compose -f ./srcs/docker-compose.yml up --build
nginx :
	docker build -t nginx ./srcs/requirements/nginx
	docker run -d -p 443:443 --name test nginx

mariadb :
	docker build -t mariadb ./srcs/requirements/mariadb
	docker run -d  --name db mariadb

wordpress :
	docker build -t wordpress ./srcs/requirements/wordpress
	docker run -d  --name wp wordpress

clean:
	@docker compose -f srcs/docker-compose.yml down -v

fclean: clean
	docker system prune -af --volumes
	@echo "$(RED)don't forget to run \`rm -rf ~/Desktop/data/mariadb/* ~/Desktop/data/wordpress/*\` $(NC)"
	@rm -rf mariadb/* wordpress/*

re: fclean all