/*
** PERSONAL PROJECT, 2020
** CritTests
** File description:
** test
*/

#include <criterion/criterion.h>
#include <criterion/redirect.h>

#include <stdlib.h>

Test(string, eq)
{
    cr_redirect_stdout();

    system("./executable");

    cr_assert_stdout_eq_str("BAKA <3\n");
}