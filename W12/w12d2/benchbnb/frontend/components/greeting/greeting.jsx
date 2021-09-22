import React from "react";
import { Link } from "react-router-dom";

class Greeting extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const {currentUser, logout} = this.props;

    const display = currentUser ? (
      <div>
        <p>
          Hello, {currentUser.username}
        </p>
        <button onClick={logout}>Log out</button>
      </div>
    ) : (
      <div>
        <Link to='/signup'> Sign up </Link>
        <Link to='/login'> Login </Link>
      </div>
    );

    return (
      <div>
        {display}
      </div>
    )
  }
}

export default Greeting;