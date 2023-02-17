import React, { useState } from "react";
import { useNavigate, Link } from "react-router-dom";
import Swal from "sweetalert2";

export default function Login() {
  const [setLoading] = useState(true);

  const [values, setValues] = useState({
    password: "",
    username: "",
  });

  const handleChanges = (event) => {
    setValues({
      ...values,
      [event.target.name]: event.target.value,
    });
    console.log(values);
  };

  const handleChange = (prop) => (event) => {
    setValues({ ...values, [prop]: event.target.value });
  };

  const history = useNavigate();

  const handleSubmit = (event) => {
    event.preventDefault();
    const data = new FormData(event.currentTarget);
    console.log({
      username: data.get("username"),
      password: data.get("password"),
    });
    createacc();
  };

  async function createacc() {
    try {
      let result = await fetch(
        "http://hacknich.pythonanywhere.com/login/login/",
        {
          method: "POST",
          body: JSON.stringify({
            password: values.password,
            username: values.username,
          }),
          headers: {
            "Content-Type": "application/json",
            Accept: "application/json",
          },
        }
      );
      result = await result.json();
      console.log(result);
      if (result.token) {
        Swal.fire("Logged in Successfully!", "success", "success");
        sessionStorage.setItem("name", result.user.username);
        sessionStorage.setItem(
          "user_id",
          JSON.parse(JSON.stringify(result.user.id))
        );
        sessionStorage.setItem("token", result.token);
        history("/");
      } else {
        Swal.fire("Oops!!", "Some error while login", "error");
      }
    } catch (error) {
      console.log("Error" + error);
      setLoading(false);
    }
  }

  return (
    <>
      <div className="col-lg-10">
        <div className="shadow rounded p-5 bg-white">
          <div className="row">
            <div className="col-lg-6">
              <div className="contact-form">
                <form className="mt-5 mb-5 login-input" onSubmit={handleSubmit}>
                  <div className="form-group">
                    <input
                      type="text"
                      className="form-control"
                      placeholder="Username"
                      id="username"
                      label="Username"
                      name="username"
                      value={values.username}
                      onChange={handleChanges}
                      autoComplete="name"
                      autoFocus
                      required
                    />
                  </div>
                  <div className="form-group">
                    <input
                      type="password"
                      className="form-control"
                      placeholder="Password"
                      name="password"
                      label="Password"
                      id="password"
                      value={values.password.trim()}
                      onChange={handleChange("password")}
                      autoComplete="current-password"
                      required
                    />
                  </div>
                  <button
                    className="btn login-form__btn submit w-100"
                    type="submit"
                  >
                    Login
                  </button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <p className="mt-5 login-form__footer">
        Dont have an account?
        <Link to="/" className="text-primary">
          Sign Up
        </Link>
        now
      </p>
    </>
  );
}
