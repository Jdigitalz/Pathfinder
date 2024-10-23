import os 
import sys
import subprocess as sb

def main():
    try: 
        file = sys.argv[1]
        cwd = os.getcwd()
        full_path = f"{cwd}/{file}" 
        print(full_path)
        print("copied to cilpboard")
        sb.run(f"wl-copy {full_path}", shell=True)
    except IndexError: 
        if file == None: 
            print("No file or path provided.")
        else: 
            print(f"No file or path found '{file}'")

if __name__ == "__main__": 
    main(file)
