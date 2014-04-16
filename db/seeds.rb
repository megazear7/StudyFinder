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
