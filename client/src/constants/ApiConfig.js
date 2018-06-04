let backendHost;
const apiVersion = 'v1';

const hostname = window && window.location && window.location.hostname;

if (hostname === 'localhost') {
  backendHost = 'http://localhost:3000';
} else {
  backendHost = 'https://lit-brushlands-65490.herokuapp.com';
}

export const API_ROOT = `${backendHost}/${apiVersion}/`;

console.log('ApiRoot', API_ROOT);
