#!/bin/bash
set -ex

# config
final_app_name="$change_filename_build_name-v$change_filename_version_number-b$change_filename_build_number"

new_build_path="${BITRISE_DEPLOY_DIR}/$final_app_name"

FILE="$change_filename_aab_path"
if [ -f "$FILE" ]; then
    mv "$change_filename_aab_path" "$new_build_path.aab"
else 
    echo "Android .AAB file does not exist."
    return 1
fi

FILE2="$change_filename_apk_path"
if [ -f "$FILE2" ]; then
    mv "$change_filename_apk_path" "$new_build_path.apk"
else 
    echo "Android .APK file does not exist."
    return 1
fi

envman add --key BITRISE_SIGNED_AAB_PATH --value "$new_build_path.aab"
envman add --key BITRISE_APK_PATH --value "$new_build_path.apk"
envman add --key BITRISE_APP_FINAL_NAME_AAB --value "$final_app_name.aab"
envman add --key BITRISE_APP_FINAL_NAME_APK --value "$final_app_name.apk"
envman add --key BITRISE_APP_FINAL_NAME --value "$final_app_name"
