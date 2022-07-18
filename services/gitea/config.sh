
#!/bin/bash
export IMAGE="gitea/gitea:latest-rootless"
export SUBDOMAIN="git"
export PORT="7722"
export PORT_DB="7723"
export PORT_EXPOSED="3000"
export PORT_SSH="2222"
export PORT_DRONE="7725"
export SUBDOMAIN_DRONE="drone"
export REDIRECTIONS=""
export CLIENT_ID_FOR_DRONE_APP_IN_GITEA=""
export DRONE_GITEA_CLIENT_ID="90c1c015-35ab-4339-917d-eeb01b08b8de"
export DRONE_GITEA_CLIENT_SECRET="gto_fz3d3lgjxvpodfcxzjzspcqezvxotvtf2o6dw2imzdhvib2kfwha"
export DRONE_RPC_SECRET="6196bef54607869e4ed0cad7250bcd86"
export POST_INSTALL_TEST_CMD="docker exec -it gitea gitea admin user"
