import { useMutation, useQueryClient } from "@tanstack/react-query";
import { request } from "../utils/axios-utils";

const sendMessage = (params) => {
  return request({url:`/conversation/${params.conversationId}/messages/`, method:"post", data: {conversation:params.conversationId, sender:params.sender, content:params.content}})
};

export const useSendMessage = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (params) => sendMessage(params),
    onSettled: () => {
      queryClient.invalidateQueries(["conversation-messages"]);
    },
  });
};
