import {useQuery} from '@tanstack/react-query'
import { request } from '../utils/axios-utils'

const getUsers = () =>{
  return request({url:`/users/`})
}


export const useGetUsers = () => {
  
  return useQuery({queryKey:["users"] ,queryFn: ()=>getUsers()} )
}