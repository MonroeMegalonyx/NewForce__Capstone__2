import React, { useState, useContext } from "react";
import { UserProfileContext } from "./UserProfileProvider";

export const AssignmentContext = React.createContext();

export function AssignmentProvider(props) {
  const apiUrl = "https://localhost:5001/api/assignment";

  const [assignments, setAssignments] = useState([]);
  const { getToken } = useContext(UserProfileContext);

  const getClassAssignments = (id) => {
    return getToken().then((token) =>
      fetch(`${apiUrl}/${id}`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      })
        .then((res) => res.json())
        .then(setAssignments)
    );
  };

  const addAssignment = (assignment) => {
    return getToken().then((token) =>
      fetch(`${apiUrl}/`, {
        method: "POST",
        headers: {
          Authorization: `Bearer ${token}`,
          "Content-Type": "application/json"
        },
        body: JSON.stringify(assignment)
      })
    );
  };

  const deleteAssignment = (id, classId) => {
    return getToken().then((token) =>
      fetch(`${apiUrl}/${id}`, {
        method: "DELETE",
        headers: {
          Authorization: `Bearer ${token}`,
        },
      }).then(getClassAssignments(`${classId}`))
    );
  };

  return (
    <AssignmentContext.Provider
      value={{
        assignments,
        getClassAssignments,
        addAssignment,
        deleteAssignment
      }}
    >
      {props.children}
    </AssignmentContext.Provider>
  );
};
