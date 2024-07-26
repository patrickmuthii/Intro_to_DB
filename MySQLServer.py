import mysql.connector
from mysql.connector import errorcode

def create_database(cursor, db_name):
    try:
        cursor.execute(
            f"CREATE DATABASE IF NOT EXISTS {db_name} DEFAULT CHARACTER SET 'utf8'"
        )
        print(f"Database '{db_name}' created successfully!")
    except mysql.connector.Error as err:
        print(f"Failed creating database: {err}")

def main():
    db_name = "alx_book_store"
    
    try:
        # Connect to MySQL Server
        cnx = mysql.connector.connect(
            user='root',
            passwd='@patorocky1.',
            host='localhost'
        )
        cursor = cnx.cursor()

        # Create the database
        create_database(cursor, db_name)

        # Close cursor and connection
        cursor.close()
        cnx.close()
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print(err)
    else:
        print("Connection closed")

if __name__ == "__main__":
    main()

