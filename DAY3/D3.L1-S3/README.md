<img src="../../img/logo.png" alt="Chmurowisko logo" width="200" align="right">
<br><br>
<br><br>
<br><br>

# Working with Amazon Simple Storage Service (S3)

## LAB Overview

#### During this lab you will create a S3 bucket, upload some files, and work with permisions.

## Task 1: Create a Bucket

In this task you will create an Amazon S3 bucket. Every object in Amazon S3 is stored in a bucket.

1. In the AWS Management Console, on the **Services** menu, click **S3**. 
2. Click **+Create bucket** button. 
3. Paste the name: **csa0419-studentX-2** 
4. Select Region: **EU (Ireland)** 

Selecting a particular region allows you to optimize latency, minimize costs, or address regulatory
requirements. Objects stored in a region never leave that region unless you explicitly transfer them to
another region.

5. Click **Next**.   
6. Click **Next**. 
7. At the **Set properties** dialog box, read the short descriptions for the categories listed. 

By default these properties are disabled.

8. Now there is pretty new option that prevents form expose the bucket content to the public access. 
9. For purpose of our lab, please **unselect** Block all public access. 
10. Click **Next**. 
11. Review the settings and then click **Create bucket**. 

You have now successfully created a bucket.

## Task 2: Upload an Object to the Bucket

Now that you have created a bucket, you are ready to store objects. An object can be any kind of file: a text
file, a photo, a video, a zip file, etc. When you add an object to Amazon S3, you have the option of including
metadata with the object and setting permissions to control access to the object.

In the LAB with IAM Role for EC2 you uploaded a file using an aws cli. This time you will do this over AWS
Management Console.

12. Download from the Internet any sample image file.
13. In the **S3 Management Console**, click your bucket created in previous task.
14. Click **Upload**.

This launches an upload wizard that will assist you in uploading files. Using this wizard you can upload files,
either by selecting them from a file chooser or by dragging them to the S3 window (depending of browser
type).

15. At the **(1) Select files** dialog box, click **Add files**.
16. Browse to and select the file you downloaded from the Internet.
17. At the upload wizard, click **Upload**.

This time you will just upload the file with the default setting. But it’s possible to provide additional setting
and permissions at the wizard.

You can watch the progress of the upload from within the Transfer panel at the bottom of the screen. Once
your file has been uploaded, it will be displayed in the bucket.

## Task 3: Make an Object Public

In this task you will configure permissions on an object so that it is publicly accessible.
First, you will attempt to access the object to confirm that it is private by default.

18. Click the file you just uploaded.
19. Copy the S3 **Link** displayed at the bottom of the window.

The link should look similar to this: https://s3-eu-west-1.amazonaws.com/csa-instructor-2/DD02XgDWsAAlPcV.jpg

20. Open a new web browser tab, paste the link into the address field, and hit enter.

You should receive an **Access Denied** error. This is because objects in Amazon
S3 are private by default. Next, you will configure the object to be publicly accessible.

21. Keep this browser tab open, but return to the web browser tab with the S3 Management Console.
22. In the **S3 Management Console**, click the **Permissions tab**.
23. Under **Public access**, select **Everyone**. (This opens an Everyone window.)
24. In the **Everyone** window, configure the following: 
    * Click **Read object** 
    * Click **Save**

You will find a warning about that file will have public access. You should already observer similar warning
(to opened Securitu Group for EC2 in EC2 Lab). By default for the most of the services any public access is
closed. The user must consciously change these settings, and each time will be notify like just a moment
before.

25.  Return to the browser tab that displayed **Access Denied** and **refresh** the page.

Your picture should be now be displayed because it is publicly accessible.
In this example, you granted access only to a specific object. If you wish to grant access to an entire bucket,
you would use a Bucket Policy.

### **PAUSE.... BACK TO COURSE MATERIALS.**

## Task 4: Create a Bucket Policy

In this task you will create a bucket policy to set all objects with a public access.

