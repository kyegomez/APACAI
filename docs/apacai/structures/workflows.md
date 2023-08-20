# Workflows

Workflows are non-sequential DAGs that can be used for complex concurrent scenarios with tasks having multiple inputs.

Tasks in the workflow have access to the following `context` variables:

* `args`: arguments passed to the `Construct.run()` method.
* `inputs`: inputs into the current task referencable by parent task IDs.
* `structure`: the structure that the task belongs to.
* `parents`: parent tasks referencable by IDs.
* `children`: child tasks referencable by IDs.

Let's build a simple workflow. Let's say, we want to write a story in a fantasy world with some unique characters. We could setup a workflow that generates a world based on some keywords. Then we pass the world description to any number of child tasks that create characters. Finally, the last task pulls in information from all parent tasks and writes up a short story.

```python
def character_task(task_id, character_name) -> PromptTask:
    return PromptTask(
        "Based on the following world description create a character named {{ name }}:\n{{ inputs['world'] }}",
        context={
            "name": character_name
        },
        id=task_id
    )

world_task = PromptTask(
    "Create a fictional world based on the following key words {{ keywords|join(', ') }}",
    context={
        "keywords": ["fantasy", "ocean", "tidal lock"]
    },
    id="world"
)

character_task_1 = character_task("scotty", "Scotty")
character_task_2 = character_task("annie", "Annie")

story_task = PromptTask(
    "Based on the following description of the world and characters, write a short story:\n{{ inputs['world'] }}\n{{ inputs['scotty'] }}\n{{ inputs['annie'] }}",
    id="story"
)

workflow = Workflow()

workflow.add_task(world_task)

world_task.add_child(character_task_1)
world_task.add_child(character_task_2)
world_task.add_child(story_task)

character_task_1.add_child(story_task)
character_task_2.add_child(story_task)

workflow.run()

[print(task.output.value) for task in workflow.output_tasks()]
```

And here is the beginning of our generated story:

> Scotty and Annie had been friends since childhood, and their bond had only grown stronger over the years. Scotty had always been fascinated by the ocean and its secrets, and Annie had always been drawn to its magical creatures. [...]