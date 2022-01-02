
CUR_PATH := $(shell pwd)
 
SRC_FOLDER := $(shell find $(CUR_PATH) -maxdepth 1 -type d)
BASE_SRC_FOLDER := $(basename $(patsubst $(CUR_PATH)/%, %, $(SRC_FOLDER)))
BASE_SRC_FOLDER := $(filter-out $(CUR_PATH), $(BASE_SRC_FOLDER))
BASE_SRC_FOLDER := $(filter-out .github, $(BASE_SRC_FOLDER))
 
.PHONY:default clean
 
default:
	@for dir in ${BASE_SRC_FOLDER}; do \
		cd $(CUR_PATH)/$$dir; ./build.sh; cd $(CUR_PATH); \
	done
	@echo push images done!
 
clean:

