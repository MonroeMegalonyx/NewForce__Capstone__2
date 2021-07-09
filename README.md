# GRDBKS: An all-in-one learning management system (LMS) for teachers

## Capstone Project for second three months of NewForce
[NewForce](https://newforce.co/) is an intensive full-time 6-month software development immersive training program in WV focusing on full stack (C#/.NET) development fundamentals and problem solving. The final half of the program is executed in a simulated company environment with Scrum methodology.

During the final 2 week sprint of this apprenticeship I designed and executed a capstone project built using a full stack environment including ASP.NET, MVC, and Razor templates in Visual Studio 2019, RESTful Web API with C#/.NET Core, and Javascript/React client application with 3rd party authentication.

There are so many platforms available that a teacher usually has to spend time learning how to use their school’s chosen LMS with each new job or as the district switches contracts to different companies every few years. Teachers rarely learn how to fully take advantage of their LMS capabilities because of this turnover and if they move jobs to a new district they will lose all their previous work stored in their previous LMS. 

Enter GRDBKS, an all-in-one platform streamlined to just the basics teachers need for their classroom so they can focus on teaching instead of grading. My LMS allows teachers to log in and view their classrooms with students, view and manage all their assignments, record grades and feedback for students, and quickly see what assignments are due soon.  GRDBKS can be used alongside existing LMS, so teachers can learn GRDBKS once and use it for years regardless of which school they work for or LMS they are currently using.

Teachers can also take GRDBKS with them to a new job, so their previous body of work doesn’t disappear into the cloud when they switch districts. GRDBKS gives teachers the tools they need to manage their classroom digitally, without distracting add ons or restrictive district policies. 

My first capstone project focused on client side tools to build a React application can be found [here](https://github.com/MonroeMegalonyx/NewForce__Capstone__1).

## Setup
__Initial setup__
Using directions from the [Web API tutorial](https://github.com/NewForce-at-Mountwest/bangazon-inc/blob/master/book-3-web-api/chapters/ASP_NET_WEB_API_INTRO.md) and for [Firebase Authentication](https://github.com/NewForce-at-Mountwest/bangazon-inc/blob/master/book-3-web-api/chapters/FIREBASE_AUTH.md), I created a new project in Visual Studio 2019.
1. Run the SQL script to create tables and prepopulate data.

1. Open Visual Studio and select "Create a new project". In the "Create a new project" dialog, choose the "ASP.NET Core Web API" option for C#

1. Name the project and chose a folder location.

1. The new project will open automatically. Then in "Solution Explorer", right click the name of the project and select "Manage Nuget Packages". Install the `Microsoft.Data.SqlClient` and `Microsoft.AspNetCore.Authentication.JwtBearer` packages. I now have an ASP.NET Core Web API project!

1. __Write__ and execute the database creation script and seed data script. The database design is shown in the ERD below. 

1. Update the `appsettings.json` file to contain the database connection string.

1. Now create the client side application. Make a new folder `client` inside the project directory and build a new react application using `npx create-react-app .`

1. Update the Configure method in `Startup.cs` so that while in development the app won't throw CORS errors. This can also be handled by adding a proxy property to the package.json on the client side. When using a proxy, the API URL is already stated and can be abbreviated in the provider scripts. If using CORS handling server side, then the API URL should be written out in full with the client provider scripts.

1. Add Firebase authentication by first creating a project in Firebase and adding some users.

1. Update the appsettings.json file to add a "FirebaseProjectId" key. Make the value of this key the Firebase project id.

1. Add a new `.env.local` file to the client director and add the Firebase API Key as REACT_APP_API_KEY="". Add this key path to the `firebaseConfig` in `index.js` for the client.

1. Use `npm` to install firebase and bootstrap into the client project folder `npm install --save bootstrap reactstrap firebase`

Some basic steps for the React Client App to add authentication: 
- Create a UserProfileProvider component and a UserProfileContext context in a UserProfileProvider.js file.
- Add login, logout and register functions to the UserProfileProvider.
- Add an isLoggedIn boolean to the UserProfileProvider's state.
- Update fetch() calls throughout the app to include an Authorization header that uses the Firebase token.


__Current Project Setup__
1. To recreate this application on your device, first pull down this repository.

1. Run the two scripts that are in the SQL folder. These will create the LMS database and add some testing data.

1. Create a Firebase project for authentication:

   - Go to [Firebase](https://console.firebase.google.com/u/0/) and add a new project. You can name it whatever you want (Tabloid is a good name)
   - Go to the Authentication tab, click "Set up sign in method", and enable the Username and Password option.
   - Add at least two new users in Firebase. Use email addresses that you find in the UserProfile table of your SQL Server database
   - Once Firebase creates a UID for these users, copy the UID from Firebase and update the `FirebaseUserId` column for the same users in your SQL Server database.
   - Click the Gear icon in the sidebar to go to Project Settings. You'll need the information on this page for the next few steps

1. Go to the `appSettings.json` file. Replace the value for FirebaseProjectId with your own.

1. Open your `client` directory in VSCode. Create a `.env.local` file and add your own Firebase Web API Key as REACT_APP_API_KEY="".

1. Install missing dependencies by running `npm install` from the same directory as the `package.json` file.

## Design
For this project, I utilized both a digital wireframe and ERD to plan the final app design.

|![ERD](/images/ERD.png)|
|---|
| *ERD of my database.* |

|![Wireframe](/images/Wireframe.png)|
|---|
| *Wireframe made to plan layout and UX of application.* |
## Features

### Server Side - API
I created a RESTful Web API with C#/ .NET Core and connected it to a React front-end. The API had full CRUD funcationality for Assignments, and other functionality for Users and Classes.

|![APIs running in Swagger Console](/images/API-swagger.png)|
|---|
| *Screenshot of the APIs exposed by our application in the Swagger console.* |

### Authentication
Authentication was integrated with Google Firebase to provide reliable and secure 3rd party login functionality. Authenticated users were also managed in the application database using Firebase's user keys to sync credentials.

|![Login Page](/images/Login.png)|
|---|
| *Screenshot of the login page showing how an existing user can sign in or a new user could register.* |
### Classrooms and Assignments
Different classes a teacher is teaching in can be accessed once logged in. This feature allows a user to view all classrooms they are in charge of, and easily navigate back to this home page from anywhere using the navigation bar at the top. 

When a user views a specific classroom, they will see a list of assignments given to that classroom. They can also create a new assignment by clicking the New Post button at the top of the page. Existing assignments can be edited or deleted from the classroom entirely.

|![Home Page](/images/Home.png)|
|---|
| *Screenshot of the home page showing the list of classrooms a teacher is part of.* |

|![Classroom Page](/images/Assignments.png)|
|---|
| *Screenshot of a specific classroom showing the list of assignments made for that class, with the options to edit or delete an assignment* |

|![Create Assignment Form](/images/New-Assignment.png)|
|---|
| *Screenshot of the create form, which is a shared component with the edit form depending on the context.* |

|![Edit Assignment Page](/images/Edit-Assignment.png)|
|---|
| *Screenshot of the edit page showing an assignment's current information that can be edited by the teacher.* |

|![Delete Popup](/images/Delete-Assignment.png)|
|---|
| *Screenshot of the popup confirmation when a teacher tries to delete an assignment in the list.* |
