# justfile - https://github.com/casey/just

# macOS has a different command than Linux (note, not tested this with BSD).
sha_command := if os() == "macos" { "shasum -a 256" } else { "sha256sum" }

signify := "signify -S -s ~/.signify/rosstimson.sec"

default: clean debian

clean:
	rm -f {debian,macos,openbsd,ubuntu,void}/SHA256*

debian:
	{{ sha_command }} debian/install > debian/SHA256
	{{ signify }} -m debian/SHA256 -x debian/SHA256.sig

macos:
	{{ sha_command }} macos/install > macos/SHA256
	{{ signify }} -m macos/SHA256 -x macos/SHA256.sig
