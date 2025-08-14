/*
  # Default Data for Clinic Queue Management System

  1. Default Departments
    - General Medicine
    - Cardiology
    - Orthopedics
    - Pediatrics

  2. Clinic Settings
    - Basic system configuration
    - Queue management settings
    - Payment settings

  3. Sample Doctor
    - Test doctor for development
*/

-- Insert default departments
INSERT INTO departments (name, display_name, description, consultation_fee, average_consultation_time, color_code, is_active) VALUES
  ('general', 'General Medicine', 'General medical consultation and primary care', 500.00, 15, '#3B82F6', true),
  ('cardiology', 'Cardiology', 'Heart and cardiovascular system specialist', 1000.00, 30, '#EF4444', true),
  ('orthopedics', 'Orthopedics', 'Bone, joint, and muscle specialist', 800.00, 25, '#10B981', true),
  ('pediatrics', 'Pediatrics', 'Child healthcare specialist', 600.00, 20, '#F59E0B', true)
ON CONFLICT (name) DO NOTHING;

-- Insert default clinic settings
INSERT INTO clinic_settings (setting_key, setting_value, setting_type, description) VALUES
  ('clinic_name', '"MediCare Clinic"', 'general', 'Name of the clinic'),
  ('clinic_address', '"123 Healthcare Street, Medical District, City - 123456"', 'general', 'Clinic address'),
  ('clinic_phone', '"+91-9876543210"', 'general', 'Clinic contact number'),
  ('clinic_email', '"info@medicare.com"', 'general', 'Clinic email address'),
  ('working_hours', '{"start": "09:00", "end": "18:00"}', 'general', 'Clinic working hours'),
  ('working_days', '["monday", "tuesday", "wednesday", "thursday", "friday", "saturday"]', 'general', 'Clinic working days'),
  ('queue_refresh_interval', '30', 'queue', 'Queue refresh interval in seconds'),
  ('max_advance_booking_days', '7', 'queue', 'Maximum days in advance for booking'),
  ('default_consultation_time', '15', 'queue', 'Default consultation time in minutes'),
  ('enable_online_payment', 'true', 'payment', 'Enable online payment option'),
  ('payment_gateway', '"razorpay"', 'payment', 'Default payment gateway'),
  ('maintenance_mode', 'false', 'general', 'Enable maintenance mode'),
  ('maintenance_message', '"System is under maintenance. Please try again later."', 'general', 'Maintenance mode message'),
  ('enable_sms_notifications', 'false', 'notification', 'Enable SMS notifications'),
  ('enable_email_notifications', 'false', 'notification', 'Enable email notifications'),
  ('sms_template_booking', '"Your booking is confirmed. Token: {stn}, Department: {department}, Date: {date}. Visit: {clinic_name}"', 'notification', 'SMS template for booking confirmation'),
  ('email_template_booking', '"Your appointment has been booked successfully."', 'notification', 'Email template for booking confirmation')
ON CONFLICT (setting_key) DO NOTHING;

-- Insert sample doctor for testing
INSERT INTO doctors (name, specialization, qualification, experience_years, consultation_fee, available_days, available_hours, max_patients_per_day, status) VALUES
  ('Dr. John Smith', 'General Medicine', 'MBBS, MD', 10, 500.00, ARRAY['monday', 'tuesday', 'wednesday', 'thursday', 'friday'], '{"start": "09:00", "end": "17:00"}', 50, 'active'),
  ('Dr. Sarah Johnson', 'Cardiology', 'MBBS, MD, DM Cardiology', 15, 1000.00, ARRAY['monday', 'wednesday', 'friday'], '{"start": "10:00", "end": "16:00"}', 30, 'active'),
  ('Dr. Michael Brown', 'Orthopedics', 'MBBS, MS Orthopedics', 12, 800.00, ARRAY['tuesday', 'thursday', 'saturday'], '{"start": "09:00", "end": "15:00"}', 40, 'active'),
  ('Dr. Emily Davis', 'Pediatrics', 'MBBS, MD Pediatrics', 8, 600.00, ARRAY['monday', 'tuesday', 'wednesday', 'thursday', 'friday'], '{"start": "08:00", "end": "14:00"}', 60, 'active')
ON CONFLICT DO NOTHING;