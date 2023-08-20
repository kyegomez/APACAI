# Agents

Agents are similar to pipelines, but they can only run one task at a time. They take in `tools` and `prompt_template` directly, which the agent uses to dynamically determine whether to use `PromptTask` or `ToolkitTask`.

Tasks in the workflow have access to the following `context` variables:

* `args`: arguments passed to the `Construct.run()` method.
* `structure`: the structure that the task belongs to.

Using agents is similar to pipelines:

```python
from swarms.tools import Calculator
from swarms.structures import Agent


agent = Agent(
    tools=[Calculator()]
)

agent.run("what's 123^312?")
```
