Building.create!([
  {school_id: 1, name: "Dreese"},
  {school_id: 1, name: "Caldwell"},
  {school_id: 1, name: "Hitchcock"},
  {school_id: 4, name: "Founders"},
  {school_id: 4, name: "Co Hall"}
])
Note.create!([
  {study_session_id: 1, summary: "We should make sure to go over the stuff about graphs and stuff.", user_id: nil},
  {study_session_id: 2, summary: "The beginging of chapter 3 in the book helps a lot for this.", user_id: nil},
  {study_session_id: 3, summary: "I can help you with problem 4, but 1-3 I cannot seem to figure out.", user_id: nil},
  {study_session_id: 5, summary: "Blah Blah Blah", user_id: 1},
  {study_session_id: 5, summary: "Blah Blah Blah ....", user_id: 1},
  {study_session_id: 5, summary: "Blah Blah Blah..... Again .... asdfadas", user_id: 1},
  {study_session_id: 5, summary: "Blah Blah .asdfjahsdjf adfasddddddd", user_id: 2},
  {study_session_id: 10, summary: "testing", user_id: 1},
  {study_session_id: 8, summary: "testing note", user_id: 1}
])
Room.create!([
  {building_id: 1, room_number: "172"},
  {building_id: 1, room_number: "254"},
  {building_id: 1, room_number: "399"},
  {building_id: 3, room_number: "102"},
  {building_id: 3, room_number: "170"},
  {building_id: 3, room_number: "113"},
  {building_id: 2, room_number: "999"},
  {building_id: 2, room_number: "105"},
  {building_id: 2, room_number: "276"},
  {building_id: 7, room_number: "243"},
  {building_id: 7, room_number: "122"},
  {building_id: 7, room_number: "423"},
  {building_id: 1, room_number: "111"},
  {building_id: 1, room_number: "111"},
  {building_id: 2, room_number: "888"}
])
School.create!([
  {name: "Ohio State University"},
  {name: "COTC"}
])
StudySession.create!([
  {room_id: 3, name: "Testing", summary: "Summarry .... .... ... blah blah bah", date: nil, time: nil, user_id: 1, meeting_time: "2013-04-09 07:09:00"},
  {room_id: 7, name: "Study For Systems Final", summary: "We will be studying for the systems final. Going over assembly.", date: nil, time: nil, user_id: 1, meeting_time: "2014-04-12 13:15:00"},
  {room_id: 2, name: "Example", summary: "test", date: nil, time: nil, user_id: 1, meeting_time: "2014-04-08 18:46:00"}
])
