import { useState } from "react";
import { useLogin } from "../queryHooks/login";
import HomeNav from "./homeRegisterNav";

function Home({ setIsLoggedIn }) {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const { mutate } = useLogin();

  const handleLogin = (e) => {
    e.preventDefault();
    const params = { username, password };
    mutate(params);
    setIsLoggedIn(true);
  };

  return (
    <>
      <HomeNav></HomeNav>
      <div className="container text-center mw-100 bg-gradient back-color ">
        <h1 className="display-1">This is.. MyChat</h1>
      </div>
      <div className="container text-center no-color">
        <div className="row d-flex justify-content-around flex-wrap">
          <div className="col-12 col-lg-5 no-color">
            <h2>What is going on here...</h2>
            <p className="p">
              This is a place where you can meet online with your friends and
              chat!! <br />
              You just have to register and then you can log in and chat with
              your friends in real time!!
            </p>
            <h3 className="mt-5">Then what??</h3>
            <div className="container text-start col-8">
            <ol>
              <li>Find all the users</li>
              <li>Select the one you want to talk to </li>
              <li>Start a conversation!</li>
            </ol>
            </div>
            <a href="/register" className="btn btn-warning">
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
