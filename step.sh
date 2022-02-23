#!/bin/bash
set -ex

# config
final_app_name="$change_filename_build_name-v$change_filename_version_number-b$change_filename_build_number"
final_app_name_aab="$final_app_name.aab"
final_app_name_apk="$final_app_name.apk"

new_aab_path="${BITRISE_DEPLOY_DIR}/$final_app_name_aab"
new_apk_path="${BITRISE_DEPLOY_DIR}/$final_app_name_apk"

# mv "$BITRISE_SIGNED_AAB_PATH" "$new_aab_path"
# mv "$BITRISE_APK_PATH" "$new_apk_path"

envman add --key BITRISE_SIGNED_AAB_PATH --value "$new_aab_path"
envman add --key BITRISE_APK_PATH --value "$new_apk_path"
envman add --key BITRISE_APP_FINAL_NAME_AAB --value "$final_app_name_aab"
envman add --key BITRISE_APP_FINAL_NAME_APK --value "$final_app_name_apk"
envman add --key BITRISE_APP_FINAL_NAME --value "$final_app_name"
