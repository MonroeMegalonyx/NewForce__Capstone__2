import React, { useContext } from "react";
import { Switch, Route, Redirect } from "react-router-dom";
import { UserProfileContext } from "../providers/UserProfileProvider";
import Login from "./Login";
import Register from "./Register";
import ClassroomList from "./ClassroomList";
import AssignmentList from "./AssignmentList";

export default function ApplicationViews() {
  const { isLoggedIn } = useContext(UserProfileContext);

  return (
    <main>
      <Switch>
        <Route path="/" exact>
          {isLoggedIn ? <ClassroomList /> : <Redirect to="/login" />}
        </Route>

        <Route path="/classes/(\d+)" exact>
          {isLoggedIn ? <AssignmentList /> : <Redirect to="/login" />}
        </Route>

        <Route path="/login">
          <Login />
        </Route>

        <Route path="/register">
          <Register />
        </Route>
      </Switch>
    </main>
  );
};
