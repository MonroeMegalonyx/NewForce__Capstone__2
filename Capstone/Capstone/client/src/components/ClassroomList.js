import React, { useContext, useEffect } from "react";
import { ClassroomContext } from "../providers/ClassroomProvider";
import Class from "./Class";

const ClassroomList = () => {
  const { classrooms, getTeachersClasses } = useContext(ClassroomContext);

  // Get the user ID
  const loggedInUser = sessionStorage.getItem("userProfile");
  function extractedId() {
    var str = loggedInUser;
    var matches = str.match(/\d+/g);
    return matches[0];
  }

  const loggedInTeacherId = extractedId()

  useEffect(() => {
    getTeachersClasses(loggedInTeacherId);
  }, []);

  return (
    <div className="container">
      <div className="row justify-content-center">
        <div className="cards-column">
          {classrooms.map((room) => (
              <Class key={room.id} room={room} />
            ))}
        </div>
      </div>
    </div>
  );
};

export default ClassroomList;