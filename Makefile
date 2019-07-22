# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vafanass <vafanass@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/02/15 12:51:54 by vafanass          #+#    #+#              #
#    Updated: 2019/07/22 16:57:21 by vafanass         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Compilation
CC =		clang
CFLAGS =	-Wall -Wextra -Werror
ADDFLAGS =	

# Default rule
DEFRULE =	all

# Binary
NAME =		libftprintf.a
DST =		

# Directories
SRCDIR =	src
OBJDIR =	obj
INCDIR =	includes
LIBDIR =	

# Sources
SRC =\
	       libft/ft_bzero.c \
		   libft/ft_isascii.c \
		   libft/ft_memset.c \
		   libft/ft_strlen.c \
		   libft/ft_toupper.c \
		   libft/ft_isalnum.c \
		   libft/ft_isdigit.c \
		   libft/ft_strcpy.c \
		   libft/ft_strncpy.c \
		   libft/ft_isalpha.c \
		   libft/ft_isprint.c \
		   libft/ft_tolower.c \
		   libft/ft_memcpy.c \
		   libft/ft_memmove.c \
		   libft/ft_memccpy.c \
		   libft/ft_strcat.c \
		   libft/ft_strncat.c \
		   libft/ft_strlcat.c \
		   libft/ft_strchr.c \
		   libft/ft_strrchr.c \
		   libft/ft_strcmp.c \
		   libft/ft_strncmp.c \
		   libft/ft_strstr.c \
		   libft/ft_strnstr.c \
		   libft/ft_atoi.c \
		   libft/ft_memchr.c \
		   libft/ft_memcmp.c \
		   libft/ft_putchar.c \
		   libft/ft_putstr.c \
		   libft/ft_putendl.c \
		   libft/ft_putnbr.c \
		   libft/ft_putchar_fd.c \
		   libft/ft_putstr_fd.c \
		   libft/ft_putendl_fd.c \
		   libft/ft_putnbr_fd.c \
		   libft/ft_strdup.c \
		   libft/ft_memalloc.c \
		   libft/ft_memdel.c \
		   libft/ft_strnew.c \
		   libft/ft_strclr.c \
		   libft/ft_strdel.c \
		   libft/ft_strequ.c \
		   libft/ft_strnequ.c \
		   libft/ft_itoa.c \
		   libft/ft_striter.c \
		   libft/ft_striteri.c \
		   libft/ft_strmap.c \
		   libft/ft_strsub.c \
		   libft/ft_strjoin.c \
		   libft/ft_strtrim.c \
		   libft/ft_strmapi.c \
		   libft/ft_strsplit.c \
		   libft/ft_lstnew.c \
		   libft/ft_lstdelone.c \
		   libft/ft_lstdel.c \
		   libft/ft_lstadd.c \
		   libft/ft_lstiter.c \
		   libft/ft_lstmap.c \
		   libft/ft_power.c \
		   libft/ft_swap.c \
		   libft/ft_recursive_factorial.c \
		   libft/ft_foreach.c \
		   libft/ft_sqrt.c \
		   libft/ft_abs.c \
		   libft/ft_islower.c \
		   libft/ft_isupper.c \
		   libft/ft_isspace.c \
		   libft/ft_strrev.c \
		   get_next_line.c

LIB =		
OBJ =		$(SRC:.c=.o)

# Prefixes
LLIBP =		$(addprefix -l, $(LIB))
LIBP =		$(addprefix lib, $(LIB))
OBJP =		$(addprefix $(OBJDIR)/, $(SRC:.c=.o))
OBJS_DIRS = $(sort $(dir $(OBJP)))

# **************************************************************************** #
# SPECIAL CHARS

LOG_CLEAR		= \033[2K
LOG_UP			= \033[A
LOG_NOCOLOR		= \033[0m
LOG_BOLD		= \033[1m
LOG_UNDERLINE	= \033[4m
LOG_BLINKING	= \033[5m
LOG_BLACK		= \033[1;30m
LOG_RED			= \033[1;31m
LOG_GREEN		= \033[1;32m
LOG_YELLOW		= \033[1;33m
LOG_BLUE		= \033[1;34m
LOG_VIOLET		= \033[1;35m
LOG_CYAN		= \033[1;36m
LOG_WHITE		= \033[1;37m

# **************************************************************************** #
# RULES

.PHONY: glu dev

# Main rules
default:
	@echo -e "$(LOG_BOLD)Default execution: rule $(DEFRULE)$(LOG_NOCOLOR)"
	@make $(DEFRULE)
	@echo -e "$(LOG_BOLD)Execution finished     $(LOG_NOCOLOR)ヽ(ヅ)ノ"
	

glu: re
	@make clean

all: $(NAME)

re: fclean all

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@echo -e "--$(LOG_CLEAR)$(LOG_VIOLET)$(NAME)$(LOG_NOCOLOR).................... $(LOG_YELLOW)$<$(LOG_NOCOLOR)$(LOG_UP)"
	@$(CC) $(CFLAGS) -c -o $@ $^ -I$(INCDIR)

$(OBJDIR):
	@echo -e "$(LOG_CLEAR)$(LOG_BLUE)build $(NAME)$(LOG_NOCOLOR)"
	@mkdir -p $(OBJDIR)
	@mkdir -p $(OBJS_DIRS)

$(NAME): $(OBJDIR) $(OBJP)
	@echo -e "--$(LOG_CLEAR)$(LOG_VIOLET)$(NAME)$(LOG_NOCOLOR)..................... $(LOG_YELLOW)assembling$(LOG_NOCOLOR)$(LOG_UP)"
	@ar rc $(DST)$(NAME) $(OBJP)
	@ranlib $(DST)$(NAME)
	@echo -e "--$(LOG_CLEAR)$(LOG_VIOLET)$(NAME)$(LOG_NOCOLOR) compiled........... $(LOG_GREEN)✓$(LOG_NOCOLOR)"


clean:
	@echo -e "$(LOG_CLEAR)$(LOG_BLUE)fclean $(NAME)$(LOG_NOCOLOR)"
	@echo -e "--$(LOG_CLEAR)$(LOG_YELLOW)Objects$(LOG_NOCOLOR) deletion............. $(LOG_RED)×$(LOG_NOCOLOR)"
	@rm -rf $(OBJDIR)

fclean:
	@echo -e "$(LOG_CLEAR)$(LOG_BLUE)fclean $(NAME)$(LOG_NOCOLOR)"
	@echo -e "--$(LOG_CLEAR)$(LOG_YELLOW)Objects$(LOG_NOCOLOR) deletion............. $(LOG_RED)×$(LOG_NOCOLOR)"
	@rm -rf $(OBJDIR)
	@echo -e "--$(LOG_CLEAR)$(LOG_YELLOW)Binary$(LOG_NOCOLOR) deletion.............. $(LOG_RED)×$(LOG_NOCOLOR)"
	@rm -f $(NAME)
