IMAGE 			:= foilctf_database
VOLUME			:= foilctf_database
MOUNTPOINT	:= /var/lib/postgresql

all: build run

build:
	podman build --tag $(IMAGE) .

run:
	podman run --detach --volume $(VOLUME):$(MOUNTPOINT):Z $(IMAGE)

volume_make:
	podman volume create -o type=none -o device=$$PWD/files -o o=bind foilctf_database

.PHONY: all build run volume_make
