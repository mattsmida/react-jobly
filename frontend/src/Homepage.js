import React, { useContext } from 'react';
import { Link } from 'react-router-dom';

import userContext from './userContext';
import "./Homepage.css";

/** Renders the homepage of the app
 *
 * Endpoint: "/" (root)
 *
 * Props:
 *  - None
 *
 * State:
 *  - None
 *
 * App -> RouteList -> Homepage
 */

function Homepage() {
  const { currUser } = useContext(userContext);

  console.log("*** Homepage", currUser);

  return (
    <div className="Homepage">
      <h1>Jobly</h1>
      <h2>All the jobs in one, convenient place.</h2>
      {currUser
        ? <h3>Welcome back, {currUser.firstName}!</h3>
        : (
          <div class="Homepage-buttons">
            <Link to="/signup">Sign up</Link>
            &nbsp;&nbsp;&nbsp;
            <Link to="/login">Log in</Link>
          </div>
        )}
    </div>
  );
}

export default Homepage;