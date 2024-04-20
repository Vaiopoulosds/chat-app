import {useQuery} from '@tanstack/react-query'
import { request } from '../utils/axios-utils'

const getUserConversations = () =>{
  return request({url:`/conversations/`})
}


export const useGetUserConversations = () => {
  
  return useQuery({queryKey:["conversations"] ,queryFn: ()=>getUserConversations()} )
}