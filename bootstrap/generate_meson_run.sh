#!/bin/bash

# Freeciv - Copyright (C) 2022 The Freeciv Team
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.

DATADIR="$(cd $(dirname "$0")/../data ; pwd)"
SCENDIR="$(cd $(dirname "$0")/../data/scenarios ; pwd)"

echo "#!/bin/bash"                                                                > "$1"
echo "# Generated by $(basename "$0")"                                           >> "$1"
echo                                                                             >> "$1"
echo "if test \"\$1\" = \"--help\" || test \"\$1\" = \"-h\" ||"                  >> "$1"
echo "   test \"\$1\" = \"\" ; then"                                             >> "$1"
echo "  echo \"Usage: ./run.sh <executable> [parameters] ...\""                  >> "$1"
echo "  exit"                                                                    >> "$1"
echo "fi"                                                                        >> "$1"
echo                                                                             >> "$1"
echo "if test \"\${FREECIV_DATA_PATH}\" = \"\" ; then"                           >> "$1"
echo "  FREECIV_DATA_PATH=\"${2}/${3}:${DATADIR}\""                              >> "$1"
echo "else"                                                                      >> "$1"
echo "  FREECIV_DATA_PATH=\"\${FREECIV_DATA_PATH}:${2}/${3}:${DATADIR}\""        >> "$1"
echo "fi"                                                                        >> "$1"
echo "export FREECIV_DATA_PATH"                                                  >> "$1"
echo "if test \"\$FREECIV_SCENARIO_PATH\" = \"\" ; then"                         >> "$1"
echo "  FREECIV_SCENARIO_PATH=\"${2}/${3}/scenarios:${2}/scenarios:${SCENDIR}\"" >> "$1"
echo "else"                                                                      >> "$1"
echo "  FREECIV_SCENARIO_PATH=\"\${FREECIV_SCENARIO_PATH}:${2}/${3}/scenarios:${2}/scenarios:${SCENDIR}\"" >> "$1"
echo "fi"                                                                        >> "$1"
echo "export FREECIV_SCENARIO_PATH"                                              >> "$1"
echo                                                                             >> "$1"
echo "./\$@"                                                                     >> "$1"

chmod +x "$1"
