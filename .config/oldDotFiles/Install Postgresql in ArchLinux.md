# Install PostgreSQL on Arch Linux

### Install and Get Started with PostgreSQL on Arch Linux

PostgreSQL is a powerful object-relational database management system.  PostgreSQL strongly complies to ANSI SQL standard 2008. It is an open source and cross platform database. It is an enterprise class database.

## Installing PostgreSQL

First update the package database of pacman package manager with the following command:

	$ sudo pacman -Sy

PostgreSQL is available in the official package repository of Arch Linux. So you can install PostgreSQL very easily.


You can run the following command to install PostgreSQL on Arch Linux:

	$ sudo pacman -S postgresql

Now press ‘y’ and then press \<Enter> to continue.

PostgreSQL should be installed.


Now you can run the following command to check the version of PostgreSQL you’ve installed.

	$ postgres --version


Now you can run the following command to check whether PostgreSQL is running or not.

	$ sudo systemctl status postgresql


As you can see, PostgreSQL is not running.

You may think all you have to do now is to start PostgreSQL. But you’re wrong. You can’t start PostgreSQL now as the data directory of PostgreSQL is not initialized yet.

Before you can initialize the data directory of PostgreSQL, you must login as the postgres user with the following command:

	$ sudo su - postgres

Now you’re logged in as postgres user.

>NOTE: You should always login as postgres user to use or do any type of administration of PostgreSQL. Otherwise you may get permission errors and things might not work as expected. 


Now you can initialize the data directory of PostgreSQL with the following command:

	$ initdb --locale en_US.UTF-8 -D /var/lib/postgres/data

The data directory is generated at this stage.


Now logout of postgres user with the following command:

	$ exit

You should be logged out of postgres user account.

Now that the data directory of PostgreSQL is generated, you can start PostgreSQL with the following command:

	$ sudo systemctl start postgresql


You can run the following command to check whether PostgreSQL is running again with the following command:

	$ sudo systemctl status postgresql


As you can see, the PostgreSQL database server is running.


Now you should add PostgreSQL to the system startup so that it will start automatically on system boot.

Run the following command to add PostgreSQL to system startup:

	$ sudo systemctl enable postgresql

PostgreSQL should be added to the system startup


## Using PostgreSQL


In this section I will show you the basics of PostgreSQL.

Before you do anything, log in as postgres user with the following command:

	$ sudo su - postgres

You’re logged in as postgres user.

### Creating a Database:

You can use the createdb command to create a database in PostgreSQL.

Let’s say you want to create a database **testDB**. You can run the following command to create **testDB** database:

	$ createdb testDB

The **testDB** database should be created.


### Using a Database

You can use **psql** command to login to an existing database that you created with **createdb** command.


You can run the following command to login to **testDB** database.

	$ psql testDB


As you can see, you’re logged in to the **testDB** database.


### Executing SQL Command

Once you’re logged in to a database using **psql** command, you can execute PostgreSQL compatible SQL commands.


For example, you can run the following SQL statement to check the current date.

	$ SELECT CURRENT_DATE;

### Creating a Table on PostgreSQL:

You can run the following SQL statements to create a table **users** on PostgreSQL:

	CREATE TABLE users (
	firstname            VARCHAR(20),
	lastname             VARCHAR(20)
	);


### Inserting into the Table

You can insert into the newly created **users** table using the following SQL statement:

	INSERT INTO users VALUES(‘Abdullah Al’, ‘Hasib’);

### Selecting Data from Table

You can run the following SQL statement to select all the data from the **users** table.

	SELECT * FROM users;

That’s how you install and get started with PostgreSQL on Arch Linux.


### Graphical tools

[phpPgAdmin](https://wiki.archlinux.org/index.php/PhpPgAdmin) — Web-based administration tool for PostgreSQL.

	$ sudo pacman -S phppgadmin

[pgAdmin](https://www.pgadmin.org/) — Comprehensive design and management GUI for PostgreSQL.

	$ sudo pacman -S pgadmin4

or

	$ yay -S pgadmin3



## Problem you might encounter with

    could not save history to file "/var/lib/postgres/.psql_history": No such file or directory

> To solve this, i did a bit hacky solution.

- First create a file with sudo to avoid permission problem.

		$ sudo touch /var/lib/postgres/.psql_history  

- Let's check the files:

		$ ls -alh /var/lib/postgres/

		drwxr-xr-x  3 root     root     4.0K Nov  3 23:01 .
		drwxr-xr-x 22 root     root     4.0K Nov  3 22:29 ..
		-rw-r--r--  1 root     root     6 Nov     3 23:02 .psql_history
		drwx------ 19 postgres postgres 4.0K Nov  3 22:32 data

- Then change the ownership of the file

		$ sudo chown postgres:postgres /var/lib/postgres/.psql_history

This will change the owner and group of the file to **postgres**

		$ ls -alh /var/lib/postgres/

		drwxr-xr-x  3 root     root     4.0K Nov  3 23:01 .
		drwxr-xr-x 22 root     root     4.0K Nov  3 22:29 ..
		-rw-r--r--  1 postgres postgres 6 Nov     3 23:02 .psql_history
		drwx------ 19 postgres postgres 4.0K Nov  3 22:32 data  
		
- Here **postgres** is postgreSQL username.

Problem solved. :)











































