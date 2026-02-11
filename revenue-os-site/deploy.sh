#!/bin/bash

echo "=========================================="
echo "Revenue OS - GitHub Pages Deployment"
echo "=========================================="
echo ""
echo "This will help you deploy your strategic playbook to GitHub Pages"
echo ""

# Check for Git
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install Git first."
    echo "   Visit: https://git-scm.com/downloads"
    exit 1
fi

echo "✓ Git is installed"
echo ""

read -p "Enter your GitHub username: " username
read -p "Enter repository name (default: revenue-os): " repo
repo=${repo:-revenue-os}

echo ""
echo "=========================================="
echo "Step 1: Initialize Repository"
echo "=========================================="
echo ""

git init
git add .
git commit -m "Initial commit: Revenue OS strategic playbook"

echo ""
echo "✓ Repository initialized and files committed"
echo ""

echo "=========================================="
echo "Step 2: Connect to GitHub"
echo "=========================================="
echo ""
echo "Make sure you've created a repository at:"
echo "https://github.com/$username/$repo"
echo ""

read -p "Have you created the repository? (yes/no): " created

if [ "$created" != "yes" ]; then
    echo ""
    echo "Please create the repository first:"
    echo "1. Go to https://github.com/new"
    echo "2. Repository name: $repo"
    echo "3. Make it Public (required for GitHub Pages)"
    echo "4. Don't initialize with README"
    echo "5. Click 'Create repository'"
    echo ""
    echo "Then run this script again."
    exit 0
fi

git branch -M main
git remote add origin "https://github.com/$username/$repo.git"

echo ""
echo "✓ Connected to GitHub repository"
echo ""

echo "=========================================="
echo "Step 3: Push to GitHub"
echo "=========================================="
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "=========================================="
    echo "✓ Deployment Successful!"
    echo "=========================================="
    echo ""
    echo "Next Steps:"
    echo ""
    echo "1. Enable GitHub Pages:"
    echo "   https://github.com/$username/$repo/settings/pages"
    echo ""
    echo "2. Under 'Source', select:"
    echo "   - Branch: main"
    echo "   - Folder: / (root)"
    echo "   - Click 'Save'"
    echo ""
    echo "3. Your site will be live at:"
    echo "   https://$username.github.io/$repo/"
    echo ""
    echo "   (Wait 1-2 minutes for deployment)"
    echo ""
else
    echo ""
    echo "❌ Push failed. Common issues:"
    echo ""
    echo "1. Authentication: You may need to set up a Personal Access Token"
    echo "   https://docs.github.com/en/authentication"
    echo ""
    echo "2. Repository doesn't exist: Make sure you created it on GitHub"
    echo ""
    echo "3. Already exists: If you see 'already exists', run:"
    echo "   git remote remove origin"
    echo "   Then run this script again"
    echo ""
fi

echo "=========================================="
echo "Need Help?"
echo "=========================================="
echo ""
echo "Detailed instructions in README.md"
echo "Or visit: https://pages.github.com"
echo ""
