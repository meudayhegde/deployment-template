from fastapi import FastAPI
import uvicorn

app = FastAPI(
    title="API Server",
    version="0.1.0",
    root_path="/api"
)


@app.get("/")
async def read_root():
    return {"message": "Hello, world!"}


@app.get("/health")
async def health():
    return {"status": "ok"}


if __name__ == "__main__":
    uvicorn.run("app:app", host="0.0.0.0", port=8000, reload=True)