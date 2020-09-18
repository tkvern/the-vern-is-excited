#! /bin/bash
your_name="tkvern"
your_email="tkvern@qq.com"
cd the-vern-is-excited/
times=`git log --oneline | wc -l`
echo $times
git rebase -i --root << EOF
  ^[
  :1,$ s/pick /edit /g
  ^[
  :wq
EOF

for ((i=0; i < $times; i++))
do
  git commit --amend --author="${your_name} <${your_email}>" << EOF
    ^[
    :wq
EOF
  git rebase --continue
  clear
  printf "%d/%d  \r" "$i" "$times";
done
echo "Done"