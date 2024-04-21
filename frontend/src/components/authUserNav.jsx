import { useNavigate } from "react-router-dom";
import { useLogout } from "../queryHooks/logout";

const AuthUserNav = () => {
  const { mutate } = useLogout();
  const navigate = useNavigate();

  const handleLogout = () => {
    mutate();
    const path = "/";
    navigate(path);
  };

  return (
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
  );
};

export default AuthUserNav;
