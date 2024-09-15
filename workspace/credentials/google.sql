prompt --workspace/credentials/google
begin
--   Manifest
--     CREDENTIAL: GOOGLE
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
 p_id=>wwv_flow_imp.id(38733971713730135373)
,p_name=>'GOOGLE'
,p_static_id=>'google_authentication'
,p_authentication_type=>'OAUTH2_CLIENT_CREDENTIALS'
,p_scope=>'profile'
,p_prompt_on_install=>true
);
wwv_flow_imp.component_end;
end;
/
