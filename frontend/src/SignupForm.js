import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import "./SignupForm.css";

/**
 * The signup form for the site
 *
 * Props:
 *  -signUp: fn to call in App
 *
 * State:
 * - formData: data entered into the form
 * - formErrors: errors encountered while filling form
 *
 * Signup -> SignupForm
 */


function SignupForm({ signUp }) {
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    username: "",
    password: "",
    firstName: "",
    lastName: "",
    email: "",
  });
  const [formErrors, setFormErrors] = useState([]);

  console.log("Signup Form renders", formData, formErrors);

  /** Handle user updates on the form by named input field */
  function handleChange(evt) {
    const { name, value } = evt.target;
    setFormData((fData) => ({ ...fData, [name]: value }));
  }

  /** Call function from prop and redirect to homepage. Set errors if any returned */
  async function handleSubmit(evt) {
    evt.preventDefault();
    try {
      await signUp(formData);
      navigate("/");
    } catch (err) {
      setFormErrors(err);
    }
  }
  return (
    <div className='SignupForm'>
      <h2>Sign up for Jobly</h2>
      <form onSubmit={handleSubmit}>
        <div class="SignupForm-field">
          <label htmlFor="username">Username</label>
          <br></br>
          <input
            name="username"
            id="username"
            value={formData.username}
            onChange={handleChange}
          />
        </div>
        <div class="SignupForm-field">
          <label htmlFor="password">Password</label>
          <br></br>
          <input
            name="password"
            id="password"
            type="password"
            value={formData.password}
            onChange={handleChange}
          />
        </div>
        <div class="SignupForm-field">
          <label htmlFor="firstName">First Name</label>
          <br></br>
          <input
            name="firstName"
            id="firstName"
            value={formData.firstName}
            onChange={handleChange}
          />
        </div>
        <div class="SignupForm-field">
          <label htmlFor="lastName">Last Name</label>
          <br></br>
          <input
            name="lastName"
            id="lastName"
            value={formData.lastName}
            onChange={handleChange}
          />
        </div>
        <div class="SignupForm-field">
          <label htmlFor="email">Email</label>
          <br></br>
          <input
            name="email"
            id="email"
            value={formData.email}
            onChange={handleChange}
          />
        </div>

        {formErrors.length > 0
          ? <div>{formErrors.map((err, i) => <p key={i}>Error: {formErrors[i]}</p>)}</div>
          : null
        }

        <div className='SignupForm-submitBtn'>
          <button type="submit">Submit</button>
        </div>
      </form>
    </div>
  );
}

export default SignupForm;