/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   to_s.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mzhukova <mzhukova@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/21 18:03:42 by mzhukova          #+#    #+#             */
/*   Updated: 2023/11/21 19:03:13 by mzhukova         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"
#include <strings.h>

char	*to_s( va_list *args)
{
	char	*res;

	res = strdup(va_arg(*args, const char *));
	if (!res)
		return (NULL);
	return (res);
}
