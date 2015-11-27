#!/usr/bin/env ruby
databases = {
  :big_client => {
    :database => 'dap',
    :username => 'dap',
    :password => 'dap',
  },
  :small_client => {
      :database => 'dap441',
      :username => 'dap',
      :password => 'dap',
  }
}

end_of_iter = ARGV.shift

databases.each do |name,config| if end_of_iter.nil?
  backup_file = config[:database] + '_' + Time.now.strftime('%Y%m%d')
else
  backup_file = config[:database] + '_' + end_of_iter
end

mysqldump = "mysqldump -u#{config[:username]} -p#{config[:password]} " + "#{config[:database]}"

`#{mysqldump} > #{backup_file}.sql`
`gzip #{backup_file}.sql`

end