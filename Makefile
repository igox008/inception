
all :
	@mkdir -p /home/igo/data/mariadb
	@mkdir -p /home/igo/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up --build

clean:
	@docker compose -f srcs/docker-compose.yml down -v

fclean: clean
	@docker system prune -af --volumes
	@rm -rf /home/igo/data/mariadb/* /home/igo/data/wordpress/*

re: fclean all