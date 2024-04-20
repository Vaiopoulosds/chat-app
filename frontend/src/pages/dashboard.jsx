import { useGetCurrentUser } from "../queryHooks/getcurrecntUser";
import { useLogout } from "../queryHooks/logout";
import { useGetUsers } from "./../queryHooks/getusers";
import { useGetUserConversations } from "../queryHooks/getUserConversations";

const Dashboard = ({ setIsLoggedIn }) => {
  const { data: currentUser } = useGetCurrentUser();
  const { data: conversations } = useGetUserConversations();
  const { mutate } = useLogout();
  const { data: users } = useGetUsers();

  const handleLogout = () => {
    mutate();
    setIsLoggedIn(false);
  };

  return (
    <>
      <nav className="navbar navbar-expand-lg nav-color">
        <div className="container-fluid">
          <a className="navbar-brand" href="/">
            MyChat
          </a>
          <button
            className="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon"></span>
          </button>
          <div className="collapse navbar-collapse" id="navbarNav">
            <div className="container mw-100">
              <ul className="navbar-nav">
                <li className="nav-item">
                  <a className="nav-link active" aria-current="page" href="/">
                    Home
                  </a>
                </li>
                <li className="nav-item">
                  <a className="nav-link" href="/dashboard">
                    Dashboard
                  </a>
                </li>
                <li className="nav-item">
                  <a className="nav-link" href="/conversation">
                    Conversation
                  </a>
                </li>
                <li className="nav-item ms-lg-auto">
                  <button
                    className="nav-link btn bg-info"
                    onClick={handleLogout}
                  >
                    <b>Logout</b>
                  </button>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </nav>
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
