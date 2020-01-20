# jupyter
Overview:
The docker image will create a jupyter instance with all the datascience modules that I normally use.  

## Create an image
docker image build -t <name>:<version> .
  
## Docker Run
docker run -p 8080:8080 -v ~/jupyter:/home/jupyter 
