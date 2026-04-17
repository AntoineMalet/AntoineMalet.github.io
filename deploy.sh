#!/bin/bash

git add .
git commit -m "update"
git push
quarto publish gh-pages
git add .
git commit -m "post-publish update"
git push origin master
