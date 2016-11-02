DROP TABLE IF EXISTS screen;
CREATE TABLE screen (
	serial INTEGER PRIMARY KEY,
	path VARCHAR NOT NULL,
    unique_params VARCHAR NOT NULL DEFAULT '',
	sort_order INTEGER DEFAULT 0,
    title VARCHAR DEFAULT NULL,
    left_nav_button VARCHAR DEFAULT NULL,
    right_nav_button VARCHAR DEFAULT NULL,
    left_tool_button VARCHAR DEFAULT NULL,
    right_tool_button VARCHAR DEFAULT NULL,
    uri_params VARCHAR DEFAULT NULL,
	analytics VARCHAR DEFAULT NULL,
	analytics_enabled BOOL DEFAULT 1,
	analytics_enabled_custom BOOL DEFAULT 1
);
CREATE UNIQUE INDEX screen_path_unique_params ON screen(path,unique_params);

INSERT INTO screen( path, title ) VALUES ('/about', 'SEMANTICS_navbar_about|About This App');
INSERT INTO screen( path, title ) VALUES ('/action_links', 'SEMANTICS_navbar_live' );
INSERT INTO screen( path, title ) VALUES ('/action_tiles', 'SEMANTICS_navbar_live' );
INSERT INTO screen( path, title ) VALUES ('/action_scanner', 'Game Scanner');
INSERT INTO screen( path, title ) VALUES ('/action_type', 'Game Action');
INSERT INTO screen( path, title, analytics ) VALUES ('/agenda_item', 'Agenda Item Details', 'Agenda Item/{:name:}');
INSERT INTO screen( path, title, analytics ) VALUES ('/attendee', '{:name:} Details', 'Attendee/{:name:}');
INSERT INTO screen( path, title ) VALUES ('/attendee_categories', 'SEMANTICS_navbar_attendees|Attendees');
INSERT INTO screen( path, title, analytics ) VALUES ('/attendee_category', '{:name:}', 'Attendee Category/{:name:}');
INSERT INTO screen( path, title, analytics ) VALUES ('/attendee_email', 'Email', 'Attendee Email/{:name:}');
INSERT INTO screen( path, title, analytics ) VALUES ('/attendee_message', 'Attendee Messaging', 'Attendee Messaging/{:name:}');
INSERT INTO screen( path, title ) VALUES ('/attendees', 'SEMANTICS_navbar_attendees|Attendees');
INSERT INTO screen( path, unique_params, title ) VALUES ('/attendees', '{"show_favorites": 1}', 'SEMANTICS_navbar_attendee_favorites|My Connections');
INSERT INTO screen( path, title, analytics ) VALUES ('/beacon', 'Beacon Details', 'Beacon/{:b.major:}');
INSERT INTO screen( path, title ) VALUES ('/beacon_debug', 'Beacon Debug');
INSERT INTO screen( path, title ) VALUES ('/contribute', 'Contribute');
INSERT INTO screen( path, title, analytics ) VALUES ('/data_set', 'Event Details', 'Multi-Event Details/{:name:}');
INSERT INTO screen( path, title, analytics ) VALUES ('/data_set_category', '{:name:}', 'Multi-Event Category/{:name:}');
INSERT INTO screen( path, title ) VALUES ('/data_sets', NULL);
INSERT INTO screen( path, title ) VALUES ('/debug', 'Debug');
INSERT INTO screen( path, title, analytics_enabled, analytics_enabled_custom ) VALUES ('/detail_placeholder', 'Detail Placeholder', 0, 0 );
INSERT INTO screen( path, title ) VALUES ('/discover', 'SEMANTICS_navbar_discover');
INSERT INTO screen( path, title, analytics ) VALUES ('/evaluations', 'Session Evaluation', 'Session Evaluation/{:name:}');
INSERT INTO screen( path, title, analytics ) VALUES ('/event', '{:name:} Details', 'Event/{:e.name:}');
INSERT INTO screen( path, title, analytics ) VALUES ('/event_categories', '{:ec.name|SEMANTICS_nav_event_category:}', 'Event Categories');
INSERT INTO screen( path, title, analytics ) VALUES ('/event_category', '{:ec.name|SEMANTICS_nav_event_category:}', 'Event Category/{:name:}');
INSERT INTO screen( path, title ) VALUES ('/events', 'SEMANTICS_navbar_schedule|Schedule');
INSERT INTO screen( path, unique_params, title ) VALUES ('/events', '{"category": "*"}', 'SEMANTICS_nav_event_category:::Categories' );
INSERT INTO screen( path, title ) VALUES ('/favorites', 'SEMANTICS_navbar_favorites');
INSERT INTO screen( path, title ) VALUES ('/feedback', 'General Program Evaluation');
INSERT INTO screen( path, title, analytics ) VALUES ('/friend', 'SEMANTICS_navbar_friend|Friend Details', 'Friend/{:f.name:}');
INSERT INTO screen( path, title ) VALUES ('/friends', 'SEMANTICS_sharing_friends_list_title|Sharing Friends');
INSERT INTO screen( path, title, analytics ) VALUES ('/friends_invite', 'Invite Friends', 'Invite Friends to ShareMySchedule');
INSERT INTO screen( path, title ) VALUES ('/gallery_instagram', 'Instagram');
INSERT INTO screen( path, title ) VALUES ('/game', 'Game');
INSERT INTO screen( path, title ) VALUES ('/game_rules', 'Game Rules');
INSERT INTO screen( path, title ) VALUES ('/groupme', 'Group Me');
INSERT INTO screen( path, title, analytics ) VALUES ('/html', NULL, 'Browser/{:nav.target_url:}');
INSERT INTO screen( path, title ) VALUES ('/image_picker', 'Image Picker');
INSERT INTO screen( path, title ) VALUES ('/inbox', 'SEMANTICS_navbar_inbox|Inbox');
INSERT INTO screen( path, title, analytics ) VALUES ('/index', '{:name:} Details', 'Index/{:et.name:}');
INSERT INTO screen( path, title, analytics ) VALUES ('/index_categories', 'SEMANTICS_nav_index_category|Categories', 'Index Categories');
INSERT INTO screen( path, title, analytics ) VALUES ('/index_category', 'SEMANTICS_nav_index_category|Categories', 'Index Category/{:name:}');
INSERT INTO screen( path, unique_params, title, analytics ) VALUES ('/index_category', '{"category": "*"}', '{:name:}', 'Index Category/{:name:}');
INSERT INTO screen( path, unique_params, title, analytics ) VALUES ('/index_category', '{"serial": "*"}', '{:name:}', 'Index Category/{:name:}');
INSERT INTO screen( path, title ) VALUES ('/indexes', NULL);
INSERT INTO screen( path, title, analytics ) VALUES ('/intro', 'SEMANTICS_navbar_tutorial|Welcome', 'Tutorial');
INSERT INTO screen( path, title, analytics ) VALUES ('/lead', 'SEMANTICS_navbar_lead|Lead Details', 'Lead/{:l.name:}');
INSERT INTO screen( path, title ) VALUES ('/leaderboard', 'Leaderboard');
INSERT INTO screen( path, title, analytics ) VALUES ('/lead_scanner', 'Badge Scanner', 'QR Scanner');
INSERT INTO screen( path, title ) VALUES ('/leads', 'SEMANTICS_navbar_leads|Leads');
INSERT INTO screen( path, title ) VALUES ('/map', 'SEMANTICS_navbar_map');
INSERT INTO screen( path, title, analytics ) VALUES ('/messages', 'SEMANTICS_navbar_messages|Messages', 'Direct Messages');
INSERT INTO screen( path, unique_params, title, analytics ) VALUES ('/messages', '{"obj_types": "a"}', 'Messages: {:a.name:}', 'Direct Messages');
INSERT INTO screen( path, title ) VALUES ('/my_attendee', 'My Attendee');
INSERT INTO screen( path, title ) VALUES ('/my_profile', 'SEMANTICS_navbar_my_profile|My Profile');
INSERT INTO screen( path, title ) VALUES ('/notes', 'SEMANTICS_navbar_notes|My Notes');
INSERT INTO screen( path, title ) VALUES ('/photo_frame_chooser', 'Photo Frame Chooser');
INSERT INTO screen( path, title ) VALUES ('/photo_frame_creator', 'Photo Frame Creator');
INSERT INTO screen( path, title ) VALUES ('/photo_slideshow', 'Photo Slide Show');
INSERT INTO screen( path, title ) VALUES ('/pid_search', 'Multi-Event Picker Search');
INSERT INTO screen( path, title, analytics ) VALUES ('/quiz', 'Quiz Detail', 'Quiz Detail/{:q.name:}');
INSERT INTO screen( path, title, analytics ) VALUES ('/quiz_question', 'Quiz Question', 'Quiz Question/{:name:}');
INSERT INTO screen( path, title, analytics ) VALUES ('/quiz_results', 'Quiz Results', 'Quiz Results/{:name:}');
INSERT INTO screen( path, title, analytics ) VALUES ('/quiz_review', 'Quiz Review', 'Quiz Review/{:name:}');
INSERT INTO screen( path, title, analytics ) VALUES ('/quiz_submission', 'Quiz Submission', 'Quiz Submission/{:name:}');
INSERT INTO screen( path, title ) VALUES ('/quizzes', 'Quiz List');
INSERT INTO screen( path, title ) VALUES ('/qr_viewer', 'QR Viewer');
INSERT INTO screen( path, title, analytics ) VALUES ('/rss', NULL, 'RSS/{:nav.target_url:}');
INSERT INTO screen( path, title ) VALUES ('/scanner', 'Scanner');
INSERT INTO screen( path, title ) VALUES ('/schedule', 'SEMANTICS_navbar_schedule|Schedule');
INSERT INTO screen( path, title, analytics ) VALUES ('/schedule_filter', '', 'Schedule Filter');
INSERT INTO screen( path, title ) VALUES ('/search', 'SEMANTICS_navbar_search|Search');
INSERT INTO screen( path, title, analytics ) VALUES ('/session_evaluation', 'SEMANTICS_navbar_evaluations', 'Session Evaluation/{:name:}');
INSERT INTO screen( path, title, analytics ) VALUES ('/session_live', 'Session Evaluation', 'Session Evaluation/{:name:}');
INSERT INTO screen( path, title, analytics ) VALUES ('/session_live_polling', 'Session Live Polling', 'Session Live Polling/{:name:}');
INSERT INTO screen( path, title, analytics ) VALUES ('/session_live_replies', 'Session Live Replies', 'Session Live Replies/{:name:}');
INSERT INTO screen( path, title, analytics ) VALUES ('/session_live_whos_here', 'Who''s Here', 'Session Live Who''s Here/{:name:}');
INSERT INTO screen( path, title ) VALUES ('/settings', 'Settings');
INSERT INTO screen( path, title ) VALUES ('/share_pin', 'Share Pin');
INSERT INTO screen( path, title, analytics ) VALUES ('/sponsor', 'Sponsor Details', 'Sponsor/{:name:}');
INSERT INTO screen( path, title ) VALUES ('/ua_rich_push', 'UA Rich Push');
INSERT INTO screen( path, title, analytics ) VALUES ('/venue', '{:name:} Details', 'Venue/{:name:}');
INSERT INTO screen( path, title, analytics ) VALUES ('/venue_categories', 'SEMANTICS_nav_venue_category|Categories', 'Venue Categories' );
INSERT INTO screen( path, title, analytics ) VALUES ('/venue_category', 'SEMANTICS_nav_venue_category|Categories', 'Venue Categories');
INSERT INTO screen( path, unique_params, title, analytics ) VALUES ('/venue_category', '{"obj_types": "*"}', '{:name:}', 'Venue Category/{:name:}');
INSERT INTO screen( path, title ) VALUES ('/venues', 'SEMANTICS_navbar_venue_list|Venues');
INSERT INTO screen( path, unique_params, title, analytics ) VALUES ('/venues', '{"category": "*"}', '{:vc.name|SEMANTICS_navbar_venue_list:}', 'Venue Category/{:name:}');
INSERT INTO screen( path, title ) VALUES ('/video', 'Video');
INSERT INTO screen( path, title, analytics ) VALUES ('/web', NULL, 'Browser/{:nav.target_url:}');
INSERT INTO screen( path, title ) VALUES ('/youtube_channel', NULL);
