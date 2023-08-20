Summary engines are used to summarize text and collections of `TextArtifact`s.

## PromptSummaryEngine

Used to summarize texts with LLMs. You can set a custom `prompt_driver`, `template_generator`, and `chunker`.

Use the `summarize_artifacts` method to summarize a list of artifacts or `summarize_text` to summarize an arbitrary string.

```python
import io
import requests
from swarms.engines import PromptSummaryEngine
from swarms.loaders import PdfLoader

response = requests.get("https://arxiv.org/pdf/1706.03762.pdf")
engine = PromptSummaryEngine()

artifacts = PdfLoader().load(
    io.BytesIO(response.content)
)

text = "\n\n".join([a.value for a in artifacts])

print(
    engine.summarize_text(text)
)

```