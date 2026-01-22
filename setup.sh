git clone https://github.com/Thr0in/Inventarisierungsmodul tmp

source .env
ENV_PATH=tmp/frontend/src/environments/environment.ts

echo "export const environment = {" > ${ENV_PATH}
echo "apiUrl: '${API_URL}'," >> ${ENV_PATH}
echo "besyUrl: '${BESY_URL}'," >> ${ENV_PATH}
echo "footerLinks: [${FOOTER_LINKS}]," >> ${ENV_PATH}
echo "bugReportUrl: 'https://github.com/kr1pt0n05/Inventarisierungsmodul/issues/new/choose'," >> ${_ENV_PATH}
echo "priceRegEx: /^\s*(\d+([.,]\d{1,2})?|(\d{1,3}(\.\d{3})*(,\d{1,2})?)|(\d{1,3}(,\d{3})*(\.\d{1,2})?))\s*€?\s*$/," >> tmp/frontend/src/environments/environment.ts
echo "clientId: '${CLIENT_ID}'," >> ${ENV_PATH}
echo "issuer: '${ISSUER_URL}'," >> ${ENV_PATH}
echo "requiredRole: '${REQUIRED_ROLE}'," >> ${ENV_PATH}
echo "cacheDurationMs: 5 * 60 * 1000," >> ${ENV_PATH}
echo "searchAndFilterDebounceMs: 100" >> ${ENV_PATH}
echo "}" >> ${ENV_PATH}

docker build -t insy-frontend:latest tmp/frontend/
rm -rf tmp
CONFIG=production
docker compose up -d
