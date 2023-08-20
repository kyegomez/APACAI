Chunkers are used to split arbitrarily long text into chunks of certain token length. Each chunker has a tokenizer, a max token count, and a list of default separators used to split up text into `TextArtifact`s. Different types of chunkers provide lists of separators for specific text shapes:

* `TextChunker` works on most texts.
* `PdfChunker` works on text from PDF docs.
* `MarkdownChunker` works on markdown text.

Here is how to use a chunker:

```python
TextChunker(
    # set an optional custom tokenizer 
    tokenizer=TiktokenTokenizer(),
    # optionally modify default number of tokens
    max_tokens=100
).chunk("long text")
```