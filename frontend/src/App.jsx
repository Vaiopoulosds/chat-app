function App() {
  return (
    <>
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
            <a href="/register" className="btn btn-info">Register</a>
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
                />
                <label for="username" className="form-label">
                  Username
                </label>
              </div>
              <div className="form-floating mb-3">
                <input
                  type="password"
                  className="form-control"
                  id="password"
                  placeholder="password"
                />
                <label for="password" className="form-label">
                  Password
                </label>
              </div>
              <button type="submit" className="btn btn-info">
                Login
              </button>
            </form>
          </div>
        </div>
      </div>
    </>
  );
}

export default App;
