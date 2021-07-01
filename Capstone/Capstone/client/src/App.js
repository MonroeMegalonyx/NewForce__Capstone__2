import React from "react";
import { BrowserRouter as Router } from "react-router-dom";
import Header from "./components/Header";
import ApplicationViews from "./components/ApplicationViews";
import { UserProfileProvider } from "./providers/UserProfileProvider";
import { ClassroomProvider } from "./providers/ClassroomProvider"


function App() {
  return (
    <Router>
      <UserProfileProvider>
        <ClassroomProvider>
          <Header />
          <ApplicationViews />
        </ClassroomProvider>
      </UserProfileProvider>
    </Router>
  );
}

export default App;
