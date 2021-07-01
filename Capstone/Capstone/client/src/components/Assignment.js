import React from "react";
import { Card, CardBody } from "reactstrap";
import Button from "reactstrap/lib/Button";
import { useHistory } from "react-router-dom";

const Assignment = ({ assignment }) => {
  const history = useHistory();

  return (
    <Card className="m-4">
      <p className="text-left px-2">{assignment.name}</p>
      <CardBody>
      {/* <Button onClick={() => history.push(`/assignments/${assignment.id}`)}>
        View Class
      </Button> */}
      </CardBody>
    </Card>
  );
};

export default Assignment;
