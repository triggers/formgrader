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

# Switch to the right directory and run the formgrader
RUN mkdir /srv/formgrader
WORKDIR /srv/formgrader
ENTRYPOINT ["nbgrader", "formgrade"]
