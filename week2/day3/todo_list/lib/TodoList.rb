class Task
    attr_reader :content, :id,  :created_at
    attr_accessor :status
    @@current_id = 1
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @status = "Incomplete"
        @created_at = Time.new
    end

    def complete?
      if   @status ==  "Incomplete"
        return false
      end
      if @status == "Complete"
        return true
      end
    end

    def complete!

      if   @status ==  "Incomplete"
        @status = "Complete"
      elsif @status == "Complete"
        @status = "Incomplete"
      end
      @status
    end

    def uptate!(new_content)
      @created_at = Time.new
      @content = new_content
      return @content
    end

end

class TodoList
    attr_reader :tasks
    def initialize
        @tasks = []
    end

    def add(task)
      @tasks.push(task)
      return @tasks
    end

    def delete(id_task)
      @tasks.delete_if { | task_id_array| task_id_array.id == id_task }
      @tasks
    end
    def find_task_by_id(id_task)
      @tasks.find {|x| x.id == id_task }
    end
    def sort_by_created
      @tasks.sort { | task1, task2 | task2.created_at <=> task1.created_at }
    end

end
