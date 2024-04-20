import { useMutation} from '@tanstack/react-query'
import { request } from "../utils/axios-utils"
import { AxiosHeaders } from 'axios'



const userLogout =() =>{
  return request({url:`/logout/`, method:"post",})
}

export const useLogout = () => {
  return useMutation({mutationFn:() => userLogout()})
}

