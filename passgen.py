#!/usr/bin/env python3
import random
import string
import argparse
from urllib.parse import quote

def generate_password(length=None, use_uppercase=True, use_numbers=True, use_special=True):
    """
    Generate a strong password with specified criteria
    """
    # Initialize character sets
    if not length:
        length = random.randint(10, 14)
    lowercase = string.ascii_lowercase
    uppercase = string.ascii_uppercase if use_uppercase else ''
    numbers = string.digits if use_numbers else ''
    special_chars = '!@#$%^&*()_+-=[]{}|;:,.<>?' if use_special else ''
    
    # Combine all allowed character sets
    all_chars = lowercase + uppercase + numbers + special_chars
    
    # Ensure minimum length
    if length < 8:
        length = 8
    
    # Generate password
    password = []
    
    # Ensure at least one character from each enabled set
    if use_uppercase:
        password.append(random.choice(uppercase))
    password.append(random.choice(lowercase))
    if use_numbers:
        password.append(random.choice(numbers))
    if use_special:
        password.append(random.choice(special_chars))
    
    # Fill the rest with random characters
    while len(password) < length:
        password.append(random.choice(all_chars))
    
    # Shuffle the password
    random.shuffle(password)
    
    return ''.join(password)

def main():
    parser = argparse.ArgumentParser(description='Generate a strong password')
    parser.add_argument('-l', '--length', type=int, default=None,
                      help='Length of the password (default: 16)')
    parser.add_argument('--no-uppercase', action='store_true',
                      help='Exclude uppercase letters')
    parser.add_argument('--no-numbers', action='store_true',
                      help='Exclude numbers')
    parser.add_argument('--no-special', action='store_true',
                      help='Exclude special characters')
    
    args = parser.parse_args()
    
    password = generate_password(
        length=args.length,
        use_uppercase=not args.no_uppercase,
        use_numbers=not args.no_numbers,
        use_special=not args.no_special
    )
    
    print(f"Password: \033[1m\033[92m{password}\033[0m")
    print(len(password)/1024, "KiB")
    # print(f"Quoted: \033[93m{quote(password)}\033[0m")

if __name__ == '__main__':
    main()
