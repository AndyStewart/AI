#!/usr/bin/env bash

# Symlink every repository skill and its AGENTS.md into the active Codex profile.
# Override CODEX_HOME to target a different profile, for example in tests.
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repository_dir="$(cd "${script_dir}/.." && pwd)"
source_skills_dir="${repository_dir}/skills"
source_agents_file="${repository_dir}/AGENTS.md"
codex_home="${CODEX_HOME:-"${HOME}/.codex"}"
target_skills_dir="${codex_home}/skills"

mkdir -p "${target_skills_dir}"

linked=0
skipped=0

link_item() {
  local source="$1"
  local target="$2"
  local name="$3"

  if [[ -L "${target}" && "$(readlink "${target}")" == "${source}" ]]; then
    printf 'Already linked: %s\n' "${name}"
    ((skipped += 1))
    return
  fi

  if [[ -e "${target}" || -L "${target}" ]]; then
    printf 'Cannot link %s: %s already exists\n' "${name}" "${target}" >&2
    exit 1
  fi

  ln -s "${source}" "${target}"
  printf 'Linked: %s -> %s\n' "${target}" "${source}"
  ((linked += 1))
}

if [[ ! -f "${source_agents_file}" ]]; then
  printf 'Cannot find repository AGENTS.md: %s\n' "${source_agents_file}" >&2
  exit 1
fi

link_item "${source_agents_file}" "${codex_home}/AGENTS.md" "AGENTS.md"

while IFS= read -r skill_file; do
  skill_dir="${skill_file%/SKILL.md}"
  skill_name="$(basename "${skill_dir}")"
  link_item "${skill_dir}" "${target_skills_dir}/${skill_name}" "${skill_name}"
done < <(find "${source_skills_dir}" -mindepth 2 -maxdepth 2 -type f -name SKILL.md -print | LC_ALL=C sort)

printf 'Done: %d linked, %d already linked.\n' "${linked}" "${skipped}"
