let backendHost;
const apiVersion = 'v1';

const hostname = window && window.location && window.location.hostname;

if (hostname === 'safe-headland-30910.herokuapp.com') {
  backendHost = 'https://safe-headland-30910.herokuapp.com';
} else if (hostname === 'primetimetran.com') {
  backendHost = 'http://www.primetimetran.com';
} else if (/^qa/.test(hostname)) {
  backendHost = `http://${hostname}`;
} else {
  backendHost = process.env.REACT_APP_BACKEND_HOST || 'http://localhost:3001';
}

export const API_ROOT = `${backendHost}/${apiVersion}/`;

console.log('ApiRoot', API_ROOT)