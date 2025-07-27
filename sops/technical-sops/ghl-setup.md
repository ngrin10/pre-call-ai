# 🔧 GoHighLevel Setup for V3.0 System

## Overview
Complete guide for setting up GoHighLevel to deploy the V3.0 SCALESTREAM PRE-CALL SYSTEM™ with awareness-based automation.

---

## 🚀 Initial Setup (30 minutes)

### **Step 1: Create Sub-Account**
```
1. Log into Agency Account
2. Settings → Sub-Accounts → Add Sub-Account
3. Name: "[Client Name] Pre-Call System"
4. Clone from: "V3.0 ScaleStream Template" (if available)
5. Set timezone to client's location
```

### **Step 2: Configure Company Settings**
```
Settings → Business Profile:
- Business Name: [Client Business]
- Support Email: [Client support email]
- Default From Name: [Client or founder name]
- Logo: Upload client logo
- Timezone: Verify correct
```

### **Step 3: Domain & Email Setup**
```
Settings → Domains:
1. Add domain: go.[clientdomain].com
2. Add DNS records (in this order):
   - A Record: 3.21.91.239
   - CNAME: tracking → go.myclickfunnels.com
   - SPF: v=spf1 include:msgsndr.com ~all
   - DKIM: [Get from GHL settings]
   - DMARC: v=DMARC1; p=none;

3. Verify domain (use whatsmydns.net)
4. Configure email sending domain
5. Set up email warmup if new domain
```

---

## 📊 Custom Fields Setup (Critical!)

### **Create These Custom Fields FIRST**
```
Settings → Custom Fields → Contact Fields:

📁 Application Data
├── first_name (Text)
├── last_name (Text)
├── email (Email)
├── phone (Phone)
├── company_name (Text) [B2B only]
├── industry (Dropdown) [B2B only]
└── application_date (Date)

📁 Awareness Segmentation ⭐
├── awareness_level (Dropdown) REQUIRED
│   - Problem Aware
│   - Solution Aware
│   - Product Aware
├── awareness_score (Number 1-10)
├── segment_name (Text)
└── spectrum_position (Dropdown)
    - Curious
    - General Interest
    - Serious to Buy
    - Convicted

📁 Booking Information
├── event_start_time (Date/Time)
├── appointment_time (Text)
├── time_zone (Text)
├── calendar_link (URL)
├── reschedule_link (URL)
└── booking_source (Text)

📁 Engagement Tracking
├── email_engagement_score (Number)
├── sms_response_count (Number)
├── content_consumed (Multi-select)
├── last_engagement_date (Date)
└── show_probability (Percentage)
```

---

## 🔄 Core Workflows to Build

### **1. New Lead Router (Master Workflow)**
```
TRIGGER: Form Submission OR Tag Applied
├── ACTION: Calculate Awareness Level
│   └── Custom Code: Awareness scoring algorithm
├── IF/ELSE: Route by Awareness
│   ├── IF Problem Aware → Go to Sub-Workflow A
│   ├── IF Solution Aware → Go to Sub-Workflow B
│   └── IF Product Aware → Go to Sub-Workflow C
└── ACTION: Internal Notification
```

### **2. Problem Aware Nurture (Sub-Workflow A)**
```
TRIGGER: Custom Field "awareness_level" = Problem Aware
├── ACTION: Add Tag "Problem Aware"
├── ACTION: Send Email Sequence (5-7 emails)
│   ├── Email 1: Education about hidden costs
│   ├── Email 2: Opportunity introduction
│   ├── Email 3: Social proof stories
│   ├── Email 4: Objection prevention
│   └── Email 5-7: Soft engagement
├── ACTION: SMS Sequence (conversational)
├── ACTION: Wait for booking
└── IF BOOKED: Move to appointment workflow
```

### **3. Solution Aware Nurture (Sub-Workflow B)**
```
TRIGGER: Custom Field "awareness_level" = Solution Aware
├── ACTION: Add Tag "Solution Aware"
├── ACTION: Send Email Sequence (3-5 emails)
│   ├── Email 1: Differentiation focus
│   ├── Email 2: Methodology explanation
│   ├── Email 3: Proof and case studies
│   └── Email 4-5: Direct invitation
├── ACTION: SMS Sequence (value-focused)
└── IF BOOKED: Move to appointment workflow
```

### **4. Product Aware Nurture (Sub-Workflow C)**
```
TRIGGER: Custom Field "awareness_level" = Product Aware
├── ACTION: Add Tag "Product Aware"
├── ACTION: Send Email Sequence (2-3 emails)
│   ├── Email 1: Competitive advantage
│   ├── Email 2: Urgency + Risk reversal
│   └── Email 3: Direct CTA
├── ACTION: SMS Sequence (urgency-focused)
└── IF BOOKED: Move to appointment workflow
```

### **5. Appointment Reminder Workflow**
```
TRIGGER: Tag "Appointment Booked"
├── ACTION: Remove from all nurture workflows
├── ACTION: Send confirmation email
├── ACTION: Schedule reminders
│   ├── 24 hours before
│   ├── Morning of
│   └── 2 hours before
└── ACTION: Update show probability score
```

---

## 📧 Email & SMS Templates

### **Email Template Structure**
```
Settings → Marketing → Email Templates

Create folders:
├── /Problem Aware Emails (5-7)
├── /Solution Aware Emails (3-5)
├── /Product Aware Emails (2-3)
├── /Universal Reminders (4)
└── /No-Show Recovery (3)

Template requirements:
- Use {{contact.first_name}} personalization
- Include awareness-specific language
- Add tracking links
- Mobile-responsive design
```

### **SMS Template Best Practices**
```
Settings → Marketing → SMS Templates

Requirements:
- Under 160 characters
- Natural typos for authenticity
- Questions to encourage replies
- {{contact.first_name}} personalization
- Awareness-appropriate tone
```

---

## 🎯 Pipeline Configuration

### **Sales Pipeline Setup**
```
Settings → Pipelines → Sales Pipeline

Stages:
1. New Lead (Unqualified)
2. Awareness Identified
3. Nurture Active
4. Appointment Booked
5. Showed Up
6. No Show
7. Closed Won
8. Closed Lost

Automation:
- Auto-move based on tags
- Track time in each stage
- Calculate conversion rates
```

---

## 📊 Tracking & Analytics

### **UTM Parameter Setup**
```
All links should include:
?utm_source=ghl
&utm_medium=email OR sms
&utm_campaign=awareness_level
&utm_content=email_number

Example:
https://client.com/book?utm_source=ghl&utm_medium=email&utm_campaign=problem_aware&utm_content=email_3
```

### **Conversion Tracking**
```
Settings → Tracking → Conversion Events

Set up events:
- Form Submission
- Appointment Booked
- Email Opened
- Link Clicked
- SMS Reply
- Show Up Confirmed
```

---

## 🔌 Essential Integrations

### **Calendly Integration (via Zapier)**
```
Trigger: New Calendly Booking
Actions:
1. Find/Create Contact in GHL
2. Update Custom Fields:
   - event_start_time
   - calendar_link
   - booking_source
3. Add Tag "Appointment Booked"
4. Trigger appointment workflow
```

### **Form Integration (Direct or Zapier)**
```
For each form/survey platform:
1. Map all form fields to custom fields
2. Include awareness questions
3. Trigger new lead workflow
4. Ensure no duplicates (match by email)
```

---

## ✅ Testing Checklist

### **Before Going Live**
- [ ] All custom fields created and tested
- [ ] Workflows trigger correctly
- [ ] Emails render properly on mobile
- [ ] SMS delivers without errors
- [ ] Tracking codes work
- [ ] Pipeline automation functions
- [ ] Team notifications fire
- [ ] Calendar integration confirmed

### **Test Scenarios**
1. **Problem Aware Journey**: Form → Nurture → Book → Show
2. **Solution Aware Journey**: Different form → Different nurture → Book
3. **Product Aware Journey**: Fast track → Book quickly
4. **No-Show Recovery**: Mark no-show → Recovery sequence

---

## 🚨 Common Issues & Solutions

### **Emails Going to Spam**
- Warm up domain properly (2 weeks minimum)
- Avoid spam trigger words
- Include unsubscribe link
- Authenticate domain (SPF, DKIM, DMARC)

### **Workflows Not Triggering**
- Check custom field values are set
- Verify trigger conditions
- Look for conflicting workflows
- Test with single contact first

### **Calendar Sync Issues**
- Verify Zapier connection
- Check field mapping
- Ensure no duplicate prevention blocking
- Test with different email

---

## 📈 Optimization Tips

1. **A/B Test by Awareness Level**: Different subject lines for each segment
2. **Monitor Engagement**: Adjust send times based on opens
3. **Track Spectrum Movement**: See which content moves people up levels
4. **Refine Scoring**: Improve awareness identification over time
5. **Personalize Further**: Use more custom fields in content

---

*This setup ensures your GHL instance is optimized for the V3.0 awareness spectrum methodology and delivers personalized journeys that systematically move prospects toward conviction.*
