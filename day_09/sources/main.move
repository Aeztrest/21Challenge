/// DAY 9: Enums & TaskStatus
/// 
/// Today you will:
/// 1. Learn about enums
/// 2. Replace bool with an enum
/// 3. Use match expressions

module challenge::day_09 {
    use std::string::String;

    // TaskStatus enum with two variants
    public enum TaskStatus has copy, drop {
        Open,
        Completed,
    }

    // Task struct updated to use TaskStatus instead of done: bool
    public struct Task has copy, drop {
        title: String,
        reward: u64,
        status: TaskStatus,
    }

    // Constructor function to create a new task with Open status
    public fun new_task(title: String, reward: u64): Task {
        Task {
            title,
            reward,
            status: TaskStatus::Open,
        }
    }

    // Function to check if task is open
    public fun is_open(task: &Task): bool {
        task.status == TaskStatus::Open
    }
}

