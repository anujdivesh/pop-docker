#!/bin/bash
echo "--------------------------------"
echo "Pacific Ocean Portal - Installer"
echo "--------------------------------"

#SETUP BASE DIRECTORIES - CHANGE
baseURL="/home"
username="pop"
rootPath="${baseURL}/${username}/ocean_portal"

#DATASETS - DO NOT CHANGE
dataRoot="${rootPath}/datasets"
dataModelRegionalDir="${rootPath}/datasets/model/regional"
dataModelCountryDir="${rootPath}/datasets/model/country"
dataObsRegionalDir="${rootPath}/datasets/observations/regional"
dataObsCountryDir="${rootPath}/datasets/observations/country"
mkdir -p ${dataModelRegionalDir} ${dataModelCountryDir} \
    ${dataObsRegionalDir} ${dataObsCountryDir}

#OUTPUTFILES - DO NOT CHANGE
outModelRegionalDir="${rootPath}/files/model/regional"
outModelCountryDir="${rootPath}/files/model/country"
outObsRegionalDir="${rootPath}/files/observations/regional"
outObsCountryDir="${rootPath}/files/observations/country"
mkdir -p ${outModelRegionalDir} ${outModelCountryDir} \
    ${outObsRegionalDir} ${outObsCountryDir}

#DATASET - CONFIG - CHANGE
#WAVEWATCH3
ww3forecast="${dataModelRegionalDir}/ww3forecast/forecast"
mkdir -p ${ww3forecast}

#REYNOLDS
reynoldsDaily="${dataModelRegionalDir}/reynolds/daily"
reynoldsClimatology="${dataModelRegionalDir}/reynolds/climatology"
reynoldsDecile="${dataModelRegionalDir}/reynolds/decile/1950"
reynoldsDecile12="${dataModelRegionalDir}/reynolds/decile/1950/12monthly"
reynoldsDecile6="${dataModelRegionalDir}/reynolds/decile/1950/6monthly"
reynoldsDecile3="${dataModelRegionalDir}/reynolds/decile/1950/3monthly"
reynoldsDecileMonthly="${dataModelRegionalDir}/reynolds/decile/1950/monthly"
reynoldsAverages="${dataModelRegionalDir}/reynolds/averages"
reynoldsAverages12="${dataModelRegionalDir}/reynolds/averages/12monthly"
reynoldsAverages6="${dataModelRegionalDir}/reynolds/averages/6monthly"
reynoldsAverages3="${dataModelRegionalDir}/reynolds/averages/3monthly"
reynoldsAveragesMonthly="${dataModelRegionalDir}/reynolds/averages/monthly"
reynoldsAveragesWeekly="${dataModelRegionalDir}/reynolds/averages/weekly"

mkdir -p ${reynoldsDaily} ${reynoldsClimatology} ${reynoldsDecile} \
    ${reynoldsDecile12} ${reynoldsDecile6} ${reynoldsDecile3} \
    ${reynoldsDecileMonthly} ${reynoldsAverages} ${reynoldsAverages12} \
    ${reynoldsAverages6} ${reynoldsAverages3} ${reynoldsAveragesMonthly} \
    ${reynoldsAveragesWeekly}


#ERSST
ersstMonthyProcessed="${dataModelRegionalDir}/ersst/monthly_processed"
ersstMonthy="${dataModelRegionalDir}/ersst/monthly"
ersstAverages12="${dataModelRegionalDir}/ersst/averages/12monthly"
ersstAverages6="${dataModelRegionalDir}/ersst/averages/6monthly"
ersstAverages3="${dataModelRegionalDir}/ersst/averages/3monthly"
mkdir -p ${ersstMonthyProcessed} ${ersstMonthy} ${ersstAverages12} \
    ${ersstAverages6} ${ersstAverages3}

#SEALEVEL
sealevel="${dataModelRegionalDir}/sealevel"
sealevelClimatology="${dataModelRegionalDir}/sealevel/climatology"
sealevelGrids="${dataModelRegionalDir}/sealevel/grids"
sealevelGridsDaily="${dataModelRegionalDir}/sealevel/grids/daily" #YEAR #MONTH #DAY
sealevelMonthly="${dataModelRegionalDir}/sealevel/monthly" 
sealevelTide="${dataModelRegionalDir}/sealevel/tide_gauge" 
mkdir -p ${sealevel} ${sealevelClimatology} ${sealevelGrids} \
    ${sealevelGridsDaily} ${sealevelMonthly} ${sealevelTide}

#CURRENTS - Not working
currents="${dataModelRegionalDir}/currents"
mkdir -p ${currents}
#currentsDaily="${dataModelRegionalDir}/currents/daily/"

#MUR
mur="${dataModelRegionalDir}/mur/data"
mkdir -p ${mur}

#CORAL
coral="${dataModelRegionalDir}/coral"
coralDaily="${dataModelRegionalDir}/coral/daily" #YEAR #MONTH #DAY
coralOutlook="${dataModelRegionalDir}/coral/outlook" #YEAR #MONTH
mkdir -p ${coral} ${coralDaily} ${coralOutlook}

#CHLOROPHYLL
chloro="${dataModelRegionalDir}/chloro"
chloroMonthly="${dataModelRegionalDir}/chloro/monthly"
chloroDaily="${dataModelRegionalDir}/chloro/daily"
mkdir -p ${chloro} ${chloroMonthly} ${chloroDaily}

