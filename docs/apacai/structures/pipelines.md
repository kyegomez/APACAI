# Pipelines

Pipelines are lists of tasks that are executed sequentially. Pipelines can have `Memory`, which makes them ideal for storing LLM conversations.

Here is an example of a pipeline:

```python
from swarms.memory.structure import ConversationMemory
from swarms.tasks import PromptTask
from swarms.structures import Pipeline


pipeline = Pipeline(
    memory=ConversationMemory()
)

pipeline.add_tasks(
    # take the first argument from the pipeline `run` method
    PromptTask("{{ args[0] }}"),
    # take the input from the previous task and insert it into the prompt
    PromptTask("Say the following like a pirate: {{ input }}")
)

pipeline.run("I am Scotty, who are you?")
pipeline.run("Who am I?")
```

Boom! Our first conversation, à la ChatGPT, is here:

> Q: I am Scotty, who are you?  
> A: Arrr, I be an AI language model designed to assist and answer yer questions, matey!  
> Q: Who am I?  
> A: Yarrr, ye just introduced yerself as Scotty, so ye be Scotty, matey!

## Prompt Context

You can dynamically pass arguments to the prompt by using Jinja templates:

```python
PromptTask(
    "tell me about {{ topic }}",
    context={"topic": "the lord of the rings"}
)
```

In addition to user-defined fields, the `context` object contains the following:

In `Pipeline` structures:

* `args`: arguments passed to the `Construct.run()` method.
* `input`: input from the parent.
* `structure`: the structure that the task belongs to.
* `parent`: parent task.
* `child`: child task.

## Prompt Drivers

Swarms uses OpenAI's `gpt-4` model by default. If you want to use a different model, set a custom OpenAI prompt driver:

```python
Pipeline(
    prompt_driver=OpenAiPromptDriver(
        model="gpt-3.5-turbo"
    )
)
```