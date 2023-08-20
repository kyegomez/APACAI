Swarms event listeners can be used to listen for events during a structure's execution.

You can listen to specific event types: 

```python
from swarms.structures import Agent
from swarms.events import (
    BaseEvent,
    StartTaskEvent,
    FinishTaskEvent,
    StartSubtaskEvent,
    FinishSubtaskEvent,
    StartPromptEvent,
    FinishPromptEvent,
)

def handler(event: BaseEvent):
    print(event)

agent = Agent(
    event_listeners = {
        StartTaskEvent: [handler],
        FinishTaskEvent: [handler],
        StartSubtaskEvent: [handler],
        FinishSubtaskEvent: [handler],
        StartPromptEvent: [handler],
        FinishPromptEvent: [handler],
    }
)

agent.run("tell me about swarms")
```

Or listen to all events with two different handlers:

```python
from swarms.structures import Agent
from swarms.events import BaseEvent


def handler1(event: BaseEvent):
    print(event)


def handler2(event: BaseEvent):
    print(event)


agent = Agent(event_listeners=[handler1, handler2])

agent.run("tell me about swarms")
```