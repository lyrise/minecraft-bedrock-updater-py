#/bin/bash

poetry run python update.py

unzip -o -d bedrock_new bedrock.zip
rm bedrock.zip

mv bedrock/worlds/ bedrock_new/
mv bedrock/server.properties bedrock_new/
mv bedrock/ bedrock_old/
mv bedrock_new/ bedrock/
