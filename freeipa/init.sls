# -*- coding: utf-8 -*-
# vim: ft=sls

client:
  pkg.installed:
     - name: freeipa-client

{% if not grains.get('freeipa') %}
register:
  cmd.run:
    - name: ipa-client-install -U --hostname={{ grains['fqdn'] }} \
              --server={{ pillar['freeipa']['server'] }} \
              --domain={{ pillar['freeipa']['domain'] }} \
              -p {{ pillar['freeipa']['user'] }} -w {{ pillar['freeipa']['pass'] }} \
              --mkhomedir

freeipa:
  grains.present:
    - value: True
{% endif %}
