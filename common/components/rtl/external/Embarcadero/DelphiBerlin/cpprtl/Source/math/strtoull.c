/*-----------------------------------------------------------------------*
 * filename - strtoull.c
 *
 * function(s)
 *        Get     - gets the next character in a string
 *        UnGet   - moves a character pointer one position forward
 *        strtoull - convert a string to an unsigned long long integer
 *        wcstoull - convert a wide-character string to an unsigned long long integer
 *-----------------------------------------------------------------------*/

/*
 *      C/C++ Run Time Library - Version 24.0
 *
 *      Copyright (c) 2008, 2016 by Embarcadero Technologies, Inc.
 *      All Rights Reserved.
 *
 */

/* $Revision: 23293 $        */

#include <stdlib.h>
#include <limits.h>
#include <ctype.h>
#include <errno.h>
#include <_scanf.h>
#include <stddef.h>
#include <tchar.h>
#include <_tchar.h>

/*---------------------------------------------------------------------*

Name            Get - gets the next character in a string

Usage           static int Get(char **strPP);

Return value    the next character in a string.  It return -1 if the next
                character is the null character.

*---------------------------------------------------------------------*/

static _TINT Get(_TCHAR **strPP)
{
        register unsigned       c;

        return ((c = *((*strPP) ++)) == 0) ? -1 : c;
}


/*---------------------------------------------------------------------*

Name            UnGet - moves a character pointer one position forward

Usage           static void UnGet(char c, char **strPP);

Description     decrements a character pointer

*---------------------------------------------------------------------*/

#pragma warn -par

static void UnGet(_TCHAR c, _TCHAR **strPP)
{
        --(*strPP);     /* ignore c, we don't allow the string to change */
}

#pragma warn .par

/*-------------------------------------------------------------------------*

Name            strtoull,wcstoull - convert a string to an unsigned long long integer

Usage           unsigned long long strtoul(const char *strP, char **suffixPP,
                                      int radix);
                unsigned long long wcstoul(const wchar_t *strP, wchar_t **suffixPP,
                                      int radix);

Prototype in    stdlib.h

Description     Convert a string to an unsigned long long integer. The syntax of
                the string must be:

                unsigned long   ::= [isspace]* [+] numeral;

                numeral         ::= { '0' ['x'|'X'] digit [digit]* } |
                                    { digit [digit] }

                "strP"  is a  pointer to  the ASCII  string to  be scanned.
                "suffixPP" is a pointer to  a string pointer to be updated.
                If suffixPP  is not NULL  then the updated  pointer will be
                set to point  to the first character following  the section
                of  the string  which was   consumed. Thus  the caller  can
                easily analyze subsequent contents of the string.

                The radix may be zero, or any number 2..36. If the radix is
                zero, then a radix will be chosen from the possibilities 8,
                10, or 16, by the usual "C" rules for distinguishing octal,
                decimal, and hex numerals.

                If radix > 10 then the  letters of the alphabet "A..Z" form
                the extended set of valid digits.

Return value    If the  radix is invalid or  no number could be  found then
                the result  value is zero   and the next  char pointer will
                equal the starting string pointer.

                If  the  number  overflows,  ULLONG_MAX  or  ULLONG_MIN will be
                returned and errno will be set to ERANGE.

----------------------------------------------------------------------------*/

unsigned long long _RTLENTRY _EXPFUNC _tcstoull(const _TCHAR *strP, _TCHAR **suffixPP, int radix)
{
        int     charCt = 0;
        int     status = 0;
        unsigned long long result;


        while ((int)_istspace(*strP))	//JAF
        {
                strP++;
                charCt++;
        }

        errno = 0;
        result = __scanttoint64((GetF *)Get,
				(UnGetF *)UnGet,
				&strP,
				radix,
				0x7FFF,
				&charCt,
				&status,
                                1);

        if (status <= 0)
                strP -= charCt;
        else if (status == 2)
        {
                result = ULLONG_MAX;
                errno = ERANGE;
        }
        if (NULL != suffixPP)
                *suffixPP = (_TCHAR *)strP;

        return (result);
}
