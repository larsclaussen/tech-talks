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



plpgsql is a full-fledged procedural language, with variables, looping constructs, etc.
A SQL function is simply a subquery. A SQL function, if it is declared STABLE or IMMUTABLE
and not also declared STRICT, can often be inlined into the calling query, as if it were written out on each reference.



PL/pgSQL is the only programming language installed by default for PostgreSQL, but many others are available, including PL/Java,[4] PL/Perl,[5] PL/pgPSM,[6] PL/php,[7] PL/Python,[8] PL/R,[9] PL/Ruby,[10] PL/sh, PL/Tcl, and PL/Lua. PostgreSQL uses Bison as its parser,[11] making it easy to port many open-source languages, as well as to reuse code.


from http://bonesmoses.org/2015/05/08/pg-phriday-functions-and-performance-attributes/
more here: https://books.google.nl/books?id=Q8jkIZkMTPcC&pg=PA102&lpg=PA102&dq=pgsql+STABLE+IMMUTABLE+STRICT&source=bl&ots=HF2QXHz_xO&sig=sOtxjuyQvPHlCf6Qv5UP2dpsgkM&hl=nl&sa=X&ved=0ahUKEwj8tcbe_eDMAhWGfxoKHWAnCtUQ6AEIZTAJ


 function declaration decorators
 --------------------------------

As of PostgreSQL 9.4, there are four that will actually impact performance: VOLATILE, STABLE, STRICT, and IMMUTABLE.

STABLE attribute is a bit more stringent. The implication in this case, is that the function can not modify the contents of the database in any way

IMMUTABLE keyword, which takes the optimization one step further. This tells the planner that the function will always return the same result for the same parameters.
Due to that guarantee, function calls can tacitly be replaced by the the cached results where that benefits the planner

Finally comes the STRICT decorator. It goes one step further than IMMUTABLE and assumes that a function with any NULL parameters will also return NULL.
Again, this is an optimization where the planner can completely substitute a function call with NULL, thereby not only removing the function execution itself,
but avoiding the requisite function parameter and return value mapping.

from: http://www.divillo.com/

COST
----

"execution_cost

    A positive number giving the estimated execution cost for the
function, in units of cpu_operator_cost. If the function returns a
set, this is the cost per returned row. If the cost is not specified,
1 unit is assumed for C-language and internal functions, and 100 units
for functions in all other languages. Larger values cause the planner
to try to avoid evaluating the function more often than necessary. "


on cost and declaration http://www.cybertec.at/2013/05/functions-the-most-widely-ignored-performance-tweak/



 Asynchronous Notification
 -------------------------
 If you have five minutes I will describe a technique that can be used for any number of things including the following:

    Automatically reload from a table after it has been modified.
    Send an email when inventory is low.
    Print a shipping memo when someone places an order.
    Sound an alarm when some horrible situation arises. Like if Barry Manilow subscribed to your mailing list.

What?

If you are using PostgreSQL for your database server you can take advantage of a really cool feature called notify to send signals between connections to the same database. Usage is simple.

LISTEN at_disney_land;
NOTIFY at_disney_land;

 
