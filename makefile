KEYMAP_PATH = $(PWD)/ergodox_ez_keymap:/qmk_firmware/keyboards/ergodox_ez/keymaps/default 
DISTS_PATH = $(PWD)/dists:/qmk_firmware/.build

dists:
	mkdir dists

build: dists
	docker run --rm -e keyboard=ergodox_ez -v $(KEYMAP_PATH) -v $(DISTS_PATH) edasque/qmk_firmware

clean:
	rm -fr dists
