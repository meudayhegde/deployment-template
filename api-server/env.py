from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    CELERY_BROKER_URL: str
    CELERY_RESULT_BACKEND: str
    # POSTGRES_DB_ASYNC_URI: str
    POSTGRES_DB_URI: str

    class Config:
        env_file = ".env"
        env_file_encoding = "utf-8"
        extra = "ignore"

settings = Settings()