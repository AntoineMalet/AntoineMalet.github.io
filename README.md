## clone
git clone git@github.com:AntoineMalet/AntoineMalet.github.io.git

**Automated Deployment (CI/CD)**

This site is automatically published to GitHub Pages using a GitHub Actions workflow. Whenever changes are pushed to the `master` branch, Quarto renders the site and pushes the built HTML to the `gh-pages` branch.

**1. The Workflow File**
The automation is handled by `.github/workflows/publish.yml`:

```yaml
name: Publish Quarto Site

on:
  push:
    branches: [master, main]

jobs:
  build-deploy:
    runs-on: ubuntu-latest
    permissions:
      contents: write
    steps:
      - name: Check out repository
        uses: actions/checkout@v4

      - name: Set up Quarto
        uses: quarto-dev/quarto-actions/setup@v2

      - name: Publish to GitHub Pages
        uses: quarto-dev/quarto-actions/publish@v2
        with:
          target: gh-pages
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```


**2. GitHub Repository Settings**
To make this workflow function correctly, the repository must be configured as follows:

* **Actions Permissions:** In `Settings > Actions > General`, ensure **Workflow permissions** is set to **Read and write permissions**.
* **Pages Configuration:** In `Settings > Pages`, under **Build and deployment**, set the source to **Deploy from a branch**.
* **Target Branch:** Select the `gh-pages` branch and the `/(root)` folder, then save. (The `gh-pages` branch is created automatically by the workflow on its first successful run).

**3. Triggering a Build**
Deployment triggers automatically on every push to `master`. To trigger a build manually without changing files, use an empty commit:

```bash
git commit --allow-empty -m "Trigger GitHub Actions CI/CD deployment"
git push origin master
```
