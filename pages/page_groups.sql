prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 800085
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.3'
,p_default_workspace_id=>38424569748445147056
,p_default_application_id=>800085
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CLARISABAZALDUA'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(38677841465174478737)
,p_group_name=>'Administration'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(38796022997128418521)
,p_group_name=>'User Settings'
);
wwv_flow_imp.component_end;
end;
/
