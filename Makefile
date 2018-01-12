include /etc/plexurl.cfg

export section ='Notflix TV Shows'
export PIP = pip3
export DIRECT = -d
#export name = Zombieland

#export FILENAME = --name $(name)
#export SERVERNAME --servername $(servername)

define PLEX_COMMAND
plexurl -s -l $(section) $(DIRECT) \
	--server $(server) \
	--username $(username) \
	--password $(password) \
	$(SERVERNAME) $(FILENAME)
endef

export PLEX_COMMAND

dummy: build

.deps:
	docker build -f Dockerfile.deps -t eyedeekay/plexurl:deps .; touch .deps

build: .deps
	docker build -f Dockerfile -t eyedeekay/plexurl .

run:
	docker rm -f plexurl; \
	docker run --name plexurl -i -t eyedeekay/plexurl "$(PLEX_COMMAND)"

try: build run

run-test:
	docker rm -f plexurl-get; \
	docker run --name plexurl-get -i -t eyedeekay/plexurl "$(PLEX_COMMAND)"

pkg:
	rm -r debian
	dh_make --python \
		--createorig \
		--copyright gpl3 \
		--email problemsolver@openmailbox.org \
		--packagename plexurl_0.1 \
		--yes

deb:
	debuild -us -uc

install:
	"$(PIP)" install --exists-action w -e .

uninstall:
	"$(PIP)" uninstall .
	yes | "$(PIP)" uninstall -r requirements.txt

reinstall: uninstall install

srun:
	plexurl -m -l "$(section)" \
		--server "$(server)" \
		--username "$(username)" \
		--password "$(password)" \
		--servername "$(servername)" \
		--name $(name)
