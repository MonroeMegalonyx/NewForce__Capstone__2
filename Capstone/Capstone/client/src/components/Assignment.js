import React, { useContext } from "react";
import { Card, CardBody } from "reactstrap";
import Button from "reactstrap/lib/Button";
import { useHistory, useParams } from "react-router-dom";
import { AssignmentContext } from "../providers/AssignmentProvider";

const Assignment = ({ assignment }) => {
  const { deleteAssignment } = useContext(AssignmentContext);
  const history = useHistory();
  // Get the classroom Id from URL
  const { classroomId } = useParams();

  // Delete the assignment after confirmation if its the user's post
  const handleDelete = () => {
    const aid = assignment.id
    const r = window.confirm(`Are you sure you want to delete "${assignment.name}"?`)
    if (r === true) {
      deleteAssignment(aid, classroomId)
        .then(() => {
          // history.push(`/classes/${classroomId}`)
          history.go(0)
        })
    }
    else
    {
      // history.push(`/classes/${classroomId}`)
      history.go(0)
    }
  }
  return (
    <Card className="m-4">
      <p className="text-left px-2">{assignment.name}</p>
      <CardBody>
        {/* Can only delete assignments not used in other tables already */}
      <Button onClick={handleDelete}>Delete assignment</Button>

      {/* <Button onClick={() => history.push(`/assignments/${assignment.id}`)}>
        View Class
      </Button> */}
      </CardBody>
    </Card>
  );
};

export default Assignment;
