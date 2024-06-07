RESET	=	\033c
GREEN	=	\033[1;32m
RED		=	\033[0;31m
CYAN	=	\033[0;36m
WHITE	=	\033[0m

# @echo "$(RESET)"
MAKEFLAGS = -s

all:
	@make -C ../
	@python3 srcs/test.py

re: fclean all test

clean_temp:
	@rm -f .moves .results

fclean: clean clean_temp
	@make fclean -C ../
	@rm -f $(NAME)

clean: clean_temp
	@make clean -C ../

.PHONY: re fclean clean clean_temp
