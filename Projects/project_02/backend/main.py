from fastapi import FastAPI, Request, HTTPException
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel, Field

app = FastAPI()

class ProjectCreate(BaseModel):
    name: str = Field(min_length=3,max_length=100)
    description: str = Field(max_length=1000)
    priority: int = Field(ge=1,le=5)

class ProjectResponse(BaseModel):
    name: str
    description: str
    priority: int

app.mount("/statics", StaticFiles(directory="statics"), name="static")
templates = Jinja2Templates(directory="templates")

@app.get("/")
def home(request: Request):
    return templates.TemplateResponse(
        "index.html",
        {"request":request}
    )

@app.get("/api/health")
def health_check():
    return {
        "status" : "ok"
        }


@app.get("/api/projects", response_model=ProjectResponse)
def create_project():
    return [
        {"id":1, "name": "FastAPI extra"}
    ]

@app.get("/api/projects/{id}", response_model=ProjectResponse)
def get_project(id:int):
    return {
        "id":id,
        "name":" "
    }