let backendHost;
const apiVersion = 'v1';

const hostname = window && window.location && window.location.hostname;

if (hostname === 'https://safe-headland-30910.herokuapp.com') {
  backendHost = 'https://safe-headland-30910.herokuapp.com';
} else if (hostname === 'http://stg.PrimeTimeTran.com') {
  backendHost = 'http://stg.PrimeTimeTran.com';
} else if (/^qa/.test(hostname)) {
  backendHost = `http://${hostname}`;
} else {
  backendHost = process.env.REACT_APP_BACKEND_HOST || 'https://safe-headland-30910.herokuapp.com';
}

export const API_ROOT = `${backendHost}/${apiVersion}/`;