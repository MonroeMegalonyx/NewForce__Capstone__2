import React, { useContext, useEffect } from "react";
import { AssignmentContext } from "../providers/AssignmentProvider";
import Assignment from "./Assignment";
import { useHistory, useParams } from "react-router-dom";
import Button from "reactstrap/lib/Button";


const AssignmentList = () => {
  const { assignments, getClassAssignments } = useContext(AssignmentContext);
  const history = useHistory();

  // Get the classroom Id from URL
  const { classroomId } = useParams();

  useEffect(() => {
    getClassAssignments(classroomId);
  }, []);

  return (
    <div className="container">
      <Button onClick={() => history.push("/assignments/new")}>New Assignment</Button>

      <div className="row justify-content-center">
        <div className="cards-column">
          {assignments?.map((assignment) => (
              <Assignment key={assignment.id} assignment={assignment} />
            ))}
        </div>
      </div>
    </div>
  );
};

export default AssignmentList;