# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: psegura- <psegura-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/10 23:55:52 by psegura-          #+#    #+#              #
#    Updated: 2023/04/17 17:02:47 by psegura-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RESET	=	\033c
GREEN	=	\033[1;32m
RED		=	\033[0;31m
CYAN	=	\033[0;36m
WHITE	=	\033[0m

NAME = ../push_swap

$(NAME): $(OBJS)
	@make -C ../
	
all: $(NAME) 

re: fclean all test

fclean: clean
	@make fclean -C ../
	@rm -f $(NAME)

clean:
	@make clean -C ../

m: $(NAME)
	@make -C ../
	@echo "$(RESET)"
	@ruby srcs/main.rb

.PHONY: m re fclean clean
