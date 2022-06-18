OS_NAME := $(shell uname -s | tr A-Z a-z)
SHA_COMMAND :=
ifeq ($(OS_NAME),darwin)
	SHA_COMMAND += shasum -a 256
else
	SHA_COMMAND += sha256sum
endif


all: debian/SHA256 \
	 debian/SHA256.sig \
	 macos/SHA256 \
	 macos/SHA256.sig \
	 openbsd/SHA256 \
	 openbsd/SHA256.sig \
	 ubuntu/SHA256 \
	 ubuntu/SHA256.sig \
	 void/SHA256 \
	 void/SHA256.sig

debian/SHA256:
	$(SHA_COMMAND) debian/install > debian/SHA256

debian/SHA256.sig:
	signify -S -s ~/.signify/rosstimson.sec -m debian/SHA256 -x debian/SHA256.sig

macos/SHA256:
	$(SHA_COMMAND) macos/install > macos/SHA256

macos/SHA256.sig:
	signify -S -s ~/.signify/rosstimson.sec -m macos/SHA256 -x macos/SHA256.sig

openbsd/SHA256:
	$(SHA_COMMAND) openbsd/install > openbsd/SHA256

openbsd/SHA256.sig:
	signify -S -s ~/.signify/rosstimson.sec -m openbsd/SHA256 -x openbsd/SHA256.sig

ubuntu/SHA256:
	$(SHA_COMMAND) ubuntu/install > ubuntu/SHA256

ubuntu/SHA256.sig:
	signify -S -s ~/.signify/rosstimson.sec -m ubuntu/SHA256 -x ubuntu/SHA256.sig

void/SHA256:
	$(SHA_COMMAND) void/install > void/SHA256

void/SHA256.sig:
	signify -S -s ~/.signify/rosstimson.sec -m void/SHA256 -x void/SHA256.sig

clean:
	rm -f {debian,macos,openbsd,ubuntu,void}/SHA256*


.PHONY: all clean
