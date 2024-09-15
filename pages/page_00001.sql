prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'EpicGamer'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function splitString(str) {',
'    // Determine the length of the string',
'    const totalLength = str.length;',
'',
'    // The length of the last part is fixed at 10 characters',
'    const lastPartLength = 9;',
'',
'    // Calculate the length of the first part',
'    const firstPartLength = Math.max(totalLength - lastPartLength, 0);',
'',
'    // Extract the first part and the last part',
'    const firstPart = str.slice(0, firstPartLength);',
'    const lastPart = str.slice(firstPartLength);',
'',
'    // Return the two parts as an object or an array',
'    return {',
'        firstPart: firstPart,',
'        lastPart: lastPart',
'    };',
'}',
'',
'const text = document.querySelector(''.a-ListView-item.ui-body-inherit.has-count'').textContent',
'const firstPart = splitString(text).firstPart',
'const lastPart = splitString(text).lastPart',
'',
'Notification.requestPermission().then(perm => {',
'    if(perm === ''granted'') {',
'      new Notification(`Tiene un evento: ''${firstPart}'', en ${lastPart}`)',
'    }',
'  })'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38445087700947586126)
,p_plug_name=>'Habitus'
,p_title=>'Habitus'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(38677650954323478580)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in ( select preference_value',
'            from eba_ca_preferences',
'            where preference_name = ''APPLICATION_SUBTITLE''',
'            union all',
'            select ''Helping you get one day closer to your goals''',
'            from dual',
'            where not exists ( select null',
'                               from eba_ca_preferences',
'                               where preference_name = ''APPLICATION_SUBTITLE'')',
'          ) loop',
'    sys.htp.p(''<p>''||apex_escape.html(c1.preference_value)||''</p>'');',
'end loop;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38445088351930586132)
,p_plug_name=>'Today''s Tasks'
,p_title=>'Today''s Tasks'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(38677650954323478580)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT id, title, datetime',
'FROM events',
'WHERE USERNAME = :APP_USER',
'  AND TRUNC(DATETIME) = TRUNC(SYSTIMESTAMP AT TIME ZONE ''UTC'')'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'counter_column', 'DATETIME',
  'text_column', 'TITLE')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38445086820900586117)
,p_button_sequence=>10
,p_button_name=>'Inicio'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(38677724066283478611)
,p_button_image_alt=>'Inicio'
,p_button_position=>'AFTER_LOGO'
,p_icon_css_classes=>'fa-home'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38445086948262586118)
,p_button_sequence=>20
,p_button_name=>'Calendario'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(38677724066283478611)
,p_button_image_alt=>'Calendario'
,p_button_position=>'AFTER_LOGO'
,p_icon_css_classes=>'fa-calendar-o'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38701675500972146927)
,p_process_sequence=>20
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_current_time TIMESTAMP WITH TIME ZONE := SYSTIMESTAMP;',
'    l_event_time TIMESTAMP WITH TIME ZONE;',
'    l_30_minutes_before TIMESTAMP WITH TIME ZONE;',
'    v_event_name VARCHAR2(255);',
'BEGIN',
'    FOR r_event IN (',
'        SELECT id, title, datetime',
'          FROM events',
'         WHERE datetime BETWEEN l_current_time AND l_current_time + INTERVAL ''30'' MINUTE',
'    )',
'    LOOP',
'        l_event_time := r_event.datetime;',
'        l_30_minutes_before := l_event_time - INTERVAL ''30'' MINUTE;',
'        v_event_name := r_event.title;',
'',
'        IF l_current_time >= l_30_minutes_before AND TRUE THEN',
'            FOR r_subscription IN (',
'                SELECT DISTINCT user_name',
'                  FROM apex_appl_push_subscriptions',
'                 WHERE application_id = :APP_ID',
'            )',
'            LOOP',
'                apex_pwa.send_push_notification (',
'                    p_application_id => :APP_ID,',
'                    p_user_name      => r_subscription.user_name,',
'                    p_title          => ''Recordatorio del Evento'',',
'                    p_body           => ''Faltan 30 minutos para el evento: '' || v_event_name',
'                );',
'            END LOOP;',
'        END IF;',
'',
'        IF l_current_time >= l_event_time THEN',
'            FOR r_subscription IN (',
'                SELECT DISTINCT user_name',
'                  FROM apex_appl_push_subscriptions',
'                 WHERE application_id = :APP_ID',
'            )',
'            LOOP',
'                apex_pwa.send_push_notification (',
'                    p_application_id => :APP_ID,',
'                    p_user_name      => r_subscription.user_name,',
'                    p_title          => ''Es hora del Evento'',',
'                    p_body           => ''Es hora del evento: '' || v_event_name',
'                );',
'            END LOOP;',
'        END IF;',
'    END LOOP;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>38701675500972146927
);
wwv_flow_imp.component_end;
end;
/
