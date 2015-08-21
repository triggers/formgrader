FROM ipython/scipystack

# Install psychopg2
RUN apt-get -y install libpq-dev
RUN pip3.4 install psycopg2

# Install nbgrader
RUN pip3.4 install --pre nbgrader

# Add nbgrader config
ADD nbgrader_config.py /etc/ipython/nbgrader_config.py

# Add the entrypoint.sh script
ADD entrypoint.sh /srv/entrypoint.sh
RUN chmod +x /srv/entrypoint.sh

# Add the formgrade.sh script
ADD formgrade.sh /srv/formgrade.sh
RUN chmod +x /srv/formgrade.sh

# Run the formgrader
ENTRYPOINT ["/srv/entrypoint.sh"]
