. /tmp/lab/lib.sh
step "After the reboot"
run 'sudo lvs'
step "5. Delete a logical volume"
run 'sudo lvremove -y vgdata/lvlogs'
run 'sudo lvs'
run 'sudo vgs'
