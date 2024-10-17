from confluent_kafka import Consumer, KafkaException 
import subprocess
import json

# Kafka consumer configuration
conf = {
    'bootstrap.servers': '147.139.191.88:9092',
    'group.id': 'my-group',
    'auto.offset.reset': 'earliest'
}

consumer = Consumer(conf)

consumer.subscribe(['master_benchmark'])

def handle_message(message):
    try:

        message_value = message.value().decode('utf-8')

        message_dict = json.loads(message_value)

        if message_dict.get('Description') == 'trigger_master_dashboard':
            print("Trigger received! Running MasterDashboard.robot...")

    except json.JSONDecodeError:
        print("Failed to decode JSON from message:", message_value)
    except Exception as e:
        print(f"An error occurred: {e}")
        
# Start consuming messages
try:
    while True:
        msg = consumer.poll(timeout=1.0)  # Poll for a message

        if msg is None:  # No message available within the timeout
            continue
        if msg.error():
            if msg.error().code() == KafkaError._PARTITION_EOF:
                # End of partition event
                continue
            else:
                raise KafkaException(msg.error())
        
        # Handle the message
        handle_message(msg)

except KeyboardInterrupt:
    pass

finally:
    # Close down consumer
    consumer.close()
