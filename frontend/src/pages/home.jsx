import { useState } from "react";
import { useLogin } from "../queryHooks/login";

function Home({setIsLoggedIn}) {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const { mutate } = useLogin();


  const handleLogin = (e) => {
    e.preventDefault();
    const params = { username, password };
    mutate(params);
    setIsLoggedIn(true)
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
                  <a className="nav-link btn bg-info" href="/register">
                    <b>Register</b>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </nav>
      <div className="container text-center mw-100 back-color ">
        <h1 className="display-1">Welcome to MyChat</h1>
      </div>
      <div className="container text-center no-color">
        <div className="row d-flex justify-content-around flex-wrap">
          <div className="col-12 col-lg-5 no-color">
            <h2>Sooooo what are we doing here...</h2>
            <p className="p">
              This is a place where you can meet online with your friends and
              chat!! <br />
              You just have to register and then you can log in and chat with
              your friends in real time!!
            </p>
            <h3 className="mt-5">Then what??</h3>
            <p className="p">
              Then the steps are simple... <br />
              Find all the users <br />
              Select the one you want to talk to <br />
              Start a conversation!
            </p>
            <a href="/register" className="btn btn-info">
              Register
            </a>
          </div>
          <div className="col-12 col-lg-3 no-color">
            <h2>Already a user?? </h2>
            <form>
              <div className="form-floating mb-3">
                <input
                  type="text"
                  className="form-control"
                  id="username"
                  aria-describedby="username"
                  placeholder="username"
                  value={username}
                  onChange={(e) => {
                    setUsername(e.target.value);
                  }}
                />
                <label htmlFor="username" className="form-label">
                  Username
                </label>
              </div>
              <div className="form-floating mb-3">
                <input
                  type="password"
                  className="form-control"
                  id="password"
                  placeholder="password"
                  value={password}
                  onChange={(e) => {
                    setPassword(e.target.value);
                  }}
                />
                <label htmlFor="password" className="form-label">
                  Password
                </label>
              </div>
              <button
                type="submit"
                className="btn btn-info"
                onClick={(e) => {
                  handleLogin(e);
                }}
              >
                Login
              </button>
            </form>
          </div>
        </div>
      </div>
    </>
  );
}

export default Home;
