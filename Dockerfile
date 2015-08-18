FROM ipython/scipystack

# Install nbgrader
RUN git clone https://github.com/jupyter/nbgrader /srv/nbgrader
WORKDIR /srv/nbgrader
RUN pip3.4 install flit
RUN FLIT_ROOT_INSTALL=1 flit install --env
RUN flit wheel
RUN pip3.4 install dist/nbgrader*

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
