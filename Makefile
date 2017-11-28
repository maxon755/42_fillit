#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mgayduk <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/28 08:37:35 by mgayduk           #+#    #+#              #
#    Updated: 2017/11/28 09:45:31 by mgayduk          ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME = fillit

# Output settings
DEFAULT	:=\033[0m
BOLD	:=\033[1m
GREEN	:=\033[0;32m
RED		:=\033[0;31m

# Compiler
CC		= gcc
FLAGS	= -Wall -Wextra -Werror

# Directories
SRC_DIR := ./src
OBJ_DIR := ./obj
INC_DIR := ./includes
LFT_DIR := ./libft

# Source files
SRC :=	main.c

# Object files
OBJ := $(addprefix $(OBJ_DIR)/, $(SRC:.c=.o))

#includes
INC := $(addprefix -I, $(INC_DIR))

# printI:
# 		@echo "$(INC)"
# Libft
LFT := libft.a

.PHONY = all clean

all: $(NAME)

$(NAME): $(OBJ)
	@echo "$(GREEN)Compiling libft...$(DEFAULT)"
	@make -C $(LFT_DIR) all --silent
	@echo "$(GREEN)Compiling $(NAME)...$(DEFAULT)"
	@$(CC) $(FLAGS) $(OBJ) $(LFT_DIR)/$(LFT) -o $(NAME)
	@echo "$(GREEN)$(BOLD)DONE.\n$(DEFAULT)"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	@$(CC) $(FLAGS) $(INC) -c $< -o $@

clean:
	@echo "$(RED)Cleaning libft...$(DEFAULT)" 
	@make -C $(LFT_DIR) clean --silent
	@echo "$(RED)Cleaning $(NAME) o-files...$(DEFAULT)"
	@rm -rf $(OBJ)
	@rm -r $(OBJ_DIR)
	@echo "$(GREEN)$(BOLD)DONE.\n$(DEFAULT)"

fclean: clean
	@echo "$(RED)Deleting libft.a...$(DEFAULT)" 
	@rm -rf $(LFT_DIR)/$(LFT)
	@echo "$(RED)Deleting fillit...$(DEFAULT)" 
	@rm -rf $(NAME)
	@echo "$(GREEN)$(BOLD)DONE.\n$(DEFAULT)"

re: fclean all



