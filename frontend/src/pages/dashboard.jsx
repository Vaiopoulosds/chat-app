import { useGetCurrentUser } from "../queryHooks/getcurrecntUser";
import { useLogout } from "../queryHooks/logout";

const Dashboard = () => {
  const { data: currentUser, isSuccess } = useGetCurrentUser();
  const {mutate} = useLogout()
  const handleLogout = () =>{
    mutate()
  }


  const capitalize = (s) => s && s[0].toUpperCase() + s.slice(1);

  
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
                  <button className="nav-link btn bg-info" onClick={handleLogout}>
                    <b>Logout</b>
                  </button>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </nav>
      <h2 className="display-6 bg-info-subtle pt-2 pb-2">
        {" "}
        {capitalize(currentUser?.data.username)}
      </h2>
      <div className="container">
        <div className="row mt-3 mb-3">
          <div
            className="col-6 col-lg-2 rounded border me-lg-2"
            style={{ height: "80vh" }}
          >
            Find People
          </div>
          <div
            className="col-6 col-lg-8 rounded border"
            style={{ height: "80vh" }}
          >
            {" "}
            Past Conversations
          </div>
        </div>
      </div>
    </>
  );
};

export default Dashboard;
