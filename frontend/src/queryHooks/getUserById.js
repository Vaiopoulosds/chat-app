import {useQuery} from '@tanstack/react-query'
import { request } from '../utils/axios-utils'

const getUserById = (id) =>{
  return request({url:`/users/${id}`})
}


export const useGetUserById = (id) => {
  
  return useQuery({queryKey:["user",id] ,queryFn: ()=>getUserById(id)} )
}