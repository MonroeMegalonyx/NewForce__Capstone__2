import React, { useContext, useEffect, useState } from "react";
import { AssignmentContext } from "../providers/AssignmentProvider";
import { ClassroomContext } from "../providers/ClassroomProvider";
import { Redirect } from "react-router-dom";
import { useParams, useHistory } from "react-router-dom";
import Button from "reactstrap/lib/Button";


const AssignmentForm = () => {
  // Get the content for assignments to add or edit
  const { getSingleAssignment, editAssignment } = useContext(AssignmentContext);
  // Get the categories for a dropdown selector in form
  const { classrooms, getTeachersClasses } = useContext(ClassroomContext);

  // Get the logged in user from session storage to save as teacher Id
  const loggedInUser = sessionStorage.getItem("userProfile");
  function extractedId() {
    var str = loggedInUser;
    var matches = str.match(/\d+/g);
    return matches[0];
  }
  const loggedInTeacherId = extractedId()

  // Define the inital state of a new post
  const [assignment, setAssignment] = useState({
     name: null,
     instructions: null,
     dueDate: null,
     classId: null
  });

  // Wait for data before Save button is active
  const [isLoading, setIsLoading] = useState(true);

  // Get the Id of an existing post from URL for editing
  const { assignmentId } = useParams();

  const history = useHistory();
  
  // When the field is changed, update the state
  const handleControlledInputChange = (event) => {
    /* When changing a state object or array,
      always create a copy, make changes, and then set state.*/
    const newAssignment = { ...assignment };
    /* Post is an object with properties.
      Set the property to the user entered value
      using object bracket notation. */
    newAssignment[event.target.id] = event.target.value;
    // Update original state with new values from user input 
    setAssignment(newAssignment);
  };

  const handleClickSave = (event) => {
    event.preventDefault(); // Prevents the browser from submitting the form
    const newAssignment = { ...assignment };
    if (
      typeof newAssignment.name ==='undefined' ||
      typeof newAssignment.instructions ==='undefined' ||
      typeof newAssignment.classId ==='undefined' ||
      newAssignment.name ===null ||
      newAssignment.instructions ===null ||
      newAssignment.classId ===null
    ) {
      window.alert(
        "Something is wrong. Please fill in all required information"
      );
    } else { 
      //disable the button - no extra clicks
      setIsLoading(true);
      if (assignmentId){
        // PUT - update
        
        editAssignment(assignmentId, newAssignment).then(() => history.push(`/`));
      } else {
        // POST - add

        // newAssignment.userProfileId = loggedInTeacherId;
        // // Now add the new Assignment with the author and created time data
        // addAssignment(newAssignment).then(() => history.push("/"));
      }
    }
  };

  // Load classes on initialization. If a assignmentId is in the URL, get the assignment content too
  useEffect(() => {
    getTeachersClasses(loggedInTeacherId).then(() => {
      if (assignmentId){
        getSingleAssignment(assignmentId)
        .then(assignment => {
          console.log(assignment)
          setAssignment(assignment)
            setIsLoading(false)
        })
      } else {
        setIsLoading(false)
      }
    });
  }, []);

    return (
      <form className="assignmentForm">
        {assignmentId ? <h2 className="assignmentForm__title">Edit Assignment</h2> : <h2 className="assignmentForm__title">New Assignment</h2>}
        <fieldset>
          <div className="form-group">
            <label htmlFor="name">Assignment name:</label>
            <input
              type="text"
              id="name"
              onChange={handleControlledInputChange}
              required
              autoFocus
              className="form-control"
              placeholder="Assignment name"
              defaultValue={assignment.name}
            />
          </div>
        </fieldset>
        <fieldset>
          <div className="form-group">
            <label htmlFor="instructions">Instructions:</label>
            <input
              type="text"
              id="instructions"
              onChange={handleControlledInputChange}
              required
              autoFocus
              className="form-control"
              placeholder="Instructions for assignment"
              defaultValue={assignment.instructions}
            />
          </div>
        </fieldset>
        <fieldset>
          <div className="form-group">
            <label htmlFor="dueDate">
              Due Date (optional):
            </label>
            <input
              type="datetime-local"
              id="dueDate"
              onChange={handleControlledInputChange}
              required
              autoFocus
              className="form-control"
              defaultValue={assignment.dueDate}
            />
          </div>
        </fieldset>
        <fieldset>
          <div className="form-group">
            <label htmlFor="classId">Pick a classroom: </label>
            <select
              onChange={handleControlledInputChange}
              value={assignment.classId}
              name="classId"
              id="classId"
              className="form-control"
            >
              <option value="0">Select a classroom</option>
              {classrooms
                .map((c) => (
                  <option key={c.id} value={c.id}>
                    {c.name}
                  </option>
                ))}
            </select>
          </div>
        </fieldset>
        <Button className="btn btn-primary" disabled={isLoading} onClick={handleClickSave}>
        {assignmentId ? <>Save Assignment</> : <>Add Assignment</>}
        </Button>
        <Button onClick={() => history.push(`/`)}>Cancel</Button>
      </form>
    );
  };

export default AssignmentForm;
