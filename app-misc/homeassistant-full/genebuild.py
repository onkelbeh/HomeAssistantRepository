#!/usr/bin/env python3

from __future__ import annotations

import argparse
import os
import json
import re
import requests
import shutil
import subprocess
import sys
import yaml

from packaging.requirements import Requirement, InvalidRequirement
from packaging.specifiers import SpecifierSet
from packaging.utils import canonicalize_name, canonicalize_version

def fetch_json(url):
    """Fetches JSON data from the given URL."""
    response = requests.get(url)
    response.raise_for_status()  # raise an error for bad status codes
    return response.json()

def by_version(specifier):
    return specifier.version

def get_package(name, operator, version, extras = None, strict = 1):
    operator_mapping = {
        '==0':                        '>=',
        '==1':                        '~',
        '==-1':                       '!<',
        '!=-1':                       '!<=',
        '>=-1':                       '!<',
    }
    # 1000000000.0.0 is used as "any version"
    if version != '1000000000.0.0':
        version_string = operator_mapping.get(operator + str(strict), operator)
    elif strict == -1:
        version_string = '!'
    else:
        version_string = ''

    name_mapping = {
        'apple_weatherkit':           'dev-python/apple_weatherkit',
        'atomicwrites-homeassistant': 'dev-python/atomicwrites',
        'foobot_async':               'dev-python/foobot_async',
        'geopy':                      'sci-geosciences/geopy',
        'haproxy':                    'net-proxy/haproxy',
        'home-assistant-cli':         'app-misc/home-assistant-cli',
        'Jinja2':                     'dev-python/jinja2',
        'pyOpenSSL':                  'dev-python/pyopenssl',
        'PyJWT':                      'dev-python/pyjwt',
        'python-gitlab':              'dev-vcs/python-gitlab',
        'Pillow':                     'dev-python/pillow',
        'pushover_complete':          'dev-python/pushover_complete',
        'PyChromecast':               'dev-python/pychromecast',
        'PyNaCl':                     'dev-python/pynacl',
        'PyQRCode':                   'dev-python/pyqrcode',
        'PyYAML':                     'dev-python/pyyaml',
        'sharp_aquos_rc':             'dev-python/sharp_aquos_rc',
        'shodan':                     'net-analyzer/shodan',
        'socat':                      'net-misc/socat',
        'solarlog_cli':               'dev-python/solarlog_cli',
        'speedtest-cli':              'net-analyzer/speedtest-cli',
        'SQLAlchemy':                 'dev-python/sqlalchemy',
        'mutagen':                    'media-libs/mutagen',
        'yt-dlp':                     'net-misc/yt-dlp',
    }
    newname = name
    newname = newname.replace('.', '-')
    newname = newname.replace('_', '-')
    version_string += name_mapping.get(name, 'dev-python/' + newname)

    # 1000000000.0.0 is used as "any version"
    if version != '1000000000.0.0':
        version = canonicalize_version(version, strip_trailing_zero=False)
        # see pypi.eclass
        version = version.replace('a', '_alpha')
        version = version.replace('b', '_beta')
        version = version.replace('rc', '_rc')
        version = version.replace('.dev', '_pre')
        version = version.replace('.post', '_p')
        version_string += '-' + version

    if extras is None:
        extras = []
    else:
        extras = list(extras)
        # fritzconnection has a gentoo USE flag qrcode
        if name == 'fritzconnection':
            extras = [e.replace('qr', 'qrcode') for e in extras]

    if strict != -1 and name not in ['haproxy', 'uv']:
        extras.append('${PYTHON_USEDEP}')

    if len(extras) > 0:
        version_string += '[' + ','.join(sorted(extras)) + ']'

    return version_string

