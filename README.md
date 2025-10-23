# Full-Stack Deployment Template

A production-ready deployment template featuring Next.js frontend, FastAPI backend with Celery workers, Nginx reverse proxy, and automatic SSL certificate management with Certbot.

## 🚀 Features

- **Next.js Frontend**: Modern, server-side rendered React application
- **FastAPI Backend**: High-performance Python web API with async support
- **Celery Workers**: Background task processing
- **Nginx**: Reverse proxy with SSL termination
- **Certbot**: Automatic SSL certificate management
- **Docker Compose**: Containerized deployment with easy scaling

## 📋 Prerequisites

- Docker and Docker Compose
- Domain name pointed to your server (for SSL certificates)

## 🛠️ Project Structure

```
.
├── api-server/           # FastAPI backend server
│   ├── app.py           # Main FastAPI application
│   ├── worker.py        # Celery worker configuration
│   └── requirements.txt # Python dependencies
├── certbot/             # SSL certificate management
├── next/                # Next.js frontend (created with create-next-app)
│   └── Dockerfile      # Production build configuration
├── nginx/               # Nginx reverse proxy configuration
│   ├── nginx.conf      # Standard HTTP configuration
│   └── nginx.ssl.conf  # HTTPS configuration
└── docker-compose.yaml  # Container orchestration
```

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/meudayhegde/deployment-template.git
   cd deployment-template
   ```

2. Configure environment variables:
   - Create `.env` file by copying content from `.env.dev`
   - Set necessary environment variables

3. Start the development environment:
   ```bash
   docker-compose up -d
   ```

4. Access your application:
   - Frontend: `https://your-domain.com`
   - API: `https://your-domain.com/api`

## 🔧 Environment Variables

Create a `.env` file in the root directory using the template below:

```bash
# Database Configuration
POSTGRES_USER=postgres
POSTGRES_PASSWORD=<your-password>
POSTGRES_DB=postgres

# Database Connection URIs
POSTGRES_DB_URI=postgresql+pg8000://postgres:<your-password>@postgres:5432/postgres
POSTGRES_DB_ASYNC_URI=postgresql+asyncpg://postgres:<your-password>@postgres:5432/postgres

# Celery and Redis Configuration
CELERY_BROKER_URL=redis://redis:6379/0
CELERY_RESULT_BACKEND=redis://redis:6379/0
REDIS_DB_URI=redis://redis:6379

# Application Security
APPLICATION_SECRET_KEY=<your-secret-key>

# Domain Configuration
DOMAIN=your-domain.com
EMAIL=your-email@domain.com

# Data Persistence
POSTGRES_DATA_DIR=PostgresData

# Frontend Configuration
NEXT_PUBLIC_API_URL=https://your-domain.com/api/v1
```

## 🛡️ SSL Certificate Setup

The template automatically handles SSL certificate generation and renewal through Certbot. Make sure to:

1. Point your domain to your server's IP address
2. Update the domain name in `.env`

## 📦 Components

### FastAPI Backend
- REST API endpoints
- Celery task queue integration
- SQLAlchemy database integration (optional)
- Redis for caching and task broker

### Next.js Frontend
- Created using `create-next-app`
- Basic Next.js 14 setup
- Dockerfile for production deployment
- TypeScript support

### Nginx Configuration
- Reverse proxy to backend and frontend
- SSL termination
- Static file serving
- Security headers

## 🚀 Deployment

1. Configure your domain's DNS settings
2. Set up environment variables
3. Run with Docker Compose:
   ```bash
   docker-compose -f docker-compose.yaml up -d
   ```

## 📝 Development

### Local Development
```bash
# Start backend services
docker-compose up api-server
```
# Start frontend development server
```bash
cd next
npm install
npm run dev
```

### Building for Production
```bash
docker compose build
docker compose up -d
```

## 🔒 Security Considerations

- SSL/TLS encryption enabled by default
- Secure headers configured in Nginx
- Environment variable separation
- Container isolation

## 📚 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 Support

For support, please open an issue in the GitHub repository.
