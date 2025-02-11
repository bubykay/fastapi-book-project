@channel Hey DevOps Interns - The Cool Kids
Stage 2: DevOps: Deploy a FastAPI Application with CI/CD Pipeline

Objective:
You are to deploy a FastAPI application with a Continuous Integration (CI) and Continuous Deployment (CD) pipeline. You will use an existing template repository, add a missing endpoint, set up a test pipeline, and configure the deployment process. Your application should be served using Nginx.

Repository Template:
Fork the following repository as your starting point: https://github.com/hng12-devbotops/fastapi-book-project

Tasks to Complete:
1. Implement the Missing Endpoint
- Add an endpoint to retrieve a book by its ID:
    - Path: /api/v1/books/{book_id}
    - The endpoint should return a JSON response containing the book details.
    - If the book does not exist, return a 404 Not Found response.
    - Do not delete any books from the database.
2. Set Up the CI Pipeline
- The CI pipeline should only run pytest to execute the existing tests.
- The workflow should be triggered on pull requests to the main branch.
- The workflow file must:
    - Contain a job named exactly test.
    - Fail if there are issues in the application.
    - Succeed if the application passes all tests.
3. Set Up the Deployment Pipeline
- On merging a pull request to the main branch, a workflow should trigger a job named exactly deploy.
- If the deploy job runs successfully, your site should automatically be updated with the latest changes.
4. Dockerization Requirement:
- Create a Dockerfile that builds and packages the FastAPI application.
- The Dockerfile should:
    - Use an official lightweight Python image as the base.
    - Install necessary dependencies for FastAPI.
    - Expose the required port and set the appropriate FastAPI entry point.
5. Serve the Application Over Nginx
- Your deployed application should be served using Nginx as a reverse proxy.
- Ensure proper configuration so that API requests are correctly handled by the FastAPI backend.
6. Repository Access Requirement
- Before submitting your solution, invite the hng12-devbotops GitHub account as a collaborator to your repository.
7. Submission Instructions
- Submit your solution in your stage two slack channel #stage-two-devops using the /submit command.
- Provide the following:
    a. The base URL of your deployed application (without any paths or endpoints).
    b. Your GitHub repository URL (without .git at the end).

Evaluation Criteria
Your submission will be assessed based on the following:
✅ Correctness: The API functions as expected and includes the missing endpoint.
✅ CI/CD Setup: The test and deployment workflows are correctly configured.
✅ Deployment: The application is successfully deployed and accessible on merge to main.
✅ Dockerization: The FastAPI application is correctly containerized and can build and run with docker build -t fastapi-app . && docker run -p 8000:8000 fastapi-app
✅ Nginx Integration: The application is properly served via Nginx.

NOTE:
😞 If you fail all 3 attempts, you’ll get another chance in HNG13.
😕 Some tests will fail at first due to the missing endpoint. Implement it and ensure all tests pass before submission.
🙅 DO NOT MODIFY main.py UNDER ANY CIRCUMSTANCES.

🏁 Submission Deadline
The deadline for submissions is 12th February 2025, 11:59 PM WAT (GMT +1). Late submissions will not be entertained.