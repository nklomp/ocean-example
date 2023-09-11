#!/bin/bash
INPUTFILE=*.csv

# Temp workaround to not fetch large dataset because of a timeout
INPUTDIR=/dataset/tmp

#INPUTDIR=/data/inputs
INPUT="${INPUTDIR}/*/${INPUTFILE}"
OUTPUTDIR=/data/outputs
SAMPLEFILE=sample.csv
SAMPLESIZE=1000

LOGDIR=/data/logs
LOG=${LOGDIR}/output.log

if [ ! -d ${LOGDIR} ]
then
	echo "Log directory ${LOGDIR} does not exist."
	exit 1
fi


if [ ! -d ${INPUTDIR} ]
then
	echo "Input directory ${INPUTDIR} does not exist." >> ${LOG}
	exit 1
fi

if [ ! -d ${OUTPUTDIR} ]
then
	echo "Output directory ${OUTPUTDIR} does not exist." >> ${LOG}
	exit 1
fi


# The line below counts lines from the input. So if the dataset changes frequently it makes sense to use this method
#LC=$(wc -l ${INPUT})

# We use a fixed line count since we know the amount of lines
#LC=17527
#echo LINE count - ${LC}

echo "Will generate ${SAMPLESIZE} samples from the Synthetic London DataSet" >> ${LOG}

echo "Creating CSV header" >> ${LOG}
head -n 1 ${INPUT} > ${OUTPUTDIR}/${SAMPLEFILE}

echo "Getting ${SAMPLESIZE} random samples and sorting the result..." >> ${LOG}
tail -n +1 ${INPUT} | shuf -n ${SAMPLESIZE} | sort >> ${OUTPUTDIR}/${SAMPLEFILE}

echo "${SAMPLESIZE} samples have been generated" >> ${LOG}

exit 0
