/* ************************************************************************** */
/*	                                                                        */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mzhukova <mzhukova@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/20 13:28:15 by mzhukova          #+#    #+#             */
/*   Updated: 2023/11/21 17:01:57 by mzhukova         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

char	*to_string(const char *s, va_list *args)
{
	if (*s == 'c')
		return (to_char((char)va_arg(*args, int)));
	if (*s == 's')
		return (to_s(args));
	// if (s == 'p')
	// 	return (to_hex(s, args));Val
	// if (s == 'd')
	// 	return (to_decim(s, args));
	// if (s == 'i')
	// 	return (to_int(s, args));
	// if (s == 'u')
	// 	return (to_undecim(s, args));
	// if (s == 'x')
	// 	return (to_hexlow(s, args));
	// if (s == 'X')
	// 	return (to_hexup(s, args));
	if (*s == '%')
		return ("%%");
	return (NULL);
}

int	ft_printf(const char *s, ...)
{
	int		num_args;
	char	*to_print;
	va_list	args;

	num_args = strlen(s);
	va_start(args, s);
	while (*s != '\0')
	{
		if (*s == '%')
		{
			s++;
			to_print = to_string(s, &args);
			if (to_print)
			{
				write(1, to_print, strlen(to_print));
				free(to_print);
			}
		}
		else
			write(1, s, 1);
		s++;
	}
	va_end(args);
	return (0);
}

int main()
{
	ft_printf("Hello %s %s", "beautiful",  "World");
	return (0);
}
