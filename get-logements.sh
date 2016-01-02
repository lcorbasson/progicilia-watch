#!/bin/bash

NOW="$(date +"%Y-%m-%d_%H-%M")"

PARAM_PRAGMA="Pragma: no-cache"
PARAM_ENCODING="Accept-Encoding: gzip, deflate, sdch"
PARAM_LANG="Accept-Language: fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4,de-DE;q=0.2,de;q=0.2,nl;q=0.2,ro;q=0.2,pt;q=0.2,es;q=0.2"
PARAM_USERAGENT="User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/47.0.2526.73 Chrome/47.0.2526.73 Safari/537.36"
PARAM_ACCEPT="Accept: */*"
PARAM_CONNECTION="Connection: keep-alive"
PARAM_CACHE="Cache-Control: no-cache"

PP_PE="-H \"$PARAM_PRAGMA\" -H \"$PARAM_ENCODING\""
PP_LUA="-H \"$PARAM_LANGUAGE\" -H \"$PARAM_USERAGENT\" -H \"$PARAM_ACCEPT\""
PP_CC="-H \"$PARAM_CONNECTION\" -H \"$PARAM_CACHE\""

SLEEP=4

. "$(dirname "$0")/credentials.sh"


dodo() {

	sleep "$(($RANDOM%$SLEEP+$SLEEP))"

}


replay_session() {
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "Upgrade-Insecure-Requests: 1" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/authentification/index/index" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/accueil/accueil
	
	dodo
	
	curl -s --compressed -X POST -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "Origin: http://$PROGICILIA" \
			-H "Accept-Encoding: gzip, deflate" -H "Host: $PROGICILIA" \
			-H "Upgrade-Insecure-Requests: 1" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/authentification/index/index" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			-H "Content-Type: application/x-www-form-urlencoded" \
			-H "Content-Length: 32" --data-urlencode "login=$USER" --data-urlencode "password=$PASSWD" \
			http://$PROGICILIA/authentification/index/index
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/library/bootstrap-3.1.1/css/bootstrap.css
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/library/font-awesome/css/font-awesome.css
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/library/nanobar.js
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/images/commun/icon-ma-demande.png > /dev/null
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/images/commun/icon-annuler-ma-demande.png > /dev/null
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/images/commun/icon-mes-propositions.png > /dev/null
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/images/commun/icon-mon-dossier.png > /dev/null
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/images/commun/icon-documents.png > /dev/null
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/images/commun/icon-consulter-les-offres.png > /dev/null
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/library/jquery/jquery-1.11.0.min.js
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/library/bootstrap-3.1.1/js/bootstrap.js
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/library/bootstrap-table-master/src/bootstrap-table.js
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/library/bootstrap-table-master/src/locale/bootstrap-table-fr-FR.js
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/library/bootstrap-table-master/extensions/cookie/bootstrap-table-cookie.js
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/library/bootstrap-datepicker/js/bootstrap-datepicker.js
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/library/bootstrap-datepicker/js/locales/bootstrap-datepicker.fr.js
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/js/edemande.js
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/js/commun/commun.js
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/library/sweetalert/lib/sweet-alert.js
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/library/bootstrap-filestyle.min.js
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/js/accueil.js
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/library/bootstrap-3.1.1/css/bootstrap.css" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/images/commun/bandeau.png > /dev/null
	
	dodo
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "Origin: http://$PROGICILIA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/library/font-awesome/css/font-awesome.css" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/accueil/accueil
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/library/jquery/jquery-1.11.0.min.js
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "Origin: http://$PROGICILIA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/library/font-awesome/css/font-awesome.css" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/library/font-awesome/fonts/fontawesome-webfont.woff2?v=4.3.0 > /dev/null
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/library/sweetalert/lib/sweet-alert.js
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "Origin: http://$PROGICILIA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/library/font-awesome/css/font-awesome.css" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/library/font-awesome/fonts/fontawesome-webfont.woff?v=4.3.0 > /dev/null
	
	dodo
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "Upgrade-Insecure-Requests: 1" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/accueil/accueil" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/offrelogement/index/
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "Origin: http://$PROGICILIA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/library/font-awesome/css/font-awesome.css" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/accueil/accueil
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "Origin: http://$PROGICILIA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/library/font-awesome/css/font-awesome.css" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/library/font-awesome/fonts/fontawesome-webfont.woff2?v=4.3.0 > /dev/null
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "Origin: http://$PROGICILIA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/library/font-awesome/css/font-awesome.css" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/library/font-awesome/fonts/fontawesome-webfont.woff?v=4.3.0 > /dev/null
	
	dodo
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "Upgrade-Insecure-Requests: 1" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/offrelogement/index/deleteCache/delete" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/offrelogement/index/deleteCache/delete
	
	dodo
	
	curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
			-H "Origin: http://$PROGICILIA" \
			-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
			-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
			-H "Referer: http://$PROGICILIA/library/font-awesome/css/font-awesome.css" \
			-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
			http://$PROGICILIA/accueil/accueil
	
}


show_data() {

	replay_session | tee session.txt | sort -u | sed -ne 's,.* data-url="\([^"]*\)".*,\1,p' | while read datafile; do
		curl -s --compressed -X GET -b cookies.txt -c cookies.txt -H "$PARAM_PRAGMA" \
				-H "$PARAM_ENCODING" -H "Host: $PROGICILIA" \
				-H "$PARAM_LANGUAGE" -H "$PARAM_USERAGENT" -H "$PARAM_ACCEPT" \
				-H "Referer: http://$PROGICILIA/offrelogement/index" \
				-H "Content-Type: application/json" -H "X-Requested-With: XMLHttpRequest" \
				-H "$PARAM_CONNECTION" -H "$PARAM_CACHE" \
				"http://$PROGICILIA$datafile?sort=log_loyer_charge_comprise&order=asc&limit=25&offset=0" \
				| tee data.json | jq .
	done | tee "data_${NOW}.json"

}


make_history() {

	(
		echo '['
		ls data_*.json | sort -r | while read f; do
			date="$(echo "$f" | sed -e 's,^data_\(.*\)\.json$,\1,' -e 's,^\([0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]\)_\([0-9][0-9]\)-\([0-9][0-9]\)$,\1 \2:\3,')"
			size="$(ls -al "$f" | cut -f5 -d' ')"
			[ "$first" == "no" ] && echo ','
			first="no"
			echo -n "\"$date\": "
			if [ "$size" -ne 0 ]; then
				cat "$f"
			else
				echo "\"no data in $f\""
			fi
		done
		echo ']'
	) | tee debug.json | jq . > history.json

}


show_data

make_history


