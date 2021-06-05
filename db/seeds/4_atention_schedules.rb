AtentionSchedule.destroy_all
puts "Creating AtentionSchedule"
AtentionSchedule.create!(branchoffice_id: 1, 
day: { "Monday": {"Open": true,"hour_init": "8:30:00", "hour_end": "18:00:00"},
    "Tuesday": {"Open": true,"hour_init": "8:30:00", "hour_end": "18:00:00"},
    "Wednesday": {"Open": true,"hour_init": "8:30:00", "hour_end": "18:00:00"},
    "Thursday": {"Open": true,"hour_init": "8:30:00", "hour_end": "18:00:00"},
    "Friday": {"Open": true,"hour_init": "8:30:00", "hour_end": "18:00:00"},
    "Saturday": {"Open": true,"hour_init": "9:30:00", "hour_end": "13:00:00"},
    "Sunday": {"Open": false}
})

AtentionSchedule.create!(branchoffice_id: 2, 
day: { "Monday": {"Open": true,"hour_init": "8:30:00", "hour_end": "18:00:00"},
    "Tuesday": {"Open": true,"hour_init": "8:30:00", "hour_end": "18:00:00"},
    "Wednesday": {"Open": true,"hour_init": "8:30:00", "hour_end": "18:00:00"},
    "Thursday": {"Open": true,"hour_init": "8:30:00", "hour_end": "18:00:00"},
    "Friday": {"Open": true,"hour_init": "8:30:00", "hour_end": "18:00:00"},
    "Saturday": {"Open": true,"hour_init": "9:30:00", "hour_end": "13:00:00"},
    "Sunday": {"Open": false}
    })

AtentionSchedule.create!(branchoffice_id: 3, 
    day: { "Monday": {"Open": true,"hour_init": "8:30:00", "hour_end": "18:00:00"},
    "Tuesday": {"Open": true,"hour_init": "8:30:00", "hour_end": "18:00:00"},
    "Wednesday": {"Open": true,"hour_init": "8:30:00", "hour_end": "18:00:00"},
    "Thursday": {"Open": true,"hour_init": "8:30:00", "hour_end": "18:00:00"},
    "Friday": {"Open": true,"hour_init": "8:30:00", "hour_end": "18:00:00"},
    "Saturday": {"Open": true,"hour_init": "9:30:00", "hour_end": "13:00:00"},
    "Sunday": {"Open": false}
    })

AtentionSchedule.create!(branchoffice_id: 4, 
    day: { "Monday": {"Open": true,"hour_init": "10:00:00", "hour_end": "21:00:00"},
    "Tuesday": {"Open": true,"hour_init": "10:00:00", "hour_end": "21:00:00"},
    "Wednesday": {"Open": true,"hour_init": "10:00:00", "hour_end": "21:00:00"},
    "Thursday": {"Open": true,"hour_init": "10:00:00", "hour_end": "21:00:00"},
    "Friday": {"Open": true,"hour_init": "10:00:00", "hour_end": "21:00:00"},
    "Saturday": {"Open": true,"hour_init": "9:30:00", "hour_end": "14:00:00"},
    "Sunday": {"Open": false}
    })
AtentionSchedule.create!(branchoffice_id: 5, 
    day: { "Monday": {"Open": true,"hour_init": "9:00:00", "hour_end": "18:00:00"},
    "Tuesday": {"Open": true,"hour_init": "9:00:00", "hour_end": "18:00:00"},
    "Wednesday": {"Open": true,"hour_init": "9:00:00", "hour_end": "18:00:00"},
    "Thursday": {"Open": true,"hour_init": "9:00:00", "hour_end": "18:00:00"},
    "Friday": {"Open": true,"hour_init": "9:00:00", "hour_end": "18:00:00"},
    "Saturday": {"Open": true,"hour_init": "9:00:00", "hour_end": "14:00:00"},
    "Sunday": {"Open": false}
    })

AtentionSchedule.create!(branchoffice_id: 6, 
    day: { "Monday": {"Open": true,"hour_init": "9:00:00", "hour_end": "18:00:00"},
    "Tuesday": {"Open": true,"hour_init": "9:00:00", "hour_end": "18:00:00"},
    "Wednesday": {"Open": true,"hour_init": "9:00:00", "hour_end": "18:00:00"},
    "Thursday": {"Open": true,"hour_init": "9:00:00", "hour_end": "18:00:00"},
    "Friday": {"Open": true,"hour_init": "9:00:00", "hour_end": "18:00:00"},
    "Saturday": {"Open": true,"hour_init": "9:00:00", "hour_end": "14:00:00"},
    "Sunday": {"Open": false}
    })
puts "Ending AtentionSchedule"