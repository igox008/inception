
all :
	@mkdir -p /home/alaassir/data/mariadb
	@mkdir -p /home/alaassir/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up --build

clean:
	@docker compose -f srcs/docker-compose.yml down -v

fclean: clean
	@docker system prune -af --volumes
	@rm -rf /home/alaassir/data/mariadb/* /home/alaassir/data/wordpress/*

re: fclean all