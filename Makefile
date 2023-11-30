
# NAME = libftprintf.a
# CC = cc 
# CFLAGS = -Wall -Wextra -Werror 

# # Source files for libftprintf.a
# SRCS = ft_printf.c to_char.c to_s.c to_hexuplow.c to_undecim.c input_len.c to_int.c to_hex.c
# OBJS = $(SRCS:.c=.o)

# # Library
# LIBFT = libft/libft.a
# LIBFT_DIR = libft

# # Executable for testing
# EXECUTABLE = a.out
# EXEC_SRC = ft_printf.c
# EXEC_OBJ = $(EXEC_SRC:.c=.o)

# # Main target
# all: $(LIBFT) $(NAME) $(EXECUTABLE)

# # Building the libft library
# $(LIBFT):
# 	$(MAKE) -C $(LIBFT_DIR)

# # Rule to compile your library
# $(NAME): $(OBJS)
# 	ar rcs $(NAME) $(OBJS)

# # Rule to make the executable (for testing)
# $(EXECUTABLE): $(EXEC_OBJ) $(NAME)
# 	$(CC) $(CFLAGS) $(EXEC_OBJ) -o $@ -L$(LIBFT_DIR) -lft -L. -lftprintf

# # Generic rule for object files
# %.o: %.c
# 	$(CC) $(CFLAGS) -I$(LIBFT_DIR) -c $< -o $@

# # Cleaning up
# clean:
# 	rm -f $(OBJS) $(EXEC_OBJ)
# 	$(MAKE) -C $(LIBFT_DIR) clean

# fclean: clean
# 	rm -f $(EXECUTABLE) $(NAME)
# 	$(MAKE) -C $(LIBFT_DIR) fclean

# re: fclean all

# .PHONY: all clean fclean re

# #TO SUBMIT:
NAME = libftprintf.a
CC = cc 
CFLAGS = -Wall -Wextra -Werror

SRCS =	ft_printf.c \
		to_char.c \
		to_s.c \
		to_hexuplow.c \
		to_undecim.c \
		input_len.c \
		to_int.c \
		to_hex.c

OBJS = $(SRCS:.c=.o)


LIBFT = ./libft/libft.a
LIBFT_DIR = ./libft

all: $(LIBFT) $(NAME) 

$(LIBFT):
	$(MAKE) -C $(LIBFT_DIR)

$(NAME): $(OBJS)
	$(MAKE) -C $(LIBFT_DIR)
	@cp libft/libft.a .
	@mv libft.a $(NAME)
	ar rcs $(NAME) $(OBJS)

$(EXECUTABLE): $(OBJS)
	$(CC) $(OBJS) -o $@ -L$(LIBFT_DIR) -lft

clean:
	rm -f $(OBJS)
	$(MAKE) -C $(LIBFT_DIR) clean

fclean: clean
	rm -f $(NAME)
	$(MAKE) -C $(LIBFT_DIR) fclean

re: fclean all

.PHONY: all clean fclean re
