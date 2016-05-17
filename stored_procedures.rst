stored procedures in postgres
-----------------------------

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
