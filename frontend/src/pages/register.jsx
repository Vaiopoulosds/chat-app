const Register = () => {
  return (
    <>
      <div className="container text-center mw-100 back-color">
        <h2 className="display-4">Registration Form</h2>
        <p className="p">
          {" "}
          Our group is waiting to meet you! <br />
          Please fill out the information bellow so that you can have access to
          our site.
        </p>
        <p className="p">
          {" "}
          The information bellow are required so that we can create your user
          account.
        </p>
      </div>
      <div className="container col-lg-3 text-center no-color">
        <form>
          <div className="form-floating mb-3">
            <input
              type="text"
              className="form-control"
              id="username"
              aria-describedby="username"
              placeholder="username"
              required
            />
            <label for="username" className="form-label">
              Username
            </label>
          </div>
          <div className="form-floating mb-3">
            <input
              type="text"
              className="form-control"
              id="name"
              placeholder="name"
              required
            />
            <label for="name" className="form-label">
              Name
            </label>
          </div>
          <div className="form-floating mb-3">
            <input
              type="text"
              className="form-control"
              id="lastName"
              placeholder="lastName"
              required
            />
            <label for="lastName" className="form-label">
              Last Name
            </label>
          </div>
          <div className="form-floating mb-3">
            <input
              type="email"
              className="form-control"
              id="email"
              placeholder="email"
              required
            />
            <label for="email" className="form-label">
              Email
            </label>
          </div>
          <div className="form-floating mb-3">
            <input
              type="password"
              className="form-control"
              id="password"
              placeholder="password"
              required
            />
            <label for="password" className="form-label">
              Password
            </label>
          </div>
          <div className="form-floating mb-3">
            <input
              type="repeatPassword"
              className="form-control"
              id="repeatPassword"
              placeholder="repeatPassword"
              required
            />
            <label for="repeatPassword" className="form-label">
              Repeat Password
            </label>
          </div>
          <button type="submit" className="btn btn-primary">
            Register
          </button>
        </form>
      </div>
    </>
  );
};

export default Register;
