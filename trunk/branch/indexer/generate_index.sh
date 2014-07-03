#! /usr/bin/env bash

SERVER=`uname -n`
FILE="index/add_*.xml"
URL=http://$SERVER:8080/solr/salem/update

echo Indexing for Solr server $URL


#echo Generating add_doc for BoySal1R.xml;
#java -jar saxon/saxon9.jar -xi:on -s ../cocoon/xml/BoySal1R.xml -xsl:add_docs.xsl > index/add_BoySal1R.xml;
#echo Generating add_doc for BoySal2R.xml;
#java -jar saxon/saxon9.jar -xi:on -s ../cocoon/xml/BoySal2R.xml -xsl:add_docs.xsl > index/add_BoySal2R.xml;
#echo Generating add_doc for BoySal3R.xml;
#java -jar saxon/saxon9.jar -xi:on -s ../cocoon/xml/BoySal3R.xml -xsl:add_docs.xsl > index/add_BoySal3R.xml;
#java -jar saxon/saxon9.jar -xi:on -s ../cocoon/xml/BoySalCombined.xml -xsl:add_docs.xsl > index/add_BoySal.xml;

echo Generating add_doc for swp.xml
java -jar saxon/saxon9.jar -xi:on -s ../cocoon/xml/swp.xml -xsl:add_docs.xsl > index/add_swp.xml;

# EAD files
for i in `ls ../cocoon/xml/ead/*.xml`; do java -jar saxon/saxon9.jar -xi:on -s $i -xsl:add_ead_docs.xsl > index/add_`basename $i`; echo Generating add_doc for `basename $i`; done

for f in $FILE; do
  echo Posting file $f to $URL
  curl $URL --data-binary @$f -H 'Content-type:text/xml; charset=utf-8'
  echo
done

#send the commit command to make sure all the changes are flushed and visible
echo "Committing changes to the Solr index"
curl $URL --data-binary '<commit/>' -H 'Content-type:text/xml; charset=utf-8'
echo "Optimizing the Solr index"
curl $URL --data-binary '<optimize/>' -H 'Content-type:text/xml; charset=utf-8'

echo Switching to the updated search index

if [ -z $RAILS_ENV ]; then
  RAILS_ENV=''
fi

if [ $RAILS_ENV == $PRODUCTION ]; then
  curl http://sdsv3.itc.virginia.edu:8080/solr/admin/cores -F command=RELOAD -F core=faulkner
  curl http://sdsv2.itc.virginia.edu:8080/solr/admin/cores -F command=RELOAD -F core=faulkner
else
  curl http://localhost:8080/solr/admin/cores -F command=RELOAD -F core=faulkner
fi

echo Finished
