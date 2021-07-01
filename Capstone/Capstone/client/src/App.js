import React from "react";
import { BrowserRouter as Router } from "react-router-dom";
import Header from "./components/Header";
import ApplicationViews from "./components/ApplicationViews";
import { UserProfileProvider } from "./providers/UserProfileProvider";
import { ClassroomProvider } from "./providers/ClassroomProvider";
import { AssignmentProvider } from "./providers/AssignmentProvider"


function App() {
  return (
    <Router>
      <UserProfileProvider>
        <ClassroomProvider>
          <AssignmentProvider>
            <Header />
            <ApplicationViews />
          </AssignmentProvider>
        </ClassroomProvider>
      </UserProfileProvider>
    </Router>
  );
}

export default App;
