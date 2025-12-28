CREATE TABLE IF NOT EXISTS profiles (
  id       SERIAL PRIMARY KEY,

  name     TEXT NOT NULL,
  image    TEXT
);

CREATE TABLE IF NOT EXISTS users (
  id                  VARCHAR(64) PRIMARY KEY,
  password            VARCHAR(32) NOT NULL,

  created_at          TIMESTAMP DEFAULT now() NOT NULL,
  banned_until        TIMESTAMP,

  profile_id          INTEGER,
  CONSTRAINT profile  FOREIGN KEY (profile_id) REFERENCES profiles
);

CREATE TABLE IF NOT EXISTS sessions (
  id               SERIAL PRIMARY KEY,
  token            TEXT NOT NULL,
  expiry           TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS team (
  id              SERIAL PRIMARY KEY,

  member_names    VARCHAR(64) ARRAY,
  CONSTRAINT members FOREIGN KEY (member_names) REFERENCES members,

  profile_id      INTEGER,
  CONSTRAINT profile FOREIGN KEY (profile_id) REFERENCES profiles
);

-- Events
-- Teams
-- Challenges (Describe the Challenges)
-- Hints
-- Participations (Instance of the Team in the Challenge)
-- Containers (Actual instances of the Challenges)
-- Notifications (Persistent)
-- Messages (Chatroom)
-- Files (Attachments, Containerfiles...)
-- Reports (Bugs, Feature Requests...)

