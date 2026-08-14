from fastapi import FastAPI, Request
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles

app = FastAPI()
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


@app.get("/api/projects")
def create_project():
    return [
        {"id":1, "name": "FastAPI extra"}
    ]

