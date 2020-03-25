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

    system("./executable 3 + 3");

    system("./executable 3 / 3");

    system("./executable 3 - 3");

    system("./executable 3 * 3");

    cr_assert_stdout_eq_str("6\n1\n0\n9\n");
}