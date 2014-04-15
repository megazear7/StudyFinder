User.create!([
  {email: "alexlockhart7@gmail.com", encrypted_password: "$2a$10$W.dNSPWcai0PV6Z3PLs38OJV60GUj.i6qlwVw0VSSe5XoCrMUikza", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-04-15 13:16:27", last_sign_in_at: "2014-04-15 13:16:27", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", school_id: 1}
])
Building.create!([
  {school_id: 1, name: "Dreese"},
  {school_id: 1, name: "Caldwell"},
  {school_id: 1, name: "Arps Hall"},
  {school_id: 1, name: "Atwell Hall"},
  {school_id: 1, name: "Bolz Hall"},
  {school_id: 1, name: "Drackett Tower"},
  {school_id: 1, name: "Fisher Hall"},
  {school_id: 1, name: "Jennings Hall"},
  {school_id: 1, name: "Kottman"},
  {school_id: 1, name: "Neil Building"},
  {school_id: 1, name: "Mathematics Building"},
  {school_id: 1, name: "Macquig Lab"}
])
Note.create!([
  {study_session_id: 1, summary: "Okay, I will find my notes on this.", user_id: 1, image_file_name: "overland.jpg", image_content_type: "image/jpeg", image_file_size: 842130, image_updated_at: "2014-04-15 13:22:40"}
])
Room.create!([
  {building_id: 1, room_number: "171"},
  {building_id: 1, room_number: "181"},
  {building_id: 1, room_number: "113"},
  {building_id: 1, room_number: "217"},
  {building_id: 1, room_number: "234"},
  {building_id: 1, room_number: "218"},
  {building_id: 1, room_number: "345"},
  {building_id: 1, room_number: "302"},
  {building_id: 1, room_number: "389"},
  {building_id: 1, room_number: "376"},
  {building_id: 1, room_number: "236"},
  {building_id: 1, room_number: "456"}
])
School.create!([
  {name: "Ohio State University"},
  {name: "COTC"},
  {name: "Test School"}
])
StudySession.create!([
  {room_id: 1, name: "Systems 1 Final", summary: "Lets review C, I forget a lot of the first half of the class.", date: nil, time: nil, user_id: 1, meeting_time: "2014-04-16 13:21:00", subject: "Computer Science"}
])
