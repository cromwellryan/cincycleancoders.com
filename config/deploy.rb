default_run_options[:pty] = true

set :ssh_options, {:forward_agent => true}

set :user, 'cincycleancode'
set :domain, 'cincycleancoders.com'
set :application, 'cincycleancoders'

set :repository,  "git@github.com:cromwellryan/cincycleancoders.com.git"
set :deploy_to, "~/webapps/#{application}"
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
set :use_sudo, false

server domain, :app, :web
role :db, domain, :primary => true

after :deploy, "webby:deploy"

namespace :webby do  
  desc "Generate the webby site"  
  task :deploy do  
    run(". .bashrc")
    run("cd #{deploy_to}/current && webby")
  end
end
