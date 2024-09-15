prompt --workspace/credentials/app_800085_push_notifications_credentials_2
begin
--   Manifest
--     CREDENTIAL: App 800085 Push Notifications Credentials (2)
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.3'
,p_default_workspace_id=>38424569748445147056
,p_default_application_id=>800085
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CLARISABAZALDUA'
);
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(38875259908200248834)
,p_name=>'App 800085 Push Notifications Credentials (2)'
,p_static_id=>'App_800085_Push_Notifications_Credentials_2_'
,p_authentication_type=>'KEY_PAIR'
,p_prompt_on_install=>false
);
wwv_flow_imp.component_end;
end;
/
