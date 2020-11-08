cd app

flutter build web --release

aws s3 sync build/web s3://imagist2/ --acl public-read

cd ..

echo http://imagist2.s3-website-us-east-1.amazonaws.com

# http://imagist2.s3-website-us-east-1.amazonaws.com