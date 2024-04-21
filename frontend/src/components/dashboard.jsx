import { useGetCurrentUser } from "../queryHooks/getcurrecntUser";
import { useGetUsers } from "../queryHooks/getusers";
import { useGetUserConversations } from "../queryHooks/getUserConversations";
import AuthUserNav from "./authUserNav";

const Dashboard = () => {
  const { data: currentUser } = useGetCurrentUser();
  const { data: conversations } = useGetUserConversations();
  const { data: users } = useGetUsers();

  return (
    <>
      <AuthUserNav></AuthUserNav>
      <h2 className="display-6 bg-info-subtle pt-2 pb-2 text-capitalize">
        {" "}
        {currentUser?.data.username}
      </h2>
      <div className="container">
        <div className="row mt-3 mb-3">
          <div
            className="col-6 col-lg-2 rounded border me-lg-2 overflow-auto"
            style={{ height: "80vh" }}
            id="users"
          >
            <u>All the users</u>
            <div className="list-group">
              {users?.data.map((user) => (
                <a
                  href={`/conversation/${user.id}`}
                  className="list-group-item list-group-item-action"
                  key={user.username}
                >
                  {" "}
                  {user.username}
                </a>
              ))}
            </div>
          </div>
          <div
            className="col-6 col-lg-8 rounded border overflow-auto"
            style={{ height: "80vh" }}
          >
            {" "}
            <u>Open Conversations</u>
            <div className="list-group">
              {conversations?.data.map((conversation) => (
                <a
                  href={
                    currentUser.data.id == conversation.user1.id
                      ? `/conversation/${conversation.user2.id}`
                      : `/conversation/${conversation.user1.id}`
                  }
                  className="list-group-item list-group-item-action"
                  key={conversation.id}
                >
                  {" "}
                  {conversation.user1.username} - {conversation.user2.username}
                </a>
              ))}
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default Dashboard;
