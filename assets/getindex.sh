#!/bin/bash

idx_html=index.html

cd /d/blog/source/assets/ || exit
for f in */**/*\ *; do mv "$f" "${f// /-}" 2>/dev/null; done

cd /d/blog/source/assets/html || exit
cat /dev/null > $idx_html
echo '<!DOCTYPE html><html lang="zh-CN"><head><meta charset="UTF-8"><title>HTML</title></head><body><h1>Oracle HTML</h1><ul>' > $idx_html
for i in *.html; do
  [[ -e "$i" ]] || break
  if [ "$i" != 'index.html' ]; then
    echo '<li><a href="'$i'">'$i'</a></li>' >> $idx_html
  fi
done
echo '</ul></body></html>' >> $idx_html
echo 'HTML索引文件生成完毕'

cd /d/blog/source/assets/pdf || exit
cat /dev/null > $idx_html
echo '<!DOCTYPE html><html lang="zh-CN"><head><meta charset="UTF-8"><title>PDF</title></head><body><h1>Linux Documents</h1><ul>' > $idx_html
for i in linux/*.pdf; do
  [[ -e "$i" ]] || break
  if [ "$i" != 'index.html' ]; then
    i2=$(basename $i)
    echo '<li><a href="'$i'">'$i2'</a></li>' >> $idx_html
  fi
done
echo '</ul>' >> $idx_html
echo "" >> $idx_html
echo '<h1>Oracle MOS Documents</h1><ul>' >> $idx_html
for i in oracle/*.pdf; do
  [[ -e "$i" ]] || break
  if [ "$i" != 'index.html' ]; then
    i2=$(basename $i)
    echo '<li><a href="'$i'">'$i2'</a></li>' >> $idx_html
  fi
done
echo '</ul></body></html>' >> $idx_html
echo 'PDF索引文件生成完毕'

cd /d/blog/source/assets/script || exit
cat /dev/null > $idx_html
echo '<!DOCTYPE html><html lang="zh-CN"><head><meta charset="UTF-8"><title>Script</title></head><body><h1>Script</h1><ul>' > $idx_html
for i in *.sh; do
  [[ -e "$i" ]] || break
  if [ "$i" != 'index.html' ]; then
    echo '<li><a href="'$i'">'$i'</a></li>' >> $idx_html
  fi
done
echo '</ul></body></html>' >> $idx_html
echo 'Script索引文件生成完毕'
