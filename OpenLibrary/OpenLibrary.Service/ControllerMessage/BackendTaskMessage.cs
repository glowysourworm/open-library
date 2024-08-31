using System.Collections.Generic;
using System.Linq;

namespace OpenLibrary.Service.ControllerMessage
{
    public abstract class BackendTaskMessage : BackendMessage
    {
        public int TaskId { get; }
        public BackendTaskType TaskType { get; }
        public BackendTaskStatus TaskStatus { get; private set; }
        public BackendTaskEventMessage[] TaskEvents { get; private set; }

        public BackendTaskMessage(int taskId, 
                                  BackendTaskType taskType, 
                                  BackendTaskStatus taskStatus, 
                                  IEnumerable<BackendTaskEventMessage> taskEvents) 
            : base()
        {
            this.TaskId = taskId;
            this.TaskType = taskType;
            this.TaskStatus = taskStatus;
            this.TaskEvents = taskEvents.ToArray();
        }

        public void Update(BackendTaskStatus taskStatus,
                           IEnumerable<BackendTaskEventMessage> taskEvents)
        {
            this.TaskStatus = taskStatus;
            this.TaskEvents = taskEvents.ToArray();
        }
    }
}
