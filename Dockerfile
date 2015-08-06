FROM ipython/scipystack

# Install nbgrader
RUN pip3.4 install nbgrader

# Add nbgrader config
ADD nbgrader_config.py /etc/ipython/nbgrader_config.py

# Switch to the right directory and run the formgrader
RUN mkdir /srv/formgrader
WORKDIR /srv/formgrader
ENTRYPOINT ["nbgrader", "formgrade"]
