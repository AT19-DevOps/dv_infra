AT19 Converter & Recognition Studio v.1.0.11 (FLDSMDFR)
-------------------------------------------------------

* How it works?
----

"play.sh" is a linux script command line instructions for automate the process to build and run 
a docker images for the project. This script do the following actions:

    1. Verifies the "files" directory is in place. If not, the script doesn't continue.
    2. Clone remote repositories to a local disk.
    3. Move "files" directory to its correspondent directory.
    4. Creates and start Docker containers for MySql, MongoDb, Converter, Machime Learning,
       Web Converter, Web Machine Learning, phpMyAdmin.

-----
* Prerequisites
-----

Be sure you are in a Linux environment, can be native or Windows Bash.   
IMPORTANT! Make sure have a DOCKER installed and running on your system

1. Create a new directory or folder and enter to it. Make sure is empty.
2. Download https://drive.google.com/uc?id=1r9uNR5Fh3EJM8a2oUM2xPtHPI_XdSZOe&export=download
3. Decompress the downloaded file. Make sure a directory named "files" is being created.
4. Verify that the following structure is created.

                [Your just created directory]
                    |
                    +--[files]
                       +--[NNM]
                          +--densenet121-a639ec97.pth
                          +--haarcascade_frontalface_default.xml
                          +--inception_v3_google-1a9a5a14.pth
                          +--mobilenet_v2-b0353104.pth
                          +--resnet50-19c8e357.pth

5. Put "play.sh" file in the directory
6. Open a terminal in the directory
7. Run the following commands:
        
        chmod u+x play.sh
        alias p=./play.sh

8. The big moment comes, run the following command:

        p (and press enter)



The services are accessible through a web browser in the following URLs.

Web Converter:          http://127.0.0.1:5000
Web Machine Learning:   http://127.0.0.1:5001

Enjoy.


