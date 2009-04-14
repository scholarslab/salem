echo Generating add_doc for BoySal1R.xml;
java -jar saxon/saxon9.jar -xi:on -s ../cocoon/xml/BoySal1R.xml -xsl:add_docs.xsl > index/add_BoySal1R.xml;
echo Generating add_doc for BoySal2R.xml;
java -jar saxon/saxon9.jar -xi:on -s ../cocoon/xml/BoySal2R.xml -xsl:add_docs.xsl > index/add_BoySal2R.xml;
echo Generating add_doc for BoySal3R.xml;
java -jar saxon/saxon9.jar -xi:on -s ../cocoon/xml/BoySal3R.xml -xsl:add_docs.xsl > index/add_BoySal3R.xml;

FILE="index/add_*.xml"
URL=http://localhost:8080/solr/salem/update

for f in $FILE; do
  echo Posting file $f to $URL
  curl $URL --data-binary @$f -H 'Content-type:text/xml; charset=utf-8' 
  echo
done

#send the commit command to make sure all the changes are flushed and visible
curl $URL --data-binary '<commit/>' -H 'Content-type:text/xml; charset=utf-8'
echo
