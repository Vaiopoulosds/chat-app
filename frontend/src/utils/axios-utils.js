import axios from "axios";

const client = axios.create({baseURL: "http://localhost:8000/api"})

export const request = ({...options}) => {
  client.defaults.withCredentials = true
  client.defaults.headers.post['X-Csrftoken'] = document.cookie.valueOf("csrftoken").split('=')[1]
  const onSuccess = response =>response
  const onError = error =>{
    return console.error('Error : ', error)
  }

  return client(options).then(onSuccess).catch(onError)
}