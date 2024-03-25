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
      {/* TODO: background image */}
      <h1>Jobly</h1>
      <p>All the jobs in one, convenient place.</p>
      {currUser
        ? <h2>Welcome back, {currUser.firstName}!</h2>
        : (
          <div>
            <Link to="/signup">Sign up</Link>
            &nbsp;&nbsp;&nbsp;
            <Link to="/login">Log in</Link>
          </div>
        )}
    </div>
  );
}

export default Homepage;