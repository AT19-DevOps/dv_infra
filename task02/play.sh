#!/bin/bash
log="session_$(date -d now +'%Y%m%dT%H-%M-%S').log"
touch $log
echo "AT19_PROJECT - docker-compose builder" >> $log 
echo "-------------------------------------" >> $log 
echo "[$(date -d now +'%Y%m%dT%H:%M:%S')] - Session started." >> $log 
echo "[$(date -d now +'%Y%m%dT%H:%M:%S')] - Displaying banner." >> $log 
thisDir=$(pwd)
step=1
steps=9
clear
echo ""
echo "********************************************************"
echo "**                                                    **"
echo "**     Converter & Recognition Studio v.1.0.11        **"
echo "**                    (FLDSMDFR)                      **"
echo "**                                                    **"
echo "********************************************************"
echo ""
echo "AT19 ===> Verifiying if pre requisits are met..."
if [ -d "files" ] || [ -d "AT19_MACHINE_LEARNING\files"]
then
	echo "[$(date -d now +'%Y%m%dT%H:%M:%S')] - Verifiying repositories in git." >> $log 
	echo ""
	echo "AT19[$((step++))/$steps] ===> Verifying AT19_PROJECT repositories"
	sleep 0.5s
	echo ""
	for project in AT19_CONVERTER AT19_MACHINE_LEARNING AT19_FRONTEND AT19_FRONTEND_CONVERT AT19_DOCKER-COMPOSE
	do
		if [ -d "$project" ]
		then
			echo "[$(date -d now +'%Y%m%dT%H:%M:%S')] - $project Existing repository... Updating" >> $log 
			echo "AT19[$((step++))/$steps] ===> Updating local repository $project, please wait ..."
			cd $project
			#git pull origin develop
			git checkout feature/docker_image_dvc
			cd "$thisDir"
		else
			echo "[$(date -d now +'%Y%m%dT%H:%M:%S')] - $project npot found... Cloning" >> $log 
			echo "AT19[$((step++))/$steps] ===> Local repository not found. Cloning $project, please wait ..."
			git clone https://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@github.com/jpsandovaln/$project.git
			cd $project
			# echo "git pull origin develop"
			git checkout feature/docker_image_dvc
			cd "$thisDir"
		fi
		sleep 1s
	done
	echo "[$(date -d now +'%Y%m%dT%H:%M:%S')] - Moving 'files' directory into AT19_MACHINE_LEARNING's directory" >> $log
	cp -rf files AT19_MACHINE_LEARNING
	echo "[$(date -d now +'%Y%m%dT%H:%M:%S')] - Processing docker-compose file..." >> $log
	cp -rf AT19_DOCKER-COMPOSE/* . >/dev/null
	cp -rf AT19_DOCKER-COMPOSE/AT19_MACHINE_LEARNING/dockerfile AT19_MACHINE_LEARNING/ >/dev/null
	cp -rf AT19_DOCKER-COMPOSE/AT19_FRONTEND/dockerfile AT19_FRONTEND/ >/dev/null
	cp -rf AT19_DOCKER-COMPOSE/AT19_CONVERTER/dockerfile AT19_CONVERTER/ >/dev/null
	cp -rf AT19_DOCKER-COMPOSE/AT19_FRONTEND_CONVERT/dockerfile AT19_FRONTEND_CONVERT/ >/dev/null
	echo "AT19[$((step++))/$steps] ===> Creating docker containers, please wait..."
	echo "[$(date -d now +'%Y%m%dT%H:%M:%S')] - Creating docker containers..." >> $log
	docker-compose -f "docker-compose.yml" up -d --build
	echo "[$(date -d now +'%Y%m%dT%H:%M:%S')] - Listing docker containers..." >> $log
	echo "AT19[$((step++))/$steps] ===> Docker images created..."
	docker image ls
	sleep 1s
	echo "[$(date -d now +'%Y%m%dT%H:%M:%S')] - Listing running images..." >> $log
	echo "AT19[$((step++))/$steps] ===> Docker running images..."
	docker ps
	sleep 1s
	echo "********************************************************"
	echo "**                                                    **"
	echo "**        AT19 - Automation Team 19 - 2023            **"
	echo "**       ------------------------------------         **"
	echo "**         Carolina Vacaflor Nina                     **"
	sleep 0.5s
	echo "**         Celeste Palet Arias                        **"
	sleep 0.5s
	echo "**         Daniel Villarroel Chanlopkova              **"
	sleep 0.5s
	echo "**         David Garnica Morales                      **"
	sleep 0.5s
	echo "**         Denisse Cordoba Sanabria                   **"
	sleep 0.5s
	echo "**         Fabian Cabrejo Arias                       **"
	sleep 0.5s
	echo "**         Leonardo Pacheco Carrillo                  **"
	sleep 0.5s
	echo "**         Maria Mamani Cruz                          **"
	sleep 0.5s 
	echo "**         Martin Alvarez Alcoreza                    **"
	sleep 0.5s
	echo "**         Rocio Morales                              **"
	sleep 0.5s
	echo "**         Roger Renjifo Tarquino                     **"
	sleep 0.5s
	echo "**         Selmi Muraña Cayo                          **"
	sleep 0.5s
	echo "**         Telma Rios Fernandez                       **"
	sleep 0.5s
	echo "**                                                    **"
	echo "**         Trainer:                                   **"
	echo "**         Paolo Sandoval                             **"
	sleep 0.5s
	echo "**                                                    **"
	echo "********************************************************"
	sleep 0.5s
	echo "[$(date -d now +'%Y%m%dT%H:%M:%S')] - End of script" >> $log
else
	echo "[$(date -d now +'%Y%m%dT%H:%M:%S')] - 'files' directory doesn't exist." >> $log
	echo "AT19 ===> The 'files' directory does not exist, please follow the steps described in the readme.txt file."
	echo "AT19 ===> Be sure you downloaded the file.zip and decompress it in this directory."
	echo "[$(date -d now +'%Y%m%dT%H:%M:%S')] - End of script" >> $log
	exit
fi
