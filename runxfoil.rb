require 'open3'

def runxfoil(params)
  cmd = '/usr/local/bin/xfoil'
  xfinp = "naca #{params['airf']}\noper\nvisc\n3e6\nalfa\n#{params['alfa']}\ndump\n\nquit\n"
  out = ''
  err = ''

  Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
    stdin.write xfinp
    stdin.close
    out = stdout.readlines
    err = stderr.read
  end

  result_fail = Hash.new
  result_fail['success'] = false;

  result = Hash.new

  cl_line = out.grep(/CL/).last.split(' ')
  result['CL'] = cl_line[5]

  cd_cm_line = out.grep(/CD/).last.split(' ') 
  result['CD'] = cd_cm_line[5]
 
  return result
end