def write_header(ebuild_path, minimal = False):
    # determine python version
    if minimal:
        # use current Python version
        PYTHON_COMPAT = 'python' + str(sys.version_info.major) + '_' + str(sys.version_info.minor)
    else:
        # use Python versions as mentioned in .github/workflow/ci.yaml
        with open(portage_coredir + '/.github/workflows/ci.yaml', 'r') as stream:
            y = yaml.safe_load(stream)
            PYTHON_ALL_VERSIONS = eval(y['env']['ALL_PYTHON_VERSIONS'])
            del y
        # and limit them to homeassistant/const.py [REQUIRED_NEXT_PYTHON_VER]
        with open(portage_coredir + '/homeassistant/const.py', 'r') as const:
            for line in const:
                if line.startswith('REQUIRED_PYTHON_VER:'):
                    y = re.search('\\((.*), [0-9]+\\)', line)
                    PYTHON_MIN_VERSION = y.group(1).replace(', ', '.')

        for v in PYTHON_ALL_VERSIONS:
            if v < PYTHON_MIN_VERSION:
                PYTHON_ALL_VERSIONS.remove(v)
        if len(PYTHON_ALL_VERSIONS) == 1:
            PYTHON_COMPAT = 'python' + str(PYTHON_ALL_VERSIONS[0]).replace('.', '_')
        elif len(PYTHON_ALL_VERSIONS) == 2:
            if PYTHON_ALL_VERSIONS[0][0] == PYTHON_ALL_VERSIONS[1][0]:
                PYTHON_COMPAT = 'python' + PYTHON_ALL_VERSIONS[0][0] + '_{' + PYTHON_ALL_VERSIONS[0][2:] + '..' + PYTHON_ALL_VERSIONS[1][2:] + '}' 
            else:
                PYTHON_COMPAT = 'python' + str(PYTHON_ALL_VERSIONS[0]).replace('.', '_') + ' ' + 'python' + str(PYTHON_ALL_VERSIONS[1]).replace('.', '_')

    with open(ebuild_path, 'w') as ebuild_file:
        # write header
        lines = [
            '# Distributed under the terms of the GNU General Public License v2\n',
            '\n',
            'EAPI=8\n',
            '\n',
            'DISTUTILS_USE_PEP517=setuptools\n',
            'PYTHON_COMPAT=( ' + PYTHON_COMPAT + ' )\n',
            'PYTHON_REQ_USE="sqlite?"\n',
            'PYPI_NO_NORMALIZE=1\n',
            'PYPI_PN="homeassistant"\n',
            'inherit distutils-r1 pypi readme.gentoo-r1 systemd\n',
            '\n',
            'MY_PN=homeassistant\n',
            '\n',
            'if [[ ${PV} == *9999* ]]; then\n',
            '	inherit git-r3\n',
            '	EGIT_REPO_URI="https://github.com/home-assistant/core.git"\n',
            '	EGIT_BRANCH="dev"\n',
            '	S="${WORKDIR}/homeassistant-full-9999/"\n',
            'else\n',
            '	MY_PV=${PV/_beta/b}\n',
            '	MY_P=${MY_PN}-${MY_PV}\n',
            '	SRC_URI="$(pypi_sdist_url)\n',
            '	https://github.com/home-assistant/core/archive/${MY_PV}.tar.gz -> ${MY_P}.gh.tar.gz"\n',
            'fi\n',
            '\n',
            'DESCRIPTION="Open-source home automation platform running on Python."\n',
            'HOMEPAGE="https://home-assistant.io/ https://git.edevau.net/onkelbeh/HomeAssistantRepository/"\n',
            '\n',
            'LICENSE="Apache-2.0"\n',
            'SLOT="0"\n',
            'KEYWORDS="amd64 arm arm64 x86"\n',
        ]
        ebuild_file.writelines(lines)
        
        if minimal:
            ebuild_file.write('IUSE="+sqlite"\n')
            ebuild_file.write('RESTRICT="!test? ( test )"\n')
            ebuild_file.write('distutils_enable_tests pytest\n')

# parse arguments
# accepted parameter: version
argp = argparse.ArgumentParser(description='Generate ebuild')
argp.add_argument('version', nargs='?')
args = argp.parse_args()

# check the version
if args.version is None:
    url = 'https://api.github.com/repos/home-assistant/core/releases/latest'
else:
    url = 'https://api.github.com/repos/home-assistant/core/releases/tags/' + args.version.replace('_beta', 'b')

json_data = fetch_json(url)
remote_version = json_data['tag_name']

ebuild_dir = os.path.dirname(os.path.realpath(__file__))
ebuild = os.path.basename(ebuild_dir) + '-' + remote_version.replace('b', '_beta')
ebuild_path = ebuild_dir + '/' + ebuild + '.ebuild'

# generate a new revision if we are re-generating an ebuild
rev = 0
while os.path.isfile(ebuild_path := ebuild_dir + '/' + ebuild + ('-r' + str(rev) if rev > 0 else '') + '.ebuild'):
    rev += 1

# write empty ebuild so we can unpack
write_header(ebuild_path, True)

# generate the new ebuild manifest
subprocess.run(['ebuild', ebuild_path, 'clean', 'digest', 'unpack'])

