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

lisa = User.create(name: 'Lisa', password: 'lisa')
e = Event.create(event_type:'birthday', name: 'Lisa bday bash', num_people: 10, budget: 1000, date: 20190915, user_id: lisa.id)
activity = Activity.create(name: 'Clubbling', link:'www.google.com')
activity_event = ActivityEvent.create(activity_id: activity.id, event_id: e.id)
