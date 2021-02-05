FROM httpd:2.4
COPY ./index.html /usr/local/apache2/htdocs/
COPY ./pr_hagar.gif /usr/local/apache2/htdocs/
