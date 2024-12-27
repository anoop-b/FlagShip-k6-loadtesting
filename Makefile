all: rpc kv restapi db ldflag samezone fs-client

rpc:
	K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=results/rpc.html  k6 run rpc.js --out csv=results/rpc.csv --summary-export results/rpc.json 
kv:
	K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=results/kv.html  k6 run kv.js --out csv=results/kv.csv --summary-export results/kv.json
restapi:
	K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=results/rest.html  k6 run rest.js --out csv=results/rpc.csv --summary-export results/aws-ping.json
db:
	K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=results/db.html  k6 run db.js --out csv=results/db.csv --summary-export results/db.json
ldflag:
	K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=results/ldflag.html  k6 run ldflag.js  --out csv=results/ldflag.csv --summary-export results/ldflag.json
samezone:
	K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=results/sameZone.html  k6 run sameZone.js  --out csv=results/sameZone.csv --summary-export results/sameZone.json
fs-client:
	K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=results/fsClient.html  k6 run fsClient.js  --out csv=results/fs-client.csv --summary-export results/fs-client.json
aws-ping:
	K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=results/aws-ping.html  k6 run aws-ping.js  --out csv=results/aws-ping.csv --summary-export results/aws-ping.json
aws-ld:
	K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=results/aws-ld.html  k6 run aws-ld.js  --out csv=results/aws-ld.csv --summary-export results/aws-ld.json
aws-ld-ci:
	K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=results/aws-ld-ci.html  k6 run aws-ld-ci.js  --out csv=results/aws-ld-ci.csv --summary-export results/aws-ld-ci.json