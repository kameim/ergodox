
dists:
	mkdir dists

build: dists
	git clone --depth 1 https://github.com/qmk/qmk_firmware
	cp ./ergodox_ez_keymap.c ./qmk_firmware/keyboards/ergodox_ez/keymaps/default/keymap.c
	docker run --rm -e keyboard=ergodox_ez -v $(PWD)/qmk_firmware:/qmk  edasque/qmk_firmware
	cp $(PWD)/qmk_firmware/ergodox_ez_default.hex ./dists

clean:
	rm -fr qmk_firmware
	rm -fr dists
