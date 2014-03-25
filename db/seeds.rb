User.create!([
  {email: "alexlockhart7@gmail.com", encrypted_password: "$2a$10$36BPf95lSMy9pXJ5jbgSOeg2WK6ONA7pqtJ3DKrhMj7ZwUbg8nQqK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-03-25 02:00:09", last_sign_in_at: "2014-03-25 02:00:09", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
])
Building.create!([
  {school_id: 1, name: "Dreese"},
  {school_id: 1, name: "Caldwell"},
  {school_id: 1, name: "Hitchcock"}
])
Note.create!([
  {study_session_id: 1, summary: "We should make sure to go over the stuff about graphs and stuff."},
  {study_session_id: 2, summary: "The beginging of chapter 3 in the book helps a lot for this."},
  {study_session_id: 3, summary: "I can help you with problem 4, but 1-3 I cannot seem to figure out."}
])
Room.create!([
  {building_id: 1, room_number: "172"},
  {building_id: 1, room_number: "254"},
  {building_id: 1, room_number: "309"},
  {building_id: 3, room_number: "102"},
  {building_id: 3, room_number: "170"},
  {building_id: 3, room_number: "113"},
  {building_id: 2, room_number: "101"},
  {building_id: 2, room_number: "105"},
  {building_id: 2, room_number: "276"}
])
School.create!([
  {name: "Ohio State University"}
])
StudySession.create!([
  {room_id: 2, name: "Studing for foundatons final", summary: "We are going to go over all the material needed for the foundations final.", date: nil, time: nil},
  {room_id: 6, name: "Math 1130 midterm", summary: "Lets go over integration.", date: nil, time: nil},
  {room_id: 9, name: "ECE 2000 Clymer Homework 5", summary: "Homework 5 is impossible!! We need to go over this.", date: nil, time: nil}
])
