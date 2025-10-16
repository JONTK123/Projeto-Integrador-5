#!/bin/bash

# Living IA Setup Script
echo "🚀 Living IA - Setup Script"
echo "=============================="
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3.12 or higher."
    exit 1
fi

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18 or higher."
    exit 1
fi

echo "✓ Python 3 found: $(python3 --version)"
echo "✓ Node.js found: $(node --version)"
echo ""

# Backend Setup
echo "📦 Setting up Backend..."
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

echo "Activating virtual environment..."
source venv/bin/activate || . venv/Scripts/activate

echo "Installing Python dependencies..."
pip install -r requirements.txt

echo ""
echo "✓ Backend setup complete!"
echo ""

# Frontend Setup
echo "📦 Setting up Frontend..."
cd frontend/well-living

echo "Installing Node.js dependencies..."
npm install

echo ""
echo "✓ Frontend setup complete!"
echo ""

cd ../..

# Check for .env file
if [ ! -f ".env" ]; then
    echo "⚠️  No .env file found. Creating from .env.example..."
    cp .env.example .env
    echo "Please edit .env file with your MongoDB credentials."
fi

echo ""
echo "=============================="
echo "✅ Setup Complete!"
echo ""
echo "To start the application:"
echo ""
echo "Backend:"
echo "  source venv/bin/activate  # Activate virtual environment"
echo "  python -m backend.api.app"
echo ""
echo "Frontend (in another terminal):"
echo "  cd frontend/well-living"
echo "  npm run dev"
echo ""
echo "Don't forget to configure your .env file with MongoDB credentials!"
echo "=============================="
