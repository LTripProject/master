web: bin/rails server -p $PORT -e $RAILS_ENV
worker: worker bundle exec rake jobs:work
migrate: bundle exec rails db:migrate