-- SQLite schema proposal for the voluntary blood donation management system.
-- Review docs/database-design.md and resolve its open issues before production use.
PRAGMA foreign_keys = ON;

CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    role TEXT NOT NULL CHECK (role IN ('admin', 'coordinator', 'volunteer')),
    created_at TEXT NOT NULL
);

CREATE INDEX idx_users_role ON users(role);

CREATE TABLE blood_groups (
    blood_group_id INTEGER PRIMARY KEY,
    abo_type TEXT NOT NULL CHECK (abo_type IN ('A', 'B', 'AB', 'O')),
    rh_factor TEXT NOT NULL CHECK (rh_factor IN ('+', '-')),
    UNIQUE (abo_type, rh_factor)
);

INSERT INTO blood_groups (abo_type, rh_factor) VALUES
    ('A', '+'), ('A', '-'),
    ('B', '+'), ('B', '-'),
    ('AB', '+'), ('AB', '-'),
    ('O', '+'), ('O', '-');

CREATE TABLE donors (
    donor_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL UNIQUE,
    full_name TEXT NOT NULL,
    contact_email TEXT,
    contact_phone TEXT,
    blood_group_id INTEGER,
    created_at TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (blood_group_id) REFERENCES blood_groups(blood_group_id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE INDEX idx_donors_blood_group_id ON donors(blood_group_id);

CREATE TABLE campaigns (
    campaign_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    starts_at TEXT NOT NULL,
    ends_at TEXT NOT NULL,
    created_at TEXT NOT NULL,
    CHECK (ends_at > starts_at)
);

CREATE INDEX idx_campaigns_starts_at ON campaigns(starts_at);

CREATE TABLE donation_points (
    donation_point_id INTEGER PRIMARY KEY,
    campaign_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE INDEX idx_donation_points_campaign_id ON donation_points(campaign_id);

CREATE TABLE time_slots (
    time_slot_id INTEGER PRIMARY KEY,
    donation_point_id INTEGER NOT NULL,
    starts_at TEXT NOT NULL,
    ends_at TEXT NOT NULL,
    capacity INTEGER NOT NULL CHECK (capacity > 0),
    CHECK (ends_at > starts_at),
    FOREIGN KEY (donation_point_id) REFERENCES donation_points(donation_point_id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE INDEX idx_time_slots_point_start ON time_slots(donation_point_id, starts_at);

CREATE TABLE registrations (
    registration_id INTEGER PRIMARY KEY,
    donor_id INTEGER NOT NULL,
    time_slot_id INTEGER NOT NULL,
    status TEXT NOT NULL CHECK (length(trim(status)) > 0),
    registered_at TEXT NOT NULL,
    FOREIGN KEY (donor_id) REFERENCES donors(donor_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (time_slot_id) REFERENCES time_slots(time_slot_id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE INDEX idx_registrations_donor_id ON registrations(donor_id);
CREATE INDEX idx_registrations_slot_status ON registrations(time_slot_id, status);

CREATE TABLE notifications (
    notification_id INTEGER PRIMARY KEY,
    donor_id INTEGER NOT NULL,
    campaign_id INTEGER NOT NULL,
    notification_type TEXT NOT NULL CHECK (notification_type IN ('invitation', 'reminder')),
    content TEXT NOT NULL,
    created_at TEXT NOT NULL,
    FOREIGN KEY (donor_id) REFERENCES donors(donor_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE INDEX idx_notifications_donor_id ON notifications(donor_id);
CREATE INDEX idx_notifications_campaign_id ON notifications(campaign_id);

CREATE TABLE approved_documents (
    document_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    document_path TEXT NOT NULL,
    is_approved INTEGER NOT NULL CHECK (is_approved IN (0, 1)),
    created_at TEXT NOT NULL
);

CREATE INDEX idx_approved_documents_status ON approved_documents(is_approved);
