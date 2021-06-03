# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jtambra <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/03 23:03:42 by jtambra           #+#    #+#              #
#    Updated: 2021/06/04 00:09:19 by jtambra          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY: all clean fclean re

NAME = libftprintf

LIBFT = libft

SRC = $(addprefix ./srcs/,\
		ft_printf.c ft_utils.c ft_c_parse.c ft_diu_parse.c ft_num_utils.c \
		ft_p_parse.c ft_s_parse.c ft_type_parse.c ft_x_parse.c)

SRC_OBJECTS = $(patsubst %.c,%.o,$(SRC))

HEADERS = /includes/ft_printf.h

FLAGS = -Wall -Wextra -Werror -g $(HEADERS)

all: MKLIB $(NAME).a

MKLIB:
	make -C $(LIBFT)
$(NAME).a: $(LIBFT)/$(LIBFT).a $(SRC_OBJECTS)
	cp $(LIBFT)/$(LIBFT).a ./$(NAME).a
	ar rcs $(NAME).a $(SRC_OBJECTS)

%.o: %.c $(HEADERS)
	@gcc $(FLAGS) -c $< -o $@
	@echo "$@ added"
clean:
	@/bin/rm -rf $(SRC_OBJECTS)
	make -C $(LIBFT) clean
	@echo "All objects removed"

fclean: clean
	@/bin/rm -rf $(NAME).a
	make -C $(LIBFT) fclean
	@echo "$(NAME) removed"

re:
	make -C $(LIBFT) fclean
	make fclean
	make all

bonus: all