26. Download another sample graphic file from the Internet.
27. Upload the file to the same bucket.
28. Click on the file in S3 bucket.
29. Copy the S3 **Link** displayed at the bottom of the window.
30. Open a new web browser tab, paste the link into the address field, and hit enter.

Once again, **Access Denied** will be displayed. Next, you will now configure a Bucket Policy to grant access to
all objects in the bucket without having to specify permissions on each object individually.

31. Keep this browser tab open, but return to the web browser tab with the S3 Management Console.
32. Click the name of your bucket at the top of the window.
33. Click the **Permissions** tab.
34. In the **Permissions** tab, click **Bucket Policy**.

The content of the bucket policy should be empty now. You’ve got two options to create a bucket policy,
manually or with **AWS Policy generator.**

35. Copy the **ARN** of your bucket to the clipboard. It is displayed at the top of the policy editor (it should like like this: *arn:aws:s3:::csa-instructor-2*). 

36. Click the **Policy generator** link at the bottom of the page (a new tab will open). 

37. In the **AWS Policy Generator** window, configure the following: 

    * **Select Type of Policy**: S3 Bucket Policy

    * **Principal**: * 

    * **Action**: GetObject

    * **Amazon Resource Name (ARN)**: Paste the ARN that you previously copied.

    * At the end of the ARN, append **/\*** 

      The ARN should look similar to: ***arn:aws:s3:::csa-instructor-2/\**** 

38. Click **Add Statement**.
39. Click **Generate Policy**.

Your bucket policy is now displayed. Confirm that **/\*** appears after your bucket name in **Resource** definition. 

40. Copy the policy to your clipboard.
41. Close the web browser tab and return to the web browser tab with the **Bucket policy editor**.
42. Paste the bucket policy into the **Bucket policy editor**.
43. Click **Save**.

You have just applied a bucket policy to your bucket. You should get a "This bucket has public access” notification on the top.

44. Return to the browser tab that displayed **Access Denied** and **refresh** the page.

You should now see a picture you downloaded in step 28. Now repeat steps from 27-31 and verify if the policy works correctly. This time you get a public access automatically. 

## Task 5: Play with Versioning

In this task, you will enable a versioning on your bucket and upload a different version of the file.

45. In the S3 Management Console, click the **Properties** tab off your bucket.
46. Click on **Versioning** select **Enable versioning** and click **Save**.
47. On you computer create a new paste “Hello World” and save as file.txt.
48. In the S3 Management Console, click the **Overview** tab.
49. Click **Upload** and use the same upload process to upload the file.txt file.
50. Click on the **file.txt**.
51. Copy the S3 **Link** displayed at the bottom of the window and open it in a new tab.

You should get the content of the file.

52. Edit the file.txt, add a new tekst in new line, save and upload to S3 bucket.
53. Return to the browser tab that displayed **Hello World** and **refresh** the page.

You should get an updated content of the file
You can also obtain a list of available versions in the S3 Management Console.

54. In the Amazon S3 Management Console, click the name of the **file.txt** object.
55. Click **Latest version** beside the object name and remove a “Latest version” of the file.
56. Return to the browser tab that displayed **Hello World** and **refresh** the page.

You should get an original content of the file.

57. In the Amazon S3 Management Console, click the name of your bucket at the top of the window.
58. Select **file.txt** click **More** button and click **Delete** and confirm by clicking **Delete.**
59. Click **Show** button in **Versions** to display all version of your files in S3 bucket.

At the bottom you should find your file.txt

60. Right-click on your **file.txt** with (Delete marker) and from the menu select **Delete** (and confirm).
61. Click **Hide** button in **Versions**.

You file should appear on the list. It might be confusing, but the last operation only removed a marker, not an object. So finally the file was “restored”.

## END LAB

This is the end of the lab with Amazon S3. In this lab you learned:

* How to create a bucket.
* How to upload a file and make it public.
* You created a bucket policy.
* Played with versioning.

Don’t remove the bucket, you will use it in the next lab. 

<br><br>

<center><p>&copy; 2019 Chmurowisko Sp. z o.o.<p></center>