#ACCESSS
access="${dataModelRegionalDir}/accesss"
accessssta="${dataModelRegionalDir}/accesss/ssta"
accesssssh="${dataModelRegionalDir}/accesss/ssh"
mkdir -p ${access} ${accessssta} ${accesssssh}

#BRAN
bran="${dataModelRegionalDir}/bran"
branMonthly="${dataModelRegionalDir}/bran/monthly"
branMonthlyV="${dataModelRegionalDir}/bran/monthly/v"
branMonthlyTemp="${dataModelRegionalDir}/bran/monthly/temp"
branMonthlySalt="${dataModelRegionalDir}/bran/monthly/salt"
branMonthlyEta="${dataModelRegionalDir}/bran/monthly/eta"
branMonthlyU="${dataModelRegionalDir}/bran/monthly/u"
branAverages="${dataModelRegionalDir}/bran/averages"
#branAverages12V="${dataModelRegionalDir}/bran/averages/12monthly/v/"
#branAverages12Temp="${dataModelRegionalDir}/bran/averages/12monthly/temp/"
#branAverages12Salt="${dataModelRegionalDir}/bran/averages/12monthly/salt/"
#branAverages12Eta="${dataModelRegionalDir}/bran/averages/12monthly/eta/"
#branAverages12U="${dataModelRegionalDir}/bran/averages/12monthly/u/"
#branAverages6V="${dataModelRegionalDir}/bran/averages/6monthly/v/"
#branAverages6Temp="${dataModelRegionalDir}/bran/averages/6monthly/temp/"
#branAverages6Salt="${dataModelRegionalDir}/bran/averages/6monthly/salt/"
#branAverages6Eta="${dataModelRegionalDir}/bran/averages/6monthly/eta/"
#branAverages6U="${dataModelRegionalDir}/bran/averages/6monthly/u/"
#branAverages3V="${dataModelRegionalDir}/bran/averages/3monthly/v/"
#branAverages3Temp="${dataModelRegionalDir}/bran/averages/3monthly/temp/"
#branAverages3Salt="${dataModelRegionalDir}/bran/averages/3monthly/salt/"
#branAverages3Eta="${dataModelRegionalDir}/bran/averages/3monthly/eta/"
#branAverages3U="${dataModelRegionalDir}/bran/averages/3monthly/u/"

mkdir -p ${bran} ${branMonthly} ${branMonthlyV} \
    ${branMonthlyTemp} ${branMonthlySalt} \
    ${branMonthlyEta} ${branMonthlyU} \
    ${branAverages}

echo "Setting up directories completed successfully!"

echo "Preparing Docker Images..."
echo "Creating configuration directories."
config="${rootPath}/config"
threddsConfig="${config}/thredds_config"
ncwmsConfig="${config}/ncwms_config"
erddapConfig="${config}/erddap_config"
cgiConfig="${config}/cgi_config"
nodeConfig="${config}/node_config"
dataDownloadConfig="${config}/data_download_config"
plotterConfig="${config}/plotter_config"

mkdir -p ${config} ${threddsConfig} ${ncwmsConfig} \
    ${erddapConfig} ${cgiConfig} ${nodeConfig} \
    ${dataDownloadConfig} ${plotterConfig} 

work_dir=$(pwd)
echo "Installing THREDDS-Docker"
cd ${work_dir}
#COPY THREDDS DOCKER
cp -rf ./thredds-docker ${threddsConfig}
cd "${threddsConfig}/thredds-docker"
PORT="8093" THREDDS="${threddsConfig}/thredds-docker" TOMCAT_USERS="${threddsConfig}/thredds-docker/files"\
    DATA="${dataRoot}" docker-compose up -d thredds-production

echo "THREDDS installation completed!"

echo "Installing ncWMS2-docker"
cd ${work_dir}
cp -rf ./ncwms-docker ${ncwmsConfig}
cd "${ncwmsConfig}/ncwms-docker"
#PORT="8084" TOMCAT_USERS="${ncwmsConfig}/ncwms-docker/tomcat" NCWMS="${ncwmsConfig}/ncwms-docker/.ncWMS2" \
#    docker-compose up -d ncwms-production
echo "ncWMS installation completed!"

echo "Installing ERDDAP-docker"
cd ${work_dir}
cp -rf ./erddap-docker ${erddapConfig}
cd "${erddapConfig}/erddap-docker"
#PORT="8087" IP="192.168.55.196" docker-compose up -d erddap
echo "ERDDAP installation completed!"

echo "Installing CGI-docker"
cd ${work_dir}
cp -rf ./cgi-docker ${cgiConfig}
cd "${cgiConfig}/cgi-docker"
#PORT="8088" CGI_PATH="${cgiConfig}/cgi-docker" docker-compose up -d cgi-python
echo "CGI installation completed!"

echo "Installing data-download-docker image"
cd ${work_dir}
cp -rf ./data-download-docker ${dataDownloadConfig}
cd "${dataDownloadConfig}/data-download-docker"
#docker build -t data-download .
echo "data-download-docker installation completed!"

echo "Installing plotter-docker image"
cd ${work_dir}
cp -rf ./plotter-docker ${plotterConfig}
cd "${plotterConfig}/plotter-docker"
#docker build -t plotter .
echo "plotter-docker installation completed!"

echo "Pacific Ocean Portal ENV setup completed."