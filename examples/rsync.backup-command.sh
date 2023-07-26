#!/usr/bin/env bash

rsync /data/ nas.lan:/data/ \
	--archive --copy-links --protect-args --delete \
	--acls --xattrs --fake-super \
	--partial --append-verify \
	--compress --sparse --no-motd \
	--human-readable --no-inc-recursive --info="progress2" -vv \
	--exclude ".terraform*" --exclude "obsidian" \
	--backup --backup-dir "changes_$(date +'%F_%H-%m-%S')" --exclude "changes_*" \
| grep -Ev -e uptodate -e "/$"


# cat '.rsync-filter'
# - .DS_Store
# - .localized
# - .obsidian
# - .terraform*
# + **
/opt/homebrew/bin/rsync 'Data' 'nas.lan:Data' \
	-abchszAFLSUX \
	--partial --append-verify --fake-super --no-motd \
	--delete --backup-dir "changes_$(date +'%F_%H-%m-%S')" \
	--no-inc-recursive --info="progress2"

# .rsync-filter hides files on source, but does nothing for the ones on the remote
/opt/homebrew/bin/rsync 'Data' 'synology.lan:Data' \
	-abchszAFLSX \
	--partial --append-verify --fake-super --no-motd \
	--delete --backup-dir "changes_$(date +'%F_%H-%m-%S')" \
	--no-inc-recursive --info="progress2" \
	--exclude={'@eaDir','#recycle','changes_*'}
