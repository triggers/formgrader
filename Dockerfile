FROM ipython/scipystack

# Install nbgrader
RUN pip3.4 install nbgrader

# Add nbgrader config
ADD nbgrader_config.py /etc/ipython/nbgrader_config.py

# Add the formgrade.sh script
ADD formgrade.sh /srv/formgrade.sh
RUN chmod +x /srv/formgrade.sh

# Switch to the right directory
RUN mkdir /srv/formgrader
WORKDIR /srv/formgrader

# Create a grader to run the formgrader
RUN useradd -u 2000 -M grader
USER grader

# Run the formgrader
ENTRYPOINT ["/srv/formgrade.sh"]
