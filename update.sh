#/bin/bash

# download zip
poetry run python download.py

# clean up
rm -rf bedrock_new/
rm -rf bedrock_old/

# unzip
unzip -o bedrock.zip -d bedrock_new
rm bedrock.zip

# move files
mv bedrock/worlds/ bedrock_new/
mv bedrock/server.properties bedrock_new/

# swap
mv bedrock/ bedrock_old/
mv bedrock_new/ bedrock/
