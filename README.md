# Summary:
I created this image to stay consistent while moving from computer to computer.  I setup a jupyter server on my home computer but I occasionally burn it to the ground and rebuild.  This docker image will save me time standing up a whole new instance.

The script interfaces with my github and executes update scripts everytime I run the instance.  

Version 2 will include securing jupyter

## Create an image
docker image build -t aebench:1 .
  
## Docker Run
<p>Expose ports 8888</p>
<p>Mount volume ~/jupyter to /home/jupyter inside the container for persistent storage</p>
<p>docker run -p 8888:8888 -v ~/jupyter:/home/jupyter aejupyter</p>
<p>
The one liner exposes TCP 8888.
<p>
Volume mount ~/jupyter to the container folder /home/jupyter
