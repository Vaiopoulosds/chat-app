import { useMutation, useQueryClient } from "@tanstack/react-query";
import { request } from "../utils/axios-utils";

const userLogout = () => {
  return request({ url: `/logout/`, method: "post" });
};

export const useLogout = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: () => userLogout(),
    onSettled: () => {
      queryClient.invalidateQueries(["currentUser"]);
    },
  });
};
