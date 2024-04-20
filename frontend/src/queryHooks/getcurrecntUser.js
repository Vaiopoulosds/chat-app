import {useQuery} from '@tanstack/react-query'
import { request } from '../utils/axios-utils'

const getCurrentUser = () =>{
  return request({url:`/user-detail/`})
}


export const useGetCurrentUser = () => {
  
  return useQuery({queryKey:["currentUser"] ,queryFn: ()=>getCurrentUser()} )
}