#!/bin/bash
set -ex

# config
final_app_name="${BUILD_NAME}-v${ANDROID_VERSION_NAME}-b${ANDROID_VERSION_CODE}"
final_app_name_aab="${BUILD_NAME}-v${ANDROID_VERSION_NAME}-b${ANDROID_VERSION_CODE}.aab"
final_app_name_apk="${BUILD_NAME}-v${ANDROID_VERSION_NAME}-b${ANDROID_VERSION_CODE}.apk"

new_aab_path="${BITRISE_DEPLOY_DIR}/$final_app_name_aab"
new_apk_path="${BITRISE_DEPLOY_DIR}/$final_app_name_apk"

mv "$BITRISE_SIGNED_AAB_PATH" "$new_aab_path"
mv "$BITRISE_APK_PATH" "$new_apk_path"

envman add --key BITRISE_SIGNED_AAB_PATH --value "$new_aab_path"
envman add --key BITRISE_APK_PATH --value "$new_apk_path"
envman add --key BITRISE_APP_FINAL_NAME_AAB --value "$final_app_name_aab"
envman add --key BITRISE_APP_FINAL_NAME_APK --value "$final_app_name_apk"
envman add --key BITRISE_APP_FINAL_NAME --value "$final_app_name"
