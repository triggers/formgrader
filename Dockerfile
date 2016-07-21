FROM ipython/scipystack

# Install psychopg2
RUN apt-get update
RUN apt-get -y install libpq-dev
RUN pip3.4 install psycopg2

# Install nbgrader
ADD nbgrader-0.3.0.dev-py2.py3-none-any.whl /srv/nbgrader-0.3.0.dev-py2.py3-none-any.whl
RUN pip3.4 install /srv/nbgrader-0.3.0.dev-py2.py3-none-any.whl

# Add nbgrader config
ADD nbgrader_config.py /etc/jupyter/nbgrader_config.py

# Add the entrypoint.sh script
ADD entrypoint.sh /srv/entrypoint.sh
RUN chmod +x /srv/entrypoint.sh

# Add the formgrade.sh script
ADD formgrade.sh /srv/formgrade.sh
RUN chmod +x /srv/formgrade.sh

# Run the formgrader
ENTRYPOINT ["/srv/entrypoint.sh"]
