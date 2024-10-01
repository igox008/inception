all :
	@echo "still need change volumes path..."
	@mkdir ~/Desktop/data/mariadb
	@mkdir ~/Desktop/data/wordpress
	@rm -rf mariadb/* wordpress/*
	@docker compose -f srcs/docker-compose.yml up --build
nginx :
	docker build -t nginx ./srcs/requirements/nginx
	docker run -d -p 443:443 --name test nginx

mariadb :
	docker build -t mariadb ./srcs/requirements/mariadb
	docker run -d  --name db mariadb

wordpress :
	docker build -t wordpress ./srcs/requirements/wordpress
	docker run -d  --name wp wordpress

fclean :
	docker system prune -af --volumes