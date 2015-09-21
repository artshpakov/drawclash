require 'segment/analytics'

Analytics = Segment::Analytics.new({
  write_key: '4Pi2Cy2MtoaH89pjvqgibjwv0JVhRFa3',
  on_error: Proc.new { |status, msg| print msg }
})
