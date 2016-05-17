stored procedures in postgres
-----------------------------


The PL/Python procedural language allows PostgreSQL functions to be written in the Python language.

Advantages

Reduce the number of round trips between application and database servers. All SQL statements are wrapped inside a function
stored in the PostgreSQL database server so the application only has to issue a function call to get the result back instead of
sending multiple SQL statements and wait for the result between each call. 

Increase application performance because user-defined functions pre-compiled and stored in the PostgreSQL database server.


Disadvantages 

Make it difficult to manage versions and hard to debug.
May not be portable to other database management systems e.g., MySQL or Microsoft SQL Server.



PL/pgSQL Function Overloading

PostgreSQL allows more than one function to have the same name, so long as the arguments are different. If more than one function has the same name, we say those functions are overloaded. When a function is called, PostgreSQL determines exact function is being called based on the input arguments.



plpgsql is a full-fledged procedural language, with variables, looping constructs, etc. A SQL function is simply a subquery. A SQL function, if it is declared STABLE or IMMUTABLE and not also declared STRICT, can often be inlined into the calling query, as if it were written out on each reference.



PL/pgSQL is the only programming language installed by default for PostgreSQL, but many others are available, including PL/Java,[4] PL/Perl,[5] PL/pgPSM,[6] PL/php,[7] PL/Python,[8] PL/R,[9] PL/Ruby,[10] PL/sh, PL/Tcl, and PL/Lua. PostgreSQL uses Bison as its parser,[11] making it easy to port many open-source languages, as well as to reuse code.

 function declaration decorators
 --------------------------------

As of PostgreSQL 9.4, there are four that will actually impact performance: VOLATILE, STABLE, STRICT, and IMMUTABLE.

