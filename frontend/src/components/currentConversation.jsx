import { useParams } from "react-router-dom";
import { useGetSpecificConversation } from "../queryHooks/retrieveSpecificConversation";
import AuthUserNav from "./authUserNav";
import { useGetCurrentUser } from "../queryHooks/getcurrecntUser";
import { useGetMessagesPerConversation } from "../queryHooks/getMessagesPerConversation";
import { useGetUserById } from "../queryHooks/getUserById";
import { useState } from "react";
import { useSendMessage } from "../queryHooks/sendMessage";

const Conversation = (props) => {
  const id = Object.values(useParams())[0];
  const { data: conversation } = useGetSpecificConversation(id);
  const { data: currentUser } = useGetCurrentUser();
  const { data: conversationMessages } = useGetMessagesPerConversation(
    conversation?.data.id
  );
  const { mutate } = useSendMessage();
  const [messageSend, setMessageSend] = useState("");

  const dateConvertion = (date) => {
    const newDate = new Date(date);
    return `${newDate.toLocaleTimeString()} - ${newDate.toLocaleDateString(
      "en-US",
      { weekday: "long", year: "numeric", month: "long", day: "numeric" }
    )}`;
  };

  const sendMessage = (e) => {
    e.preventDefault()
    const conversationId = conversation.data.id;
    const sender = currentUser.data.id;
    const content = messageSend;
    const params = { conversationId, sender, content };
    mutate(params);
    setMessageSend("");
  };

  return (
    <>
      <AuthUserNav></AuthUserNav>
      <div className="container text-center mw-100 back-color ">
        <h1 className="display-6 text-capitalize">
          Conversation with :{" "}
          {conversation?.data.user1.username === currentUser?.data.username
            ? conversation?.data.user2.username
            : conversation?.data.user1.username}
        </h1>
      </div>
      <div className="container d-flex justify-content-center flex-wrap no-color">
        <div
          className="container rounded back-color row border overflow-auto"
          style={{ height: "80vh" }}
        >
          <ul className="list-group list-group-flush">
            {conversationMessages?.data.map((message) => (
              <li className="list-group-item bg-info-subtle" key={message.id}>
                <small><u>{dateConvertion(message.timestamp)}</u></small> <br />{" "}
                <span className="text-primary">
                  {message.sender_info.username}
                </span>
                : {message.content}{" "}
              </li>
            ))}
          </ul>
        </div>
        <form className="container row" onSubmit={sendMessage}>
          <div className="container rounded  border input-group mb-3">
            <input
              onSubmit={sendMessage}
              type="text"
              className="form-control"
              placeholder="message"
              aria-label="message"
              value={messageSend}
              onChange={(e) => {
                setMessageSend(e.target.value);
              }}
              required
            />
            <button className="btn btn-outline-primary" type="submit">
              Send
            </button>
          </div>
        </form>
      </div>
    </>
  );
};

export default Conversation;
