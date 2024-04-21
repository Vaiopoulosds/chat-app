import {useQuery} from '@tanstack/react-query'
import { request } from '../utils/axios-utils'

const getMessages = (id) =>{
  return request({url:`/conversation/${id}/messages/`})
}


export const useGetMessagesPerConversation = (id) => {
  
  return useQuery({queryKey:['conversation-messages', id] ,queryFn: ()=>getMessages(id)} )
}