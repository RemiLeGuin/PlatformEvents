trigger ContactEmailRollback on Contact (before update) {
    if (!System.isQueueable()) {
        System.enqueueJob(new QueueableProcess(Trigger.new, Trigger.oldMap, System.UserInfo.getUserId()));
    }
}