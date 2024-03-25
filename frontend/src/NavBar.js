import React, { useContext } from "react";
import { NavLink } from "react-router-dom";

import userContext from "./userContext";
import "./NavBar.css";

/** App NavBar element for navigation
 *
 * Props:
 * - logOut: fn to call from ancestor
 *
 * State:
 * - None
 *
 * App -> NavBar
 */

function NavBar({ logOut }) {
  const { currUser } = useContext(userContext);
  console.log("NavBar rendered");

  return (
    <div className="NavBar">
      <ul>
        <li>
          <div id="brand" className="NavBar-brand">
            <NavLink to="/" end>Jobly</NavLink>
          </div>
        </li>
      </ul>

      <div className="NavBar-nav">
        {currUser &&
          <ul>
            <li>
              <NavLink to="/companies">Companies</NavLink>
            </li>
            <li>
              <NavLink to="/jobs">Jobs</NavLink>
            </li>
            <li>
              <NavLink to="/profile">Profile</NavLink>
            </li>
            <li>
              <a onClick={logOut}>Log out {currUser.userName}</a>
            </li>
          </ul>
        }
        {!currUser &&
          <ul>
            <li>
              <NavLink to="/login">Login</NavLink>
            </li>
            <li>
              <NavLink to="/signup">Signup</NavLink>
            </li>
          </ul>
        }
      </div>
    </div>
  );
}

export default NavBar;