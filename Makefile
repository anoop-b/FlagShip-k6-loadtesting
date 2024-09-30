all: rpc kv restapi db ldflag samezone fs-client

rpc:
	K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=results/rpc.html  k6 run rpc.js
kv:
	K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=results/kv.html  k6 run kv.js
restapi:
	K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=results/rest.html  k6 run rest.js
db:
	K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=results/db.html  k6 run db.js
ldflag:
	K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=results/ldflag.html  k6 run ldflag.js 
samezone:
	K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=results/sameZone.html  k6 run sameZone.js 
fs-client:
	K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=results/fsClient.html  k6 run fsClient.js 
