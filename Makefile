
CUR_PATH := $(shell pwd)
 
SRC_FOLDER := $(shell find $(CUR_PATH) -maxdepth 1 -type d)
BASE_SRC_FOLDER := $(basename $(patsubst $(CUR_PATH)/%, %, $(SRC_FOLDER)))
BASE_SRC_FOLDER := $(filter-out $(CUR_PATH), $(BASE_SRC_FOLDER))
BASE_SRC_FOLDER := $(filter-out .github, $(BASE_SRC_FOLDER))
BASE_SRC_FOLDER := $(filter-out .git, $(BASE_SRC_FOLDER))
BASE_SRC_FOLDER := $(filter-out util, $(BASE_SRC_FOLDER))
 
.PHONY:default renew init
 
default:
	for dir in ${BASE_SRC_FOLDER}; do \
		cd $(CUR_PATH)/$$dir; \
		echo begin build $$dir; \
		./build.sh || exit $?; \
		echo push image $$dir done! \
		cd $(CUR_PATH); \
	done
 
init:
	if [ "$(CACHE_FROM_DIR)" != "" ]; then \
		mkdir -p $(CACHE_FROM_DIR); \
	fi


