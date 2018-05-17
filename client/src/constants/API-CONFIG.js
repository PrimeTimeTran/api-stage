let backendHost;
const apiVersion = 'v1';

const hostname = window && window.location && window.location.hostname;

if (hostname === 'http://www.PrimeTimeTran.com') {
  backendHost = 'http://www.PrimeTimeTran.com';
} else if (hostname === 'http://stg.PrimeTimeTran.com') {
  backendHost = 'http://stg.PrimeTimeTran.com';
} else if (/^qa/.test(hostname)) {
  backendHost = `http://${hostname}`;
} else {
  backendHost = process.env.REACT_APP_BACKEND_HOST || 'http://localhost:3001';
}

export const API_ROOT = `${backendHost}/${apiVersion}/`;