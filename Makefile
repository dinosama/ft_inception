# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aaapatou <aaapatou@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/28 21:41:41 by aaapatou          #+#    #+#              #
#    Updated: 2024/04/24 02:22:17 by aaapatou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception

ENV = ./srcs/.env

RM = /bin/rm -rf

.PHONY: all clean fclean re

all: $(ENV)
	@if [ ! -d "/home/aaapatou/data/inception" ]; then \
	echo "data folder not found."; \
	echo "creating data folder..."; \
	mkdir "/home/aaapatou/data/inception"; \
	mkdir "/home/aaapatou/data/inception/wordpress"; \
	mkdir "/home/aaapatou/data/inception/mariadb"; \
	chmod 777 -R "/home/aaapatou/data/inception"; \
	fi;
	docker-compose -f ./srcs/docker-compose.yml up -d --build

$(ENV):
	cp "/home/aaapatou/Bureau/.env" "srcs/.env"

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);

fclean:
	docker-compose -f ./srcs/docker-compose.yml down
	${RM} "/home/aaapatou/data/inception"

re: fclean
	docker compose -f scrs/docker-compose.yml up -d --build
