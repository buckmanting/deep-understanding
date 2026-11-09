#!/usr/bin/env bash
set -euo pipefail

repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
validator="${CODEX_HOME:-$HOME/.codex}/skills/.system/skill-creator/scripts/quick_validate.py"

if python3 -c 'import yaml' >/dev/null 2>&1; then
  for skill in "$repository_root"/skills/*; do
    python3 "$validator" "$skill"
  done
  exit 0
fi

ruby -ryaml -e '
root = ARGV.fetch(0)
failures = []
Dir.children(root).sort.each do |entry|
  path = File.join(root, entry, "SKILL.md")
  content = File.read(path)
  match = content.match(/\A---\n(.*?)\n---/m)
  unless match
    failures << "#{entry}: invalid frontmatter"
    next
  end
  begin
    frontmatter = YAML.safe_load(match[1])
  rescue Psych::Exception => error
    failures << "#{entry}: invalid YAML: #{error.message}"
    next
  end
  allowed = %w[name description license allowed-tools metadata]
  unexpected = frontmatter.keys - allowed
  failures << "#{entry}: unexpected keys #{unexpected.join(", ")}" unless unexpected.empty?
  name = frontmatter["name"]
  description = frontmatter["description"]
  failures << "#{entry}: invalid name" unless name.is_a?(String) && name.match?(/\A[a-z0-9]+(?:-[a-z0-9]+)*\z/) && name.length <= 64
  failures << "#{entry}: invalid description" unless description.is_a?(String) && description.length <= 1024 && !description.include?("<") && !description.include?(">") && !description.start_with?("[TODO:")
  failures << "#{entry}: contains TODO" if content.match?(/^\s*\[TODO:[^\n]*\]\s*$/)
  puts "#{entry}: valid"
end
abort failures.join("\n") unless failures.empty?
' "$repository_root/skills"
