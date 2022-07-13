#!/bin/bash

ACCESS_TOKEN_PATH=${2:-'~/gitlab-access-token'}
ACCESS_TOKEN=$(cat $ACCESS_TOKEN_PATH)

GROUP_ID=$1

GITLAB_API_URL="https://gitlab.com/api/v4"


function requests_get {
  local url=$1
  echo "$url" 
  curl  --header "PRIVATE-TOKEN: $ACCESS_TOKEN" $url
}

function get_groups_subgroups {
  local url="${GITLAB_API_URL}/groups/${GROUP_ID}/subgroups"
  requests_get $url
}

function get_groups_projects {
  local url="${GITLAB_API_URL}/groups/${GROUP_ID}/projects"
  requests_get $url
}

function get_projects {
  local url="${GITLAB_API_URL}/projects"
  requests_get $url
}

get_groups_subgroups
get_groups_projects
