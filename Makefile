all :
	@echo "nothing done yet here!!"

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