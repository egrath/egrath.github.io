#!/bin/bash
MARKDOWN=~/tmp/copy/discount-3.0.1.2/markdown
MARKUP_DIR=$(dirname $0)
BASE_DIR=${MARKUP_DIR}/..

function build_html()
{
	SOURCE=${1}
	DEST=${SOURCE/md/html}

	echo -n "building ${DEST} from ${SOURCE} ... "

	# create the destination directory if necessary
	if [ ! -d $(dirname ${BASE_DIR}/${DEST}) ]; then
		mkdir -p $(dirname ${BASE_DIR}/${DEST})
	fi
	
	# convert markup to html
	cat ${MARKUP_DIR}/header.txt | sed s/DOCUMENTTITLE/$(basename ${SOURCE})/g > ${BASE_DIR}/${DEST}
	${MARKDOWN} -G ${MARKUP_DIR}/${SOURCE} >> ${BASE_DIR}/${DEST}
	cat ${MARKUP_DIR}/footer.txt >> ${BASE_DIR}/${DEST}

	echo "done"
}

# rebuild all files from the markup source
declare -a FILES=("index.md")
for i in ${FILES[@]}
do
	build_html ${i}
done

