import random
import string
from SeleniumLibrary import SeleniumLibrary

class InputFieldLibrary(SeleniumLibrary):
    
    def input_field_with_random(self, field_name):
        """Inputs a random value into the input field identified by the field name."""
        # Generate a random string of 6 characters
        random_value = ''.join(random.choices(string.ascii_letters + string.digits, k=6))
        text_to_input = f"{field_name}_{random_value}"
        
        # Construct the locator, assuming the input fields are identified by their names
        locator = f"name:{field_name}"
        
        self.wait_until_element_is_visible(locator)
        self.input_text(locator, text_to_input)
        
        return text_to_input
