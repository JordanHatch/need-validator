# Need Validator (aka Validate-o-tron)

This is a small app for aggregating quality scores for each user need in the
GOV.UK Need API.

## Prerequisites

- A PostgreSQL database exists called `need_validator_development`, which is
  accessible by the user `need_validator`.
- You have a CSV of user needs to import. A snapshot from 29-Sep-2014 can be
  found in the `data` directory.

## Quick start

```
bundle install
bin/rake db:setup
bin/rake import[data/needs-29-09-14.csv]
bin/rails s -p 5000
```

## Licence

MIT Licence
