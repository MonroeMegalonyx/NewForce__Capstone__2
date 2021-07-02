import React, { useContext, useEffect } from "react";
import { AssignmentContext } from "../providers/AssignmentProvider";
import Assignment from "./Assignment";
import { useHistory, useParams } from "react-router-dom";

const AssignmentList = () => {
  const { assignments, getClassAssignments } = useContext(AssignmentContext);

  // Get the classroom Id from URL
  const { classroomId } = useParams();

  useEffect(() => {
    getClassAssignments(classroomId);
  }, []);

  return (
    <div className="container">
      <div className="row justify-content-center">
        <div className="cards-column">
          {assignments.map((assignment) => (
              <Assignment key={assignment.id} assignment={assignment} />
            ))}
        </div>
      </div>
    </div>
  );
};

export default AssignmentList;