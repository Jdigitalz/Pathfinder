import os 
import sys
import subprocess as sb

def main():
    try: 
        file = sys.argv[1]
        if os.path.exists(file):
            pass
        else:
            print(f"No file or path found '{file}'")
            exit()
        cwd = os.getcwd()
        full_path = f"{cwd}/{file}" 
        print(full_path)
        print("copied to cilpboard")
        sb.run(f"wl-copy {full_path}", shell=True)
    except Exception: 
        print(f"File or path was provided.")

if __name__ == "__main__": 
    main()
