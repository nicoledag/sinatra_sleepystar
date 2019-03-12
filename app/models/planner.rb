class Planner < ActiveRecord::Base

  belongs_to :baby

  #refers to as single terms.
  #planner.babies


      @nap_start_julie = "10:00am"
    #  "9am", "10:30am", 12:00pm

        @nap_end_julie = "12:00pm"
    #  "9am", "10:30am", 12:00pm


      def start_time_hour
      if @nap_start_julie.include?(":") && @nap_start_julie.include?("pm")
         hour = @nap_start_julie.split(":")
         new_hour = hour[0].to_f
         cal_hour = new_hour + 12
         elsif
         @nap_start_julie.include?(":") && @nap_start_julie.include?("am")
         hour = @nap_start_julie.split(":")
         new_hour = hour[0].to_f

      else
          if @nap_start_julie.include?("am")
            hour = @nap_start_julie.chomp("am")
            f_hour = hour.to_f
          elsif @nap_start_julie.include?("pm")
            hour = @nap_start_julie.chomp("pm")
            new_hour = hour.to_f
            cal_hour = new_hour + 12
          end
      end

      end



      def start_time_minutes
        if @nap_start_julie.include?(":")
          minute = @nap_start_julie.split(":")
            if minute.include?("am")
              minute = minute[1].chomp("am")
              new_min = minute.to_f
            else minute.include?("pm")
              minute = minute[1].chomp("pm")
              new_min = minute.to_f
            end

        else
              minute = 0.0
        end

      end



  def end_time_hour
      if @nap_end_julie.include?(":") && @nap_end_julie.include?("pm")
         hour = @nap_end_julie.split(":")
         new_hour = hour[0].to_f
         cal_hour = new_hour + 12
         elsif
         @nap_end_julie.include?(":") && @nap_end_julie.include?("am")
         hour = @nap_end_julie.split(":")
         new_hour = hour[0].to_f

      else
          if @nap_end_julie.include?("am")
            hour = @nap_end_julie.chomp("am")
            f_hour = hour.to_f
          elsif @nap_end_julie.include?("pm")
            hour = @nap_end_julie.chomp("pm")
            new_hour = hour.to_f
            cal_hour = new_hour + 12
          end
      end

      end


      def end_time_minutes

        if @nap_end_julie.include?(":")
          minute = @nap_end_julie.split(":")
            if minute.include?("am")
              minute = minute[1].chomp("am")
              new_min = minute.to_f
            else minute.include?("pm")
              minute = minute[1].chomp("pm")
              new_min = minute.to_f
            end

        else
              minute = 0.0
        end

      end


    def time_difference

  puts "#{@nap_start_julie}"
  puts "#{@nap_end_julie}"


    puts "Start Time Hour: #{start_time_hour}"
    puts "Start Time Minutes: #{start_time_minutes}"
    puts "End Time Hour: #{end_time_hour}"
    puts "End Time Minutes: #{end_time_minutes}"


      if start_time_hour == 24 && start_time_minutes > end_time_minutes

        cal_end_time_minutes = end_time_minutes + 60
        minutes = cal_end_time_minutes - start_time_minutes

        new_hour = end_time_hour - 13


      elsif end_time_hour == 24 && start_time_minutes > end_time_minutes

        cal_end_time_minutes = end_time_minutes + 60
        minutes = cal_end_time_minutes - start_time_minutes

        new_end_time_hour = end_time_hour - 13

        new_hour = new_end_time_hour - start_time_hour

        elsif end_time_hour != 24 && start_time_minutes > end_time_minutes
        cal_end_time_minutes = end_time_minutes + 60
        minutes = cal_end_time_minutes - start_time_minutes
        new_end_time_hour = end_time_hour - 1

        new_hour = new_end_time_hour - start_time_hour

        elsif start_time_hour != 24 && start_time_minutes < end_time_minutes
        new_hour = end_time_hour - start_time_hour
        minutes = end_time_minutes - start_time_minutes

        elsif start_time_hour == 24 && start_time_minutes < end_time_minutes
          new_start_hour = start_time_hour - 12
          new_hour = end_time_hour - new_start_hour

          minutes = end_time_minutes - start_time_minutes

        elsif start_time_hour != 24 && start_time_minutes == end_time_minutes && end_time_hour != 24
          new_hour = end_time_hour - start_time_hour
          minutes = 0

        elsif start_time_hour == 24 && start_time_minutes == end_time_minutes
          new_start_hour = start_time_hour - 12
          new_hour = end_time_hour - new_start_hour
          minutes = 0

          else end_time_hour == 24 && start_time_minutes == end_time_minutes
          new_end_hour = end_time_hour - 12
          new_hour = new_end_hour - start_time_hour
          minutes = 0
        end



        puts "#{new_hour}"
        puts "#{minutes}"



    end


end
