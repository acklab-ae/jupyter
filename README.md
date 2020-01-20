# jupyter
Overview:
The docker image will create a jupyter instance with all the datascience modules that I normally use.  

## Create an image
docker image build -t aebench:1 .
  
## Docker Run
<p>Expose ports 8888</p>
<p>Mount volume ~/jupyter to /home/jupyter inside the container for persistent storage</p>
<p>docker run -p 8888:8888 -v ~/jupyter:/home/jupyter aejupyter </p>
