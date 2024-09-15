prompt --application/pages/page_00003
begin
--   Manifest
--     PAGE: 00003
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.3'
,p_default_workspace_id=>38424569748445147056
,p_default_application_id=>800085
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CLARISABAZALDUA'
);
wwv_flow_imp_page.create_page(
 p_id=>3
,p_name=>'Calendar'
,p_alias=>'CALENDAR'
,p_step_title=>'Calendar'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'08'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38681178450331876795)
,p_plug_name=>'Calendar'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(38677650954323478580)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT e.*, ',
'       CASE ',
'           WHEN EXISTS (SELECT 1 ',
'                        FROM events e2 ',
'                        WHERE e2.username = e.username',
'                          AND e2.datetime = e.datetime',
'                          AND e2.id != e.id)  -- Usa el nombre correcto del identificador',
'           THEN ''Yellow'' ',
'           ELSE ''DefaultColor'' ',
'       END AS event_color',
'FROM events e',
'WHERE e.username = :APP_USER;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_plug_customized=>'1'
,p_plug_customized_name=>'test'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'calendar_views_and_navigation', 'month:week:day:list:navigation',
  'display_column', 'TITLE',
  'drag_and_drop', 'N',
  'end_date_column', 'DATETIME',
  'event_sorting', 'AUTOMATIC',
  'first_hour', '9',
  'maximum_events_day', '10',
  'multiple_line_event', 'Y',
  'primary_key_column', 'DESCRIPTION',
  'show_time', 'Y',
  'show_tooltip', 'Y',
  'show_weekend', 'Y',
  'start_date_column', 'DATETIME',
  'supplemental_information', '&DESCRIPTION.',
  'time_format', '24')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38682725057122882018)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(38681178450331876795)
,p_button_name=>'eventCreator'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#::::t-Button--iconLeft:::::::'
,p_button_template_id=>wwv_flow_imp.id(38677724848620478612)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Event'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:eventCreatorPop:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus-square'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38744935449246423912)
,p_name=>'Udate event on click'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(38681178450331876795)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'apexcalendarclick'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38744935773686423915)
,p_event_id=>wwv_flow_imp.id(38744935449246423912)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var event_id = this.data.id;',
'apex.navigation.redirect(''f?p=&APP_ID.:6:&APP_SESSION.:::P10_EVENT_ID:'' + event_id);',
''))
);
wwv_flow_imp.component_end;
end;
/
