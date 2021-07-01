import React, { useState, useContext } from "react";
import { UserProfileContext } from "./UserProfileProvider";

export const ClassroomContext = React.createContext();

export function ClassroomProvider(props) {
  const apiUrl = "https://localhost:5001/api/class";

  const [classrooms, setClassrooms] = useState([]);
  const { getToken } = useContext(UserProfileContext);

  const getTeachersClasses = (id) => {
    return getToken().then((token) =>
      fetch(`${apiUrl}/${id}`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      })
        .then((res) => res.json())
        .then(setClassrooms)
    );
  };

  return (
    <ClassroomContext.Provider
      value={{
        classrooms,
        getTeachersClasses
      }}
    >
      {props.children}
    </ClassroomContext.Provider>
  );
};
