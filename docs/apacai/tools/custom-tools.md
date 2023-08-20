# Custom Tools

Building your own tools is easy with Swarms!

To start, create a directory for your tool inside your project. All tool directories should have the following components:

* `manifest.yml` with a YAML manifest.
* `tool.py` file with a tool Python class.
* `requirements.txt` file with tool Python dependencies.

Let's build a simple random number generator tool! First, create a new directory for your tool `rng_tool`. This is where all tool files will go.

## Tool Manifest

Tool YAML manifests are for humans and downstream systems, like ChatGPT Plugins, to generate manifests of their own. Create a `manifest.yml` file in the `rng_tool` directory:

```yaml
version: "v1"
name: Random Number Generator
description: Tool for generating random numbers.
contact_email: hello@swarms.ai
legal_info_url: https://www.swarms.ai/legal
```

## Tool Dependencies

To add Python dependencies for your tool, add a `requirements.txt` file. The tool we are building is pretty simple, so you can leave that file empty.

## Tool Implementation

Next, create a `tool.py` file with the following code:

```python
import random
from swarms.artifacts import TextArtifact
from swarms.core import BaseTool
from swarms.core.decorators import activity
from schema import Schema, Literal, Optional


class RandomNumberGenerator(BaseTool):
    @activity(config={
            "description": "Can be used to generate random numbers",
            "schema": Schema({
                Optional(Literal(
                    "decimals",
                    description="Number of decimals to round the random number to"
                )): int
            })
        })
    def generate(self, params: dict) -> TextArtifact:
        return TextArtifact(
            str(round(random.random(), params["values"].get("decimals")))
        )
```

## Testing Custom Tools

Finally, let's test our tool:

```python
from swarms.structures import Agent
from rng_tool.tool import RandomNumberGenerator

rng_tool = RandomNumberGenerator()

agent = Agent(
    tools=[rng_tool]
)

print(
    agent.run(
        "generate a random number rounded to 5 decimal places"
    ).output.value
)

```

That's it! You can start using this tool with any converter or directly via Swarms.

Check out other [Swarms tools](https://github.com/swarms-ai/swarms-tools/tree/main/swarms/tools) to learn more about tool implementation details.