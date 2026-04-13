#!/bin/zsh

set -euo pipefail

export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
export GEM_HOME="$HOME/.gem/ruby/2.6.0"
export GEM_PATH="$HOME/.gem/ruby/2.6.0:/Library/Ruby/Gems/2.6.0:/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/gems/2.6.0"

if ! command -v bundle >/dev/null 2>&1; then
  echo "bundler not found in \$HOME/.gem/ruby/2.6.0/bin"
  echo "Install it with: gem install --user-install bundler -v 2.2.19"
  exit 1
fi

# Old Sass on Ruby 2.6 fails on two non-ASCII dashes shipped by jekyll-theme-primer.
for file in \
  "vendor/bundle/ruby/2.6.0/gems/jekyll-theme-primer-0.5.4/_sass/primer-support/lib/variables/typography.scss" \
  "vendor/bundle/ruby/2.6.0/gems/jekyll-theme-primer-0.5.4/_sass/primer-support/lib/mixins/typography.scss"; do
  if [[ -f "$file" ]]; then
    perl -0pi -e 's/h4\x{2014}h6/h4-h6/g' "$file"
  fi
done

exec bundle _2.2.19_ exec jekyll serve
