# gumgum_project
Project Requirements: 
- Python 
- Bash 
- Github 
- Heroku 
- Docker 
- Drone CI 
- Json 
- Linux 

GumGum Project: 

- .drone.yml : Drone CI pipeline integration 

- Dockerfile : Docker setup for single key/value request #install docker dependency
           
           $docker build -t caching-service . (To build/install redis enviornmnet, installs requirments and starts the server on port 5000)
     (dot indicates Dockerfile under root directory of the project)
           
           $docker exec -it e12f2a2b193 bash (e12f2a2b193 -> Image ID, caching-service -> docker image/repo name)
  
  Commands to push to dockerhub:
  
      $Docker login #Enter dockerhub username and password
      $docker tag e12f2a2b193 ramesh0476/redis_cache_service:1.1
      $docker push ramesh0476/redis_cache_service:1.1


- Procfile : heroku app specifications 

       <process type>: <command>

- README.md: Documentation 

- Heroku: Automation script for Heroku creation/deployment using bash
  Command : $heroku gumgum-caching-service (arg $1 name of the heroku repo/project)
     Manual heroku deplyment process:
       
        $heroku login #Login with heroku username and password and integrate with Auth CLI
        $git init
        $heroku git:remote -a gumgum-caching-service
        $git add .
        $git commit -am "heroku deploy"
        $git push heroku master

- Requirments.txt: Dependencies

      $flask==1.0.2
      $redis==3.0.1

- Server.py: caching service with single request #Note: required redis server to install and start the service
    
      COMMAND: $python Server.py 

       POST: curl --request POST --header "Content-Type: application/json" --data '{"value":"Hello ramesh"}' http://localhost:5000/set/test 
       GET: curl http://localhost:5000/get/test

- Multikey_server.py: caching service with multiple request 

       COMMAND: $python mutiple_server.py

   Multiple values post: 

       curl --request POST --header "Content-Type: application/json" --data '{"value":"Hello ramesh"}' http://localhost:5000/set/key1 

       curl --request POST --header "Content-Type: application/json" --data '{"value":"Hello gumgum"}' http://localhost:5000/set/key2 

       curl --request POST --header "Content-Type: application/json" --data '{"value":"gumgum project"}' http://localhost:5000/set/key3 

       On browser hit : http://localhost:5000/get/?key1&key2&key3 

 
