# Lovable Prompt: ScaleStream MVP Dashboard

## Prompt for Lovable

I need to build a SaaS dashboard for ScaleStream, a platform that analyzes sales transcripts and generates personalized pre-call nurture sequences. 

### Core Features Needed:

1. **Client Dashboard**
   - Grid view of client cards showing:
     - Client name and industry
     - Current vs target show rate (with improvement %)
     - Status: Collecting Data / Analyzing / Content Ready / Live
     - Last activity timestamp
   - Add new client button (top right)
   - Search/filter by industry or status

2. **Client Detail Page** (when clicking a client card)
   - Overview metrics at top
   - Tabs for:
     - Transcripts (with bulk upload)
     - Analysis Results (awareness segments pie chart)
     - Generated Content (email sequences by awareness level)
     - Performance Tracking (show rate over time graph)

3. **Transcript Processor**
   - Drag-and-drop file upload area
   - Table showing uploaded transcripts with:
     - File name
     - Date
     - Outcome (closed/lost/no-show)
     - Status (processing/ready)
   - "Process Batch" button when 5+ transcripts ready

4. **Content Viewer**
   - Three columns for Problem/Solution/Product Aware
   - Email sequence in each column
   - Edit capability with version history
   - "Deploy to CRM" button

### Design Requirements:
- Clean, modern SaaS design
- Dark mode toggle
- Mobile responsive
- Use Tailwind CSS
- Subtle animations on interactions
- Professional color scheme (blues, grays)

### Data Structure:
```javascript
const client = {
  id: 'uuid',
  name: 'Acme Corp',
  industry: 'SaaS',
  currentShowRate: 0.12,
  targetShowRate: 0.25,
  status: 'analyzing', // collecting_data, analyzing, content_ready, live
  lastActivity: '2024-01-15T10:30:00Z',
  transcriptCount: 15,
  awarenessDistribution: {
    problem: 45,
    solution: 35,
    product: 20
  }
}
```

### Interactive Elements:
- Click client card → Navigate to detail page
- Upload files → Show progress bar
- Click "Analyze" → Show loading state with progress
- Edit content → Inline editing with save button
- View performance → Interactive chart with hover details

Please create this as a fully functional React app with:
- React Router for navigation
- Context API for state management
- Simulated API calls with loading states
- Sample data for 5 clients
- Proper error handling
- Toast notifications for actions

Make it production-ready with proper component structure and clean code.