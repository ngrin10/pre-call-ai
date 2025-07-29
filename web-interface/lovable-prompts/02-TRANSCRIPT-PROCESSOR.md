# Lovable Prompt: Advanced Transcript Processor

## Prompt for Lovable

Build an advanced transcript processing tool that integrates with the ScaleStream dashboard. This should be a dedicated page/modal for processing sales call transcripts.

### Core Features:

1. **Bulk Upload Interface**
   ```
   ┌─────────────────────────────────────┐
   │    📤 Drop transcripts here         │
   │                                     │
   │    Or click to browse               │
   │                                     │
   │    Supports: .txt, .doc, .pdf      │
   └─────────────────────────────────────┘
   ```

2. **Smart Parsing System**
   - Auto-detect transcript format
   - Extract metadata:
     - Date (from filename or content)
     - Participants (Rep name, Prospect name)
     - Duration
     - Outcome (if mentioned)
   - Clean formatting automatically

3. **Metadata Enrichment Panel**
   For each transcript, show form fields:
   - Date picker (pre-filled if detected)
   - Outcome dropdown: Closed Won / Lost / No Show / Rescheduled
   - Deal size input
   - Lead source dropdown
   - Rep name
   - Notes textarea

4. **Batch Organization**
   - Auto-group into batches of 5
   - Visual batch indicator
   - Drag-and-drop to reorganize batches
   - "Process Batch" button for each group

5. **Quality Checks**
   - Minimum word count warning (< 500 words)
   - Missing metadata highlights
   - Duplicate detection
   - Format validation

### UI Components:

```javascript
// Main container
<TranscriptProcessor>
  <UploadZone onDrop={handleFiles} />
  
  <ProcessingQueue>
    {transcripts.map(transcript => (
      <TranscriptCard
        key={transcript.id}
        status={transcript.status}
        metadata={transcript.metadata}
        onEdit={updateMetadata}
      />
    ))}
  </ProcessingQueue>
  
  <BatchView>
    {batches.map((batch, index) => (
      <BatchContainer key={index}>
        <BatchHeader>Batch {index + 1} (5 transcripts)</BatchHeader>
        <BatchTranscripts>{/* ... */}</BatchTranscripts>
        <ProcessButton onClick={() => processBatch(batch)} />
      </BatchContainer>
    ))}
  </BatchView>
</TranscriptProcessor>
```

### Smart Features:

1. **AI-Powered Extraction** (simulate with regex)
   ```javascript
   // Extract date patterns
   const datePattern = /(\d{1,2}[-/]\d{1,2}[-/]\d{2,4})/;
   
   // Extract outcome indicators
   const outcomePatterns = {
     won: /signed|closed|deal|purchased/i,
     lost: /not interested|went with|chose competitor/i,
     noShow: /didn't show|no show|missed/i
   };
   ```

2. **Bulk Actions**
   - Select all/none
   - Bulk assign metadata
   - Bulk delete
   - Export to CSV

3. **Progress Tracking**
   ```javascript
   const progress = {
     total: 20,
     processed: 15,
     ready: 5,
     errors: 0
   };
   ```

### Visual Design:
- Card-based layout for each transcript
- Color coding:
  - Green: Ready to process
  - Yellow: Missing metadata
  - Red: Errors
  - Blue: Processing
- Smooth animations for drag-drop
- Progress bars for upload/processing

### State Management:
```javascript
const transcriptState = {
  uploading: [],
  processing: [],
  ready: [],
  completed: [],
  errors: []
};
```

### Error Handling:
- File too large warning
- Unsupported format message
- Network error retry
- Validation errors inline

### Sample Transcript Format:
```
Date: 2024-01-15
Rep: John Smith
Prospect: Sarah Johnson (Acme Corp)

[Transcript content...]

Outcome: Scheduled follow-up
Next steps: Send proposal
```

Create this as a standalone component that can be integrated into the main ScaleStream dashboard. Include sample transcripts for testing and make all interactions smooth with proper loading states.