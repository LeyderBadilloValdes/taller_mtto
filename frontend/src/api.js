import axios from 'axios';

const api = axios.create({
  baseURL: 'http://192.168.206.144:8000/', // Define la URL base
  headers: {
    'Content-Type': 'application/json'
  }
});

export default api;
