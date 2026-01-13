/// DAY 10: Visibility Modifiers (Public vs Private Functions)
/// 
/// Today you will:
/// 1. Learn about visibility modifiers (public vs private)
/// 2. Design a public API
/// 3. Write a function to complete tasks
///
/// Note: You can copy code from day_09/sources/solution.move if needed

module challenge::day_10 {
    use std::string::String;

    // Copy from day_09: TaskStatus enum and Task struct
    public enum TaskStatus has copy, drop {
        Open,
        Completed,
    }

    public struct Task has copy, drop {
        title: String,
        reward: u64,
        status: TaskStatus,
    }

    public fun new_task(title: String, reward: u64): Task {
        Task {
            title,
            reward,
            status: TaskStatus::Open,
        }
    }

    public fun is_open(task: &Task): bool {
        task.status == TaskStatus::Open
    }

    // Public function to complete a task
    // This is public so users can call it from outside the module
    public fun complete_task(task: &mut Task) {
        task.status = TaskStatus::Completed;
    }

    // Private helper function to validate reward amount
    // This is private (no 'public' keyword) so it can only be called within this module
    fun is_valid_reward_internal(reward: u64): bool {
        reward > 0 && reward <= 1000000
    }

    // Public function that uses the private helper
    // This demonstrates how public functions can call private helpers
    public fun has_valid_reward(task: &Task): bool {
        is_valid_reward_internal(task.reward)
    }
}

