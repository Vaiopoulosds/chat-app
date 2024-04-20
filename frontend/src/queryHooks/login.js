import { useMutation} from '@tanstack/react-query'
import { request } from "../utils/axios-utils"

const userLogin =(params) =>{
  return request({url:`/login/`, method:"post", data: {username:params.username, password:params.password}})
}

export const useLogin = () => {
  return useMutation({mutationFn:(params) => userLogin(params)})
}