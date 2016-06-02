install: botmessenger-pt_BR.mo
	install botmessenger-pt_BR.mo /usr/share/locale/pt_BR/LC_MESSAGES/botmessenger.mo

clone:
	git clone https://github.com/hnrqer/botmessenger.git

download:
	git pull

upload:
	git add -A
	git commit
	git push origin 

tags:
	git push origin --tags
