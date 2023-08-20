The most powerful feature of Swarms is the ability of workflow tasks to generate *chains of thought* (CoT) and use tools that can interact with the outside world. We use the [ReAct](https://arxiv.org/abs/2210.03629) technique to implement CoT reasoning and acting in the underlying LLMs without using any fine-tuning.

Swarms implements the reasoning loop in the `ToolkitTask` and integrates swarms-tools natively.

Here is an example on how to use tools:

```python
from swarms.tools import WebScraper, Calculator
from swarms.memory.structure import ConversationMemory
from swarms.tasks import PromptTask, ToolkitTask
from swarms.structures import Pipeline


scraper = WebScraper()
calculator = Calculator()

pipeline = Pipeline(
    memory=ConversationMemory()
)

pipeline.add_tasks(
    ToolkitTask(
        tools=[calculator, scraper]
    )
)

pipeline.run("what's 5^23?")
```