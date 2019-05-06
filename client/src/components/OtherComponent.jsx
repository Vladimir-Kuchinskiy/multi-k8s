import React from "react";
import { Link } from "react-router-dom";

const OtherComponent = () => {
  return (
    <div>
      Other Component <br />
      <Link to="/">Go back home</Link>
    </div>
  );
};

export default OtherComponent;
