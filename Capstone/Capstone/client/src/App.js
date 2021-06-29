import React from "react";
import { BrowserRouter as Router } from "react-router-dom";
import Header from "./components/Header";
import ApplicationViews from "./components/ApplicationViews";
import { UserProfileProvider } from "./providers/UserProfileProvider";


function App() {
  return (
    <Router>
      <UserProfileProvider>
        <Header />
        <ApplicationViews />
      </UserProfileProvider>
    </Router>
  );
}

export default App;
