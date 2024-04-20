import { useMutation, useQueryClient} from '@tanstack/react-query'
import { request } from "../utils/axios-utils"


const userLogin =(params) =>{
  return request({url:`/login/`, method:"post", data: {username:params.username, password:params.password}})
}

export const useLogin = () => {
  const queryClient = useQueryClient()
  return useMutation({mutationFn:(params) => userLogin(params), onSettled: ()=>{
    queryClient.invalidateQueries(['currentUser'])
  }})
}