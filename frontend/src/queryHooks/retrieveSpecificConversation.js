import {useQuery} from '@tanstack/react-query'
import { request } from '../utils/axios-utils'

const getConversation = (id) =>{
  return request({url:`/user-conversation/${id}/`})
}


export const useGetSpecificConversation = (id) => {
  
  return useQuery({queryKey:['conversation', id] ,queryFn: ()=>getConversation(id)} )
}