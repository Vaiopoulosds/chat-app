import { useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";
import { useCreateUser } from "../queryHooks/createNewUser";
import HomeNav from "./homeRegisterNav";

const Register = () => {
  const navigate = useNavigate();
  const { mutate, isSuccess } = useCreateUser();
  const [username, setUsername] = useState("");
  const [name, setName] = useState("");
  const [lastName, setLastName] = useState("");
  const [email, setEmail] = useState("");
  const [password1, setPassword1] = useState("");
  const [password2, setPassword2] = useState("");
  const [password, setPassword] = useState("");

  useEffect(() => {
    if (isSuccess) {
      document.getElementById("alertDiv").classList.add("show");
    }
  }, [isSuccess]);

  const handleRegistration = (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    form.classList.add("was-validated");
    const params = { username, password, name, lastName, email };
    mutate(params);
    setTimeout(() => {
      const path = "/";
      navigate(path);
    }, 3000);
  };
  useEffect(() => {
    if (password1 !== password2) {
      document.getElementById("repeatPassword")?.classList.add("is-invalid");
    } else if (password2 === "") {
    } else if (password1 === password2) {
      document.getElementById("repeatPassword")?.classList.remove("is-invalid");
      document.getElementById("repeatPassword")?.classList.add("is-valid");
      setPassword(password1);
    }
  }, [password, password1, password2]);

  return (
    <>
      <HomeNav></HomeNav>
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
      <div
        id="alertDiv"
        className=" container col-3 alert alert-success fade text-center"
      >
        <h3>User Created!!</h3>
      </div>
      <div className="container col-lg-3 text-center no-color">
        <form id="form" noValidate>
          <div className="form-floating mb-3">
            <input
              type="text"
              className="form-control"
              id="username"
              aria-describedby="username"
              placeholder="username"
              required
              value={username}
              onChange={(e) => {
                setUsername(e.target.value);
              }}
            />
            <label htmlFor="username" className="form-label">
              Username
            </label>
            <div className="invalid-feedback">
              Please enter a valid username
            </div>
            <div className="valid-feedback">Valid username</div>
          </div>
          <div className="form-floating mb-3">
            <input
              type="text"
              className="form-control"
              id="name"
              placeholder="name"
              required
              value={name}
              onChange={(e) => {
                setName(e.target.value);
              }}
            />
            <label htmlFor="name" className="form-label">
              Name
            </label>
            <div className="invalid-feedback">Please enter a valid name</div>
            <div className="valid-feedback">Valid name</div>
          </div>
          <div className="form-floating mb-3">
            <input
              type="text"
              className="form-control"
              id="lastName"
              placeholder="lastName"
              required
              value={lastName}
              onChange={(e) => {
                setLastName(e.target.value);
              }}
            />
            <label htmlFor="lastName" className="form-label">
              Last Name
            </label>
            <div className="invalid-feedback">
              Please enter a valid last name
            </div>
            <div className="valid-feedback">Valid last name</div>
          </div>
          <div className="form-floating mb-3">
            <input
              type="email"
              className="form-control"
              id="email"
              placeholder="email"
              required
              value={email}
              onChange={(e) => {
                setEmail(e.target.value);
              }}
            />
            <label htmlFor="email" className="form-label">
              Email
            </label>
            <div className="invalid-feedback">Please enter a valid email</div>
            <div className="valid-feedback">Valid email</div>
          </div>
          <div className="form-floating mb-3">
            <input
              type="password"
              className="form-control"
              id="password"
              placeholder="password"
              required
              value={password1}
              onChange={(e) => {
                setPassword1(e.target.value);
              }}
            />
            <label htmlFor="password" className="form-label">
              Password
            </label>
            <div className="invalid-feedback">Fill in the password</div>
            <div className="valid-feedback">Password ok</div>
          </div>
        </form>
        <form>
          <div className="form-floating mb-3">
            <input
              type="password"
              className="form-control"
              id="repeatPassword"
              placeholder="repeatPassword"
              required
              value={password2}
              onChange={(e) => {
                setPassword2(e.target.value);
              }}
            />
            <label htmlFor="repeatPassword" className="form-label">
              Repeat Password
            </label>
            <div className="invalid-feedback">Passwords don't match</div>
            <div className="valid-feedback">Password ok</div>
          </div>
          <button
            type="submit"
            className="btn btn-primary"
            onClick={(e) => {
              handleRegistration(e);
            }}
          >
            Register
          </button>
        </form>
      </div>
    </>
  );
};

export default Register;
