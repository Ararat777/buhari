Sidekiq::Cron::Job.destroy_all!  
Sidekiq::Cron::Job.create(name: "Example Job", cron: "* * * * *", class: "SetSessionExpirationJob")