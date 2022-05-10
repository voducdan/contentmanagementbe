* Server ssh (```.pem``` file will be sent in email)
    ```ssh -i ptm.voiz.vn.pem ubuntu@54.251.84.14```

## Local run
* Download [this file](https://drive.google.com/file/d/1bdq6O3WMhPTBNqJEiwYb3WdJDc-CFQAu/view?usp=sharing) then create a local database for testing
* Create .env file in root folder having below content
    ```
    DB_HOST=localhost
    DB_PORT=<LOCAL_PORT>
    DB_USER=<LOCAL_USER>
    DB_PASSWORD=<LOCAL_PWD>
    DB_NAME=<LOCAL_NAME>
    JWT_SECRET=<SECRET_STR>
    ```
* Install packages
    ```npm i```
* Start server
    * Run on dev mode
        ``` npm run dev```
    * Run on prod mode
        ``` npm start ```

# Staging & Prod run ( ```.env``` file is already on staging & prod server)
* Install packages
    ``` npm i```
* Build frontend follow [this discription](https://bitbucket.org/danvowewe/content-management-fe/src/master/README.md)
* Start server
    ``` npm start ```

>  Database is running on server 
> Server is running inside a tmux session, use ``` tmux ls``` to check if a tmux session exists before running to avoid conflict port
