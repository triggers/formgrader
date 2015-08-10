c = get_config()

c.NbGraderConfig.course_id = 'cogsci131'

c.FormgradeApp.ip = "0.0.0.0"
c.FormgradeApp.port = 9000
c.FormgradeApp.authenticator_class = "nbgrader.auth.hubauth.HubAuth"

import os
c.HubAuth.notebook_url_prefix = os.environ['NOTEBOOK_URL_PREFIX']
c.HubAuth.hub_base_url = os.environ['HUB_BASE_URL']
c.HubAuth.hubapi_address = "jupyterhub"
c.HubAuth.proxy_address = "jupyterhub"
c.HubAuth.hub_address = "jupyterhub"
c.HubAuth.connect_ip = os.environ['FORMGRADER_IP']

# Add users to the grader list
graders = set([])
with open('/srv/formgrader/graderlist') as f:
    for line in f:
        if line.isspace():
            continue
        graders.add(line.strip())
c.HubAuth.graders = list(graders)
