import { useMutation} from '@tanstack/react-query'
import { request } from "../utils/axios-utils"


const createUser =(params) =>{
  return request({url:`/users/`, method:"post", data: {username:params.username, password:params.password, first_name:params.name, last_name : params.lastName, email:params.email}})
}

export const useCreateUser = () => {
  return useMutation({mutationFn:(params) => createUser(params)})
}