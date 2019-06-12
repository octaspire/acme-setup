.POSIX:
############################################################################
# Octaspire Acme Setup - Scripts to be used with the Acme editor
# Copyright 2019 www.octaspire.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
############################################################################

check: shellcheck pylint

shellcheck:
	@shellcheck bin/octaspire_acme
	@shellcheck bin/octaspire_project_root

pylint:
	@pylint bin/octaspire_tags_up
	@pylint bin/octaspire_tags_find
	@pylint bin/octaspire_tags_complete
	@pylint bin/octaspire_tags_signature

install:
	@mkdir -p ~/bin
	@ln -s "$(PWD)/bin/octaspire_acme"           "$(HOME)/bin/octaspire_acme"
	@ln -s "$(PWD)/bin/octaspire_project_root"   "$(HOME)/bin/octaspire_project_root"
	@ln -s "$(PWD)/bin/octaspire_tags_up"        "$(HOME)/bin/octaspire_tags_up"
	@ln -s "$(PWD)/bin/octaspire_tags_find"      "$(HOME)/bin/octaspire_tags_find"
	@ln -s "$(PWD)/bin/octaspire_tags_complete"  "$(HOME)/bin/octaspire_tags_complete"
	@ln -s "$(PWD)/bin/octaspire_tags_signature" "$(HOME)/bin/octaspire_tags_signature"

uninstall:
	@rm -f "$(HOME)/bin/octaspire_acme"
	@rm -f "$(HOME)/bin/octaspire_project_root"
	@rm -f "$(HOME)/bin/octaspire_tags_up"
	@rm -f "$(HOME)/bin/octaspire_tags_find"
	@rm -f "$(HOME)/bin/octaspire_tags_complete"
	@rm -f "$(HOME)/bin/octaspire_tags_signature"

proof:
	@markdown_py -x fenced_code -o html5 README.md > README.tmp
	@echo '<!DOCTYPE html>' > README.html
	@cat README.tmp >> README.html
	@rm README.tmp
	@xdg-open README.html
	@rm -f README.html

clean:
	@rm -f README.html

help:
	@echo
	@echo "POSIX Makefile for octaspire's Acme setup."
	@echo "Most important targets are:"
	@echo
	@echo "INSTALL"
	@echo "  make install       - install to ~/bin"
	@echo "  make uninstall     - remove installed files from ~/bin"
	@echo
	@echo "ANALYZE"
	@echo "  make check         - lint both shell and Python code"
	@echo "  make shellcheck    - lint only shell code using shellcheck"
	@echo "  make pylint        - lint only Python code using pylint"
	@echo
	@echo "PROOFREAD"
	@echo "  make proof         - proofread the README.md as HTML"
	@echo
	@echo "CLEANUP"
	@echo "  make clean         - remove generated files"