# core integrations (cf. bootstrap.py)
core_integrations = ['homeassistant', 'persistent_notification', 'analytics', 'application_credentials', 'automation', 'backup', 'counter', 'frontend', 'hardware', 'input_boolean', 'input_button', 'input_datetime', 'input_number', 'input_select', 'input_text', 'logger', 'network', 'person', 'scene', 'schedule', 'script', 'system_health', 'tag', 'timer', 'zone']

# requirements (key: requirement name) => req, use
requirements = {}
# definition of directories
PORTAGE_TMPDIR = '/var/tmp'
portage_coredir = PORTAGE_TMPDIR + '/portage/app-misc/' + ebuild + ('-r' + str(rev) if rev > 0 else '') + '/work/core-' + remote_version.replace('b', '_beta')
portage_hassdir = PORTAGE_TMPDIR + '/portage/app-misc/' + ebuild + ('-r' + str(rev) if rev > 0 else '') + '/work/homeassistant-' + remote_version.replace('b', '_beta')

# iterate core requirements
with open(portage_coredir + '/requirements.txt', 'r') as reqs:
    for req in reqs:
        try:
            sr = Requirement(req)
            # cf script/gen_requirements_all.py: do not hard pin these requirements
            if sr.name in ['urllib3']:
                newspec = []
                for s in sr.specifier:
                    if s.operator not in ['<']:
                        newspec.append(str(s))
                sr.specifier = SpecifierSet(','.join(newspec))

            requirements[sr.name] = {'req': sr, 'use': ['core']}
        except InvalidRequirement:
            pass

with open(portage_coredir + '/requirements_test_pre_commit.txt', 'r') as reqs:
    for req in reqs:
        try:
            sr = Requirement(req)
            requirements[sr.name] = {'req': sr, 'use': ['test']}
        except InvalidRequirement:
            pass

with open(portage_coredir + '/requirements_test.txt', 'r') as reqs:
    for req in reqs:
        try:
            sr = Requirement(req)
            requirements[sr.name] = {'req': sr, 'use': ['test']}
        except InvalidRequirement:
            pass

# iterate integration requirements
integrations = {}
for integration in os.listdir(portage_hassdir + '/homeassistant/components'):
    if os.path.isfile(portage_hassdir + '/homeassistant/components/' + integration + '/manifest.json'):
        with open(portage_hassdir + '/homeassistant/components/' + integration + '/manifest.json', 'r') as file:
            manifest = json.load(file)
            if integration not in integrations:
                integrations[integration] = {'core': (integration in core_integrations)}
            if 'name' in manifest:
                integrations[integration]['name'] = manifest['name']
            integrations[integration]['disabled'] = ('disabled' in manifest)
            if 'dependencies' in manifest:
                integrations[integration]['deps'] = manifest['dependencies']
                # dependencies of core dependencies ... become core as well
                if integrations[integration]['core']:
                    for dep in integrations[integration]['deps']:
                        if dep in integrations:
                            integrations[dep]['core'] = True
                        else:
                            integrations[dep] = {'core': True}
            if 'requirements' in manifest and len(manifest['requirements']) > 0:
                integrations[integration]['reqs'] = []
                for req in manifest['requirements']:
                    try:
                        sr = Requirement(req)
                        integrations[integration]['reqs'].append(sr)
                        if sr.name in requirements:
                            requirements[sr.name]['req'].specifier &= sr.specifier
                            requirements[sr.name]['use'].append(integration)
                        else:
                            requirements[sr.name] = {'req': sr, 'use': [integration]}
                    except InvalidRequirement:
                        pass

with open(portage_hassdir + '/homeassistant/package_constraints.txt', 'r') as reqs:
    for req in reqs:
        try:
            sr = Requirement(req)
            if sr.name in requirements:
                # check and possibly rewrite to match with the ebuild
                requirements[sr.name]['use'].append('REWRITE')
                requirements[sr.name]['package_constraint'] = req.rstrip()
            else:
                # generate a blocker for the lower or equal version
                requirements[sr.name] = {'req': sr, 'use': ['BLOCKER']}
        except InvalidRequirement:
            pass

# add manual requirements, 1000000000.0.0 means "no version" in this context
# databases
integrations['mysql'] = {'core': False, 'reqs': [Requirement('mysqlclient>=1.4.0')]}
integrations['postgres'] = {'core': False, 'reqs': [Requirement('psycopg>3.1.15')]}
integrations['sqlite'] = {'core': False, 'reqs': []}
integrations['default_config']['deps'].append('sqlite')
# extra features
integrations['cli'] = {'core': False, 'reqs': [Requirement('home-assistant-cli==1000000000.0.0')]}
integrations['socat'] = {'core': False, 'reqs': [Requirement('socat==1000000000.0.0')]}
integrations['ssl'] = {'core': False, 'reqs': [Requirement('haproxy[ssl]==1000000000.0.0')]}
integrations['systemd'] = {'core': False, 'reqs': []}

