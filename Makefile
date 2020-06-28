all: debian/SHA256 \
	 debian/SHA256.sig \
	 openbsd/SHA256 \
	 openbsd/SHA256.sig \
	 ubuntu/SHA256 \
	 ubuntu/SHA256.sig \
	 void/SHA256 \
	 void/SHA256.sig

debian/SHA256:
	sha256sum debian/install > debian/SHA256

debian/SHA256.sig:
	signify -S -s ~/.signify/rosstimson.sec -m debian/SHA256 -x debian/SHA256.sig

openbsd/SHA256:
	sha256sum openbsd/install > openbsd/SHA256

openbsd/SHA256.sig:
	signify -S -s ~/.signify/rosstimson.sec -m openbsd/SHA256 -x openbsd/SHA256.sig

ubuntu/SHA256:
	sha256sum ubuntu/install > ubuntu/SHA256

ubuntu/SHA256.sig:
	signify -S -s ~/.signify/rosstimson.sec -m ubuntu/SHA256 -x ubuntu/SHA256.sig

void/SHA256:
	sha256sum void/install > void/SHA256

void/SHA256.sig:
	signify -S -s ~/.signify/rosstimson.sec -m void/SHA256 -x void/SHA256.sig


.PHONY: all
