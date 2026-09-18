INSERT INTO technologies (name, description)
VALUES
    ('AWS', 'Amazon Web Services'),
    ('GCP', 'Google Cloud Platform'),
    ('Azure', 'Microsoft Azure'),
    ('Kubernetes', 'Container orchestration'),
    ('Docker', 'Containerization platform'),
    ('Terraform', 'Infrastructure as Code')
ON CONFLICT (name) DO NOTHING;


INSERT INTO categories (technology_id, name, description)
SELECT id, 'EC2', 'Elastic Compute Cloud'
FROM technologies
WHERE name = 'AWS'
ON CONFLICT DO NOTHING;

INSERT INTO categories (technology_id, name, description)
SELECT id, 'VPC', 'AWS networking'
FROM technologies
WHERE name = 'AWS'
ON CONFLICT DO NOTHING;

INSERT INTO categories (technology_id, name, description)
SELECT id, 'GKE', 'Google Kubernetes Engine'
FROM technologies
WHERE name = 'GCP'
ON CONFLICT DO NOTHING;

INSERT INTO categories (technology_id, name, description)
SELECT id, 'VPC Network', 'Google Cloud networking'
FROM technologies
WHERE name = 'GCP'
ON CONFLICT DO NOTHING;


INSERT INTO questions
    (category_id, question, answer, explanation, difficulty)
SELECT
    c.id,
    'What is an EC2 instance?',
    'An EC2 instance is a virtual server provided by AWS.',
    'EC2 provides resizable compute capacity in AWS.',
    'easy'
FROM categories c
JOIN technologies t
    ON c.technology_id = t.id
WHERE t.name = 'AWS'
AND c.name = 'EC2'
LIMIT 1;


INSERT INTO questions
    (category_id, question, answer, explanation, difficulty)
SELECT
    c.id,
    'What is a VPC?',
    'A VPC is an isolated virtual network in AWS.',
    'It provides control over IP ranges, subnets, routing and network security.',
    'easy'
FROM categories c
JOIN technologies t
    ON c.technology_id = t.id
WHERE t.name = 'AWS'
AND c.name = 'VPC'
LIMIT 1;
