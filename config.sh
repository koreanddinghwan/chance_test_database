echo "This script will create .env file to save Database Connection Information"
read -p "please enter your database host: " host
read -p "port: " port
read -p "your database name: " database
read -p "user name(this user should have access permission)" user
read -p "user password: " password

echo 
"
	HOST=${host}
	PORT=${port}
	DATABASE=${database}
	DBUSER=${user}
	PASSWORD=${password}
" > .env.dev

echo "Finished your configuration~!"
