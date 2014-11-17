export JAVA_HOME=`/usr/libexec/java_home`
export MAVEN_HOME=/usr/share/maven
#export HOMEBREW_GITHUB_API_TOKEN=aaad9ce3d524c670ec4fb2d105c7aac132638a75
#export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
export FLAGS_GETOPT_CMD="$(brew --prefix gnu-getopt)/bin/getopt"
#export CHEF_HOME=/opt/chef
export GO_PATH=/usr/local/opt/go

#export PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$CHEF_HOME/embedded/bin:/Users/jtodd1/tools/sbt/bin:$PATH
export PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

bp=`brew --prefix`
bcp="$bp/etc/bash_completion.d"

for f in `ls $bcp`; do
  . $bcp/$f
done
