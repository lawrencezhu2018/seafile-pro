#!/bin/bash
#This is progrm is used to setup seafile.

set -eu

#1.start to generate mysql passowrds, and write the login account and mysql account to a file named profile.
PROFILE=${WORK_DIR}/profile

if [[ -e ${PROFILE} ]]; then
   rm ${PROFILE}
fi

#admin
echo -e "[admin]\nadmin=${ADMIN}\npassword=${ADMIN_PW}\n" >>${PROFILE}

#mysql
export ROOT_PW=`pwgen 14 1`
export SEAFILE_PW=`pwgen 14 1`
echo -e "[mysql]\nuser=root\npassword=${ROOT_PW}\n" >>${PROFILE}
echo -e "user=seafile\npassword=${SEAFILE_PW}\n"    >>${PROFILE}

#2.start to execute expect script
${WORK_DIR}/bin/expect.exp
echo "setup is done .."

rm $0