### write ebuild
rewrites = {}
write_header(ebuild_path)
with open(ebuild_path, 'a') as ebuild_file:
    # header written above
    
    # write IUSE
    iuse = []
    for integration in sorted(integrations.keys()):
        # core deps should not have use flags
        # only generate use flags for integrations that have external dependencies
        if not integrations[integration]['core'] and 'reqs' in integrations[integration]:
            # soft add the default_integration use flags
            iuse.append(('+' if integration in integrations['default_config']['deps'] else '') + integration)
    ebuild_file.write('IUSE="' + ' '.join(iuse) + '"\n')

    # write RESTRICT
    lines = [
        'RESTRICT="!test? ( test )"\n',
        '\n',
        '# external deps\n',
        'RDEPEND="${PYTHON_DEPS}\n',
        '	acct-group/${MY_PN} acct-user/${MY_PN}\n',
        '	app-admin/logrotate"\n',
        '# make sure no conflicting main ebuild is installed\n',
        'RDEPEND="${RDEPEND}\n',
        '	!app-misc/homeassistant-min\n',
        '	!app-misc/homeassistant"\n',
        '\n'
    ]
    ebuild_file.writelines(lines)

    # generate core RDEPEND
    ebuild_file.write('# core requirements (cf requirements.txt)\nRDEPEND="${RDEPEND}')
    for req in sorted(requirements.keys(), key=str.casefold):
        core_req = 'core' in requirements[req]['use']
        # if requirements are used by integrations, the version needs to match strict,
        # else, the version can match loosely
        strict = int(not (set(requirements[req]['use']) == (set(requirements[req]['use']) & set(['core', 'test', 'REWRITE']))))
        # rewrite non-strict requirements
        if 'REWRITE' in requirements[req]['use'] and not strict:
            old = requirements[req]['package_constraint']
            new = old.replace('==', '>=')
            if old != new:
                rewrites[old] = new
        for use in requirements[req]['use']:
            try:
                core_req |= integrations[use]['core']
            except KeyError:
                pass
        if core_req:
            sr = requirements[req]['req']
            rdep = []
            for item in sorted(sr.specifier, key=by_version):
                rdep.append(get_package(sr.name, item.operator, item.version, sr.extras, strict))
            ebuild_file.write('\n	' + ' '.join(rdep))
    ebuild_file.write('"\n\n')

    # generate blockers
    ebuild_file.write('# blockers (cf package_constraints.txt, but (usually) inversed)\nRDEPEND="${RDEPEND}')
    for req in sorted(requirements.keys(), key=str.casefold):
        if 'BLOCKER' in requirements[req]['use']:
            sr = requirements[req]['req']
            rdep = []
            for item in sorted(sr.specifier, key=by_version):
                rdep.append(get_package(sr.name, item.operator, item.version, sr.extras, -1))
            ebuild_file.write('\n	' + ' '.join(rdep))
    ebuild_file.write('"\n\n')
    
    # generate REQUIRED_USE
    ebuild_file.write('# use dependencies (cf manifest.json dependencies)\nREQUIRED_USE="')
    # require at lease one database engine
    ebuild_file.write('\n	|| ( sqlite postgres mysql )')
    for integration in sorted(integrations.keys()):
        if not integrations[integration]['core'] and 'reqs' in integrations[integration] and 'deps' in integrations[integration]:
            rdep = []
            for req in sorted(integrations[integration]['deps']):
                if not integrations[req]['core'] and 'reqs' in integrations[req]:
                    rdep.append(req)
            if len(rdep) > 0:
                ebuild_file.write('\n	' + integration + '? ( ' + ' '.join(rdep) + ' )')
    ebuild_file.write('"\n\n')
    
    # generate integrations RDEPEND
    ebuild_file.write('# module requirements from useflags\nRDEPEND="${RDEPEND}')
    for integration in sorted(integrations.keys()):
        if not integrations[integration]['core'] and 'reqs' in integrations[integration] and len(integrations[integration]['reqs']) > 0:
            rdep = []
            for req in sorted(integrations[integration]['reqs'], key=lambda req: req.name):
                for item in sorted(req.specifier, key=by_version):
                    rdep.append(get_package(req.name, item.operator, item.version, req.extras, 1))
            ebuild_file.write('\n	' + integration + '? ( ' + ' '.join(rdep) + ' )')
    ebuild_file.write('"\n\n')

    # generate BDEPEND (see pyproject.toml)
    lines = [
        'BDEPEND="${RDEPEND}\n',
        '	>=dev-python/setuptools-69.2.0[${PYTHON_USEDEP}]\n',
        '	>=dev-python/wheel-0.43.0[${PYTHON_USEDEP}]\n',
        '	test? (\n',
    ]
    ebuild_file.writelines(lines)
    for req in sorted(requirements.keys(), key=str.casefold):
        test_req = 'test' in requirements[req]['use']
        if test_req:
            sr = requirements[req]['req']
            rdep = []
            for item in sorted(sr.specifier, key=by_version):
                rdep.append(get_package(sr.name, item.operator, item.version, sr.extras, 0))
            ebuild_file.write('		' + ' '.join(rdep) + '\n')
    ebuild_file.write('	)"\n\n')

    lines = [
        'src_prepare() {\n',
        '	if use test ; then\n',
        '		cp --no-preserve=mode --recursive ${WORKDIR}/core-${MY_PV}/tests ${S}\n',
        '		chmod u+x ${S}/tests/auth/providers/test_command_line_cmd.sh\n',
        '	fi\n',
    ]
    ebuild_file.writelines(lines)

    # perform rewrites of homeassistant/package_constraints.txt
    for old, new in rewrites.items():
        ebuild_file.write('	sed -e "s|' + old + '|' + new + '|" -i homeassistant/package_constraints.txt || die\n')

    lines = [
        '\n',
        '	distutils-r1_src_prepare\n',
        '}\n',
        '\n',
        'INSTALL_DIR="/opt/${MY_PN}"\n',
        '\n',
        'DISABLE_AUTOFORMATTING=1\n',
        'DOC_CONTENTS="\n',
        'The HA interface listens on port 8123\n',
        'hass configuration is in: /etc/${MY_PN}\n',
        'daemon command line arguments are configured in: /etc/conf.d/${MY_PN}\n',
        'logging is to: /var/log/${MY_PN}/{server,errors,stdout}.log\n',
        'The sqlite db is by default in: /etc/${MY_PN}\n',
        'support at https://git.edevau.net/onkelbeh/HomeAssistantRepository\n',
        '"\n',
        '\n',
        'DOCS="README.rst"\n',
        '\n',
        'python_install_all() {\n',
        '	dodoc ${DOCS}\n',
        '	distutils-r1_python_install_all\n',
        '	keepdir "$INSTALL_DIR"\n',
        '	keepdir "/etc/${MY_PN}"\n',
        '	fowners -R "${MY_PN}:${MY_PN}" "/etc/${MY_PN}"\n',
        '	keepdir "/var/log/${MY_PN}"\n',
        '	fowners -R "${MY_PN}:${MY_PN}" "/var/log/${MY_PN}"\n',
        '	newconfd "${FILESDIR}/${MY_PN}.conf.d" "${MY_PN}"\n',
        '	newinitd "${FILESDIR}/${MY_PN}.init.d" "${MY_PN}"\n',
        '	use systemd && systemd_dounit "${FILESDIR}/${MY_PN}.service"\n',
        '	dobin "${FILESDIR}/hasstest"\n',
        '	if use socat ; then\n',
        '		newinitd "${FILESDIR}/socat-zwave.init.d" "socat-zwave"\n',
        '		sed -i -e \'s/# need socat-zwave/need socat-zwave/g\' "${D}/etc/init.d/${MY_PN}" || die\n',
        '	fi\n',
        '	if use mqtt ; then\n',
        '		sed -i -e \'s/# need mosquitto/need mosquitto/g\' "${D}/etc/init.d/${MY_PN}" || die\n',
        '	fi\n',
        '	insinto /etc/logrotate.d\n',
        '	newins "${FILESDIR}/${MY_PN}.logrotate" "${MY_PN}"\n',
        '	readme.gentoo_create_doc\n',
        '}\n',
        '\n',
        'pkg_postinst() {\n',
        '	readme.gentoo_print_elog\n',
        '}\n',
        '\n',
        'distutils_enable_tests pytest\n',
    ]
    ebuild_file.writelines(lines)

# clean up
subprocess.run(['ebuild', ebuild_path, 'clean', 'digest'])
