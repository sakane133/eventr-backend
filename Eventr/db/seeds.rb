# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Event.destroy_all
ActivityEvent.destroy_all
Photo.destroy_all
Activity.destroy_all

lisa = User.create(name: 'Lisa', password_digest: 'lisa')
e = Event.create(event_type:'birthday', name: 'Lisa bday bash', num_people: 10, budget: 1000, date: 20190904, user_id: lisa.id)
activity = Activity.create(name: 'Clubbling', link:'www.google.com', category: 'bday')
new = Activity.create(name: 'Karaoke', link:'www.google.com', category: 'bday')
activity_event = ActivityEvent.create(activity_id: activity.id, event_id: e.id, selected: true)
ActivityEvent.create(activity_id: new.id, event_id: e.id, selected: true)
newB = Activity.create(name: 'Bowling', link:'www.google.com', category: 'bday')
ActivityEvent.create(activity_id: newB.id, event_id: e.id, selected: true)
