function mkjv --description 'Create java folder'
  mkdir ~/java/$argv
  mkdir ~/java/$argv/src
  echo "public class $argv {
    public static void main(String[] args) throws Exception {
        System.out.println(\"Hello, Wordd!\");
    }
}" > ~/java/$argv/src/$argv'.java'
  mkdir ~/java/$argv/lib
end
