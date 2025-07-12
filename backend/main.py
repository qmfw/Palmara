from fastapi import FastAPI
from routes.palm_reader import router as palm_router

app = FastAPI()
app.include_router(palm_router)