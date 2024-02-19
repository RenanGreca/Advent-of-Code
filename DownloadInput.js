import fetch from 'node-fetch'
/**
* @param {string} url
*/
export default async function downloadInput(url) {
  return fetch(url)
  .then(response => response.text())
}
