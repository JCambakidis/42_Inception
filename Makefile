SRCS	=	srcs/docker-compose.yml

all:	up

up:
	mkdir -p /Users/jcambaki/Desktop/inception/data/mariadb
	mkdir -p /Users/jcambaki/Desktop/inception/data/wordpress
	docker-compose -f $(SRCS) up --build -d
down:
	docker-compose -f $(SRCS) down

ps:
	docker-compose -f $(SRCS) ps

top:
	docker-compose -f $(SRCS) top
clean:
	docker-compose -f $(SRCS) down --rmi all -v
fclean:
	docker-compose -f $(SRCS) down --rmi all -v
	rm -rf /Users/jcambaki/Desktop/inception/data/

prune:	fclean
	docker system prune -f --all --volumes

.PHONY:	all up down ps top clean fclean prune