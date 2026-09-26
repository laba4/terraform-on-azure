from fastapi import FastAPI

from db import create_db_and_tables
from routes import router

create_db_and_tables()

app = FastAPI()
app.include_router(router)
