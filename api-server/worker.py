from celery import Celery
from env import settings

worker = Celery(
    'worker',
    broker=settings.CELERY_BROKER_URL,
    backend=settings.CELERY_RESULT_BACKEND
)

# Optional configuration
worker.conf.update(
    result_expires=3600,  # Results expire in 1 hour
    task_serializer='json',
    accept_content=['json'],
    result_serializer='json',
    timezone='UTC',
    enable_utc=True,
)

# Example task
@worker.task
def add(x, y):
    return x + y

if __name__ == '__main__':
    worker.start()