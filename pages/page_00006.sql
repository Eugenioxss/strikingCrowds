prompt --application/pages/page_00006
begin
--   Manifest
--     PAGE: 00006
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
 p_id=>6
,p_name=>'Event Creator'
,p_alias=>'EVENTCREATORPOP'
,p_step_title=>'Event Creator'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const email = document.querySelector(''.t-Button-label'').innerHTML;',
'document.getElementById(''P1_USERNAME'').value = email;'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_cache_mode=>'CACHE'
,p_cache_timeout_seconds=>600
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38704940834428285570)
,p_plug_name=>'Event Creator'
,p_title=>'Event Creator'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(38677650954323478580)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select USERNAME,',
'       TYPE,',
'       TITLE,',
'       DESCRIPTION,',
'       DATETIME,',
'       PRIORITY,',
'       ID',
'  from EVENTS'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P1_TITLE,P1_DESCRIPTION,P1_TYPE,P1_PRIORITY,P1_DATESTART,P1_ID'
,p_plug_header=>'Introduce your event here'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38704945310209285574)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(38704940834428285570)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(38677724744677478612)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38704946781193285575)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(38704940834428285570)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(38677724744677478612)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(38704947036745285575)
,p_branch_action=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38682725375079882021)
,p_name=>'P1_TITLE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(38704940834428285570)
,p_item_source_plug_id=>wwv_flow_imp.id(38704940834428285570)
,p_prompt=>'Title'
,p_source=>'USERNAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(38677723518011478611)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38682725587116882023)
,p_name=>'P1_DATESTART'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(38704940834428285570)
,p_item_source_plug_id=>wwv_flow_imp.id(38704940834428285570)
,p_prompt=>'Datestart'
,p_format_mask=>'YYYY-MM-DD HH24:MI:SS'
,p_source=>'DATETIME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(38677722277854478610)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'N'
,p_attribute_12=>'SHOW-WEEK:MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON'
,p_attribute_13=>'VISIBLE'
,p_attribute_15=>'FOCUS'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38682726640990882034)
,p_name=>'P1_DATEEND'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(38704940834428285570)
,p_item_source_plug_id=>wwv_flow_imp.id(38704940834428285570)
,p_prompt=>'Datetime'
,p_format_mask=>'YYYY-MM-DD'
,p_source=>'DATETIME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(38677722277854478610)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'ITEM'
,p_attribute_05=>'P1_DATESTART'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'N'
,p_attribute_12=>'SHOW-WEEK:MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON'
,p_attribute_13=>'VISIBLE'
,p_attribute_15=>'FOCUS'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38682726714933882035)
,p_name=>'P1_DAYS'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(38704940834428285570)
,p_item_source_plug_id=>wwv_flow_imp.id(38704940834428285570)
,p_prompt=>'Days'
,p_source=>'PRIORITY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>'STATIC2:Monday;Monday,Tuesday;Tuesday,Wednesday;Wednesday,Thursday;Thursday,Friday;Friday,Saturday;Saturday,Sunday;Sunday'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(38677723518011478611)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'CONTAINS'
,p_attribute_02=>'N'
,p_attribute_04=>'N'
,p_attribute_09=>'0'
,p_attribute_13=>'Y'
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38701674693484146918)
,p_name=>'P1_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(38704940834428285570)
,p_item_source_plug_id=>wwv_flow_imp.id(38704940834428285570)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38704942321556285572)
,p_name=>'P1_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(38704940834428285570)
,p_item_source_plug_id=>wwv_flow_imp.id(38704940834428285570)
,p_prompt=>'Type'
,p_source=>'TYPE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:School;school,Work;work,Personal;personal,Health;health,Other;other'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(38677723518011478611)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38704942790260285572)
,p_name=>'P1_DESCRIPTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(38704940834428285570)
,p_item_source_plug_id=>wwv_flow_imp.id(38704940834428285570)
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(38677722277854478610)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38704943175783285572)
,p_name=>'P1_PRIORITY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(38704940834428285570)
,p_item_source_plug_id=>wwv_flow_imp.id(38704940834428285570)
,p_prompt=>'Priority'
,p_source=>'PRIORITY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Low Priority;Low Priority,High Priority;High Priority'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(38677723518011478611)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38701673711701146909)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38704946781193285575)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38701673854473146910)
,p_event_id=>wwv_flow_imp.id(38701673711701146909)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_TITLE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38701674091893146912)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SubmitEvent'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    -- Inputs',
'    v_username          VARCHAR2(255) := :APP_USER;',
'    v_type              VARCHAR2(255) := :P1_TYPE;',
'    v_title             VARCHAR2(255) := :P1_TITLE;',
'    v_description       VARCHAR2(255) := :P1_DESCRIPTION;',
'    v_date_start        TIMESTAMP := TO_TIMESTAMP(:P1_DATESTART, ''YYYY-MM-DD HH24:MI:SS'');',
'    v_date_end          DATE := TO_DATE(:P1_DATEEND, ''YYYY-MM-DD'');',
'    v_priority          VARCHAR2(255) := :P1_PRIORITY;',
'    v_days              VARCHAR2(255) := UPPER(TRIM(:P1_DAYS));',
'    ',
'    -- Variables',
'    v_day_of_week       VARCHAR2(20);',
'    v_current_date      TIMESTAMP;',
'    v_id                VARCHAR2(32); -- Unique ID for the entire event (remains the same across all dates)',
'    v_day_found         BOOLEAN;',
'    ',
'BEGIN',
'    -- Generate the unique ID before the loop',
'    v_id := DBMS_RANDOM.STRING(''X'', 32);',
'',
'    -- Loop through each day from DATESTART to DATEEND',
'    v_current_date := v_date_start;',
'    WHILE v_current_date <= v_date_end LOOP',
'        v_day_of_week := UPPER(TRIM(TO_CHAR(v_current_date, ''DAY'', ''NLS_DATE_LANGUAGE=ENGLISH'')));',
'        v_day_of_week := RTRIM(v_day_of_week);',
'',
'        -- Check if the current day is in the list',
'        v_day_found := FALSE;',
'        IF INSTR(v_days, v_day_of_week) > 0 THEN',
'            v_day_found := TRUE;',
'        END IF;',
'',
'        IF v_day_found THEN',
'            -- Insert into EVENTS with the pre-generated unique ID',
'            INSERT INTO EVENTS (USERNAME, TYPE, TITLE, DESCRIPTION, DATETIME, PRIORITY, IDENTIFIER)',
'            VALUES (',
'                v_username,',
'                v_type,',
'                v_title,',
'                v_description,',
'                v_current_date,',
'                v_priority,',
'                v_id',
'            );',
'        END IF;',
'',
'        -- Move to the next day',
'        v_current_date := v_current_date + INTERVAL ''1'' DAY;',
'    END LOOP;',
'    ',
'    COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(38704946781193285575)
,p_internal_uid=>38701674091893146912
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38704947529184285576)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(38704940834428285570)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Event Creator'
,p_internal_uid=>38704947529184285576
);
wwv_flow_imp.component_end;
end;
/
