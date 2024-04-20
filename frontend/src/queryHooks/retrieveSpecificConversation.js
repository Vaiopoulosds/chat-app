import { useMutation, useQueryClient} from '@tanstack/react-query'
import { request } from "../utils/axios-utils"


const specificConversation =(params) =>{
  return request({url:`/user-conversation/${params.id}/`, method:"get"})
}

export const useRetrieveSpecificConversation = () => {
  const queryClient = useQueryClient()
  return useMutation({mutationFn:(params) => specificConversation(params)})
}