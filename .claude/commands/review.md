# Code Review Checklist

Perform comprehensive code review focusing on quality, security, and best practices.

## Review Criteria

### 1. Code Quality
- [ ] Clear and descriptive naming conventions
- [ ] Functions are focused and single-purpose
- [ ] Code is DRY (Don't Repeat Yourself)
- [ ] Appropriate abstraction levels
- [ ] Consistent coding style

### 2. Security
- [ ] No hardcoded secrets or credentials
- [ ] Input validation and sanitization
- [ ] Proper error handling without exposing internals
- [ ] Authentication and authorization checks
- [ ] SQL injection prevention

### 3. Performance
- [ ] Efficient algorithms and data structures
- [ ] No unnecessary loops or computations
- [ ] Proper caching strategies
- [ ] Database query optimization
- [ ] Resource cleanup

### 4. Testing
- [ ] Adequate test coverage
- [ ] Edge cases handled
- [ ] Error conditions tested
- [ ] Integration tests where needed
- [ ] Tests are maintainable

### 5. Documentation
- [ ] Clear function/method documentation
- [ ] Complex logic explained
- [ ] API documentation complete
- [ ] README updated if needed
- [ ] Change log entries added

## Review Process
1. Read through changes systematically
2. Check against criteria above
3. Identify issues and improvements
4. Suggest specific fixes
5. Document review findings

## Output
- Summary of findings
- Categorized issues (critical, major, minor)
- Specific improvement suggestions
- Positive feedback on good practices
- Action items for resolution

Begin code review on the specified changes or files.