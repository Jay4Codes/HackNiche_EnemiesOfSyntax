import React, { useState } from "react";
import { useNavigate, Link } from "react-router-dom";
import Swal from "sweetalert2";

export default function Signup() {
  const [setLoading] = useState(true);

  const [values, setValues] = useState({
    password: "",
    username: "",
    email: "",
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
      email: data.get("email"),
    });
    createacc();
  };

  async function createacc() {
    try {
      let result = await fetch(
        "",
        {
          method: "POST",
          body: JSON.stringify({
            password: values.password,
            username: values.username,
            email: values.email,
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
        Swal.fire("Signed in Successfully!", "success");
        history("/login");
      } else {
        Swal.fire("Oops!!", "Some error while signup", "error");
      }
    } catch (error) {
      console.log("Error" + error);
      setLoading(false);
    }
  }

  return (
    <>
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
            type="email"
            className="form-control"
            placeholder="Email"
            id="email"
            label="Email Address"
            name="email"
            value={values.email}
            onChange={handleChanges}
            autoComplete="email"
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
        <button className="btn login-form__btn submit w-100" type="submit">
          Sign in
        </button>
      </form>
      <p className="mt-5 login-form__footer">
        Already have an account?
        <Link to="/login" className="text-primary">
          Log In
        </Link>
        now
      </p>
    </>
  );
}
