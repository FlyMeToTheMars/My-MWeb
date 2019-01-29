# Apache NiFi Registry User Guide

Apache NiFi Team[dev@nifi.apache.org](mailto:dev@nifi.apache.org)

Table of Contents

- [Introduction](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#introduction)
- Browser Support
  - [Unsupported Browsers](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#unsupported-browsers)
  - [Viewing the UI in Variably Sized Browsers](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#viewing-the-ui-in-variably-sized-browsers)
- [Terminology](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#terminology)
- [NiFi Registry User Interface](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#User_Interface)
- [Logging In](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#logging-in)
- Manage Flows
  - [View a Flow](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#view-a-flow)
  - [Delete a Flow](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#delete-a-flow)
- Manage Buckets
  - [Sorting & Filtering Buckets](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#sorting-filtering-buckets)
  - [Create a Bucket](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#create-a-bucket)
  - [Delete a Bucket](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#delete-a-bucket)
  - [Delete Multiple Buckets](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#delete-multiple-buckets)
  - [Edit a Bucket Name](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#edit-a-bucket-name)
  - [Bucket Policies](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#bucket-policies)
- Manage Users & Groups
  - [Sorting & Filtering Users/Groups](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#sorting-filtering-users-groups)
  - [Add a User](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#add-a-user)
  - [Delete a User](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#delete-a-user)
  - [Delete Multiple Users](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#delete-multiple-users)
  - [Edit a User Name](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#edit-a-user-name)
  - [Special Privileges](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#special-privileges)
- Manage Groups
  - [Add an Empty Group](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#add-an-empty-group)
  - [Add User to a Group](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#add-user-to-a-group)
  - [Create a New Group with Selected Users](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#create-a-new-group-with-selected-users)
  - [Remove a User from a Group](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#remove-a-user-from-a-group)
  - [Other Group Level Actions](https://nifi.apache.org/docs/nifi-registry-docs/html/user-guide.html#other-group-level-actions)

## Introduction

Apache NiFi Registry—a subproject of Apache NiFi—is a complementary application that provides a central location for storage and management of shared resources across one or more instances of NiFi and/or MiNiFi.

The first implementation of the Registry supports versioned flows. Process group level dataflows created in NiFi can be placed under version control and stored in a registry. The registry organizes where flows are stored and manages the permissions to access, create, modify or delete them.

See the [System Administrator’s Guide](https://nifi.apache.org/docs/nifi-registry-docs/html/administration-guide.html) for information about Registry system requirements, installation, and configuration. Once NiFi Registry is installed, use a supported web browser to view the UI.

## Browser Support

| Browser | Version                 |
| ------- | ----------------------- |
| Chrome  | Current and Current - 1 |
| FireFox | Current and Current - 1 |
| Safari  | Current and Current - 1 |

Current and Current - 1 indicates that the UI is supported in the current stable release of that browser and the preceding one. For instance, if the current stable release is 62.X then the officially supported versions will be 62.X and 61.X.

For Safari, which releases major versions much less frequently, Current and Current - 1 simply represent the two latest releases.

The supported browser versions are driven by the capabilities the UI employs and the dependencies it uses. UI features will be developed and tested against the supported browsers. Any problem using a supported browser should be reported to Apache NiFi.

### Unsupported Browsers

While the UI may run successfully in unsupported browsers, it is not actively tested against them. Additionally, the UI is designed as a desktop experience and is not currently supported in mobile browsers.

### Viewing the UI in Variably Sized Browsers

In most environments, all of the UI is visible in your browser. However, the UI has a responsive design that allows you to scroll through screens as needed, in smaller sized browsers or tablet environments.

|      | The minimum recommended screen size is 1080px X 445px. |
| ---- | ------------------------------------------------------ |
|      |                                                        |

## Terminology

**Flow**: A process group level NiFi dataflow that has been placed under version control and saved to the Registry.

**Bucket**: A container that stores and organizes flows.

**Policy**: Defines a user or group’s ability to import, view, commit changes and/or delete flows.

## NiFi Registry User Interface

The NiFi Registry UI displays the shared resources available and provides mechanisms for creating and administering users/groups, buckets and policies.

When the application is started, the user is able to navigate to the UI by going to the default address of `http://<hostname>:18080/nifi-registry` in a web browser. There are no permissions configured by default, so anyone is able to view and modify the flows and buckets. For information on securing the system, see the [System Administrator’s Guide](https://nifi.apache.org/docs/nifi-registry-docs/html/administration-guide.html).

When an administrator navigates to the UI for the first time, the registry is empty as there are no flow resources available to share yet:

![NiFi Registry Components](https://nifi.apache.org/docs/nifi-registry-docs/html/images/nifi-registry-components.png)

The Buckets menu is available at the top left of the screen. It allows the user to display flows based on which bucket they are contained in. On the top right of the screen is the Settings button (![Settings Icon](https://nifi.apache.org/docs/nifi-registry-docs/html/images/iconSettings.png)) which accesses functionality for managing users, groups, buckets and policies. Next to the Settings button is the Help button (![Help Icon](https://nifi.apache.org/docs/nifi-registry-docs/html/images/iconHelp.png)) which accesses the NiFi Registry Documentation.

## Logging In

If NiFi Registry is configured to run securely, users will have to be granted permissions to buckets by an administrator. For information on configuring NiFi Registry to run securely, see the [System Administrator’s Guide](https://nifi.apache.org/docs/nifi-registry-docs/html/administration-guide.html).

If the user is logging in with their username/password they will be presented with a screen to do so.

![NiFi Registry Login](https://nifi.apache.org/docs/nifi-registry-docs/html/images/loginRegistry.png)

## Manage Flows

### View a Flow

Flows in all buckets are listed in the main window of the UI by default. If the registry is secured, only the flows in the buckets that the user has access to are listed.

![All Flows](https://nifi.apache.org/docs/nifi-registry-docs/html/images/flows_all.png)

To see the flows in a particular bucket, select that bucket from the drop-down menu at the top left of the UI.

![Bucket Menu](https://nifi.apache.org/docs/nifi-registry-docs/html/images/bucket_menu.png)

Click on a flow to see its Description and Change Log:

![Flow Change Log](https://nifi.apache.org/docs/nifi-registry-docs/html/images/flow_change_log.png)

The Change Log includes all versions that were saved for a flow. Clicking on the version reveals details about when the version was saved, which user committed the save, and any comments entered by the user.

#### Sorting & Filtering Flows

Flows can be sorted alphabetically by Name (ascending or descending) or by Update (newest or oldest) using the drop-down at the top right of the UI.

![Flows Sort Menu](https://nifi.apache.org/docs/nifi-registry-docs/html/images/flows_sort_menu.png)

The flow list can be filtered by:

- flow name
- flow description
- flow ID
- bucket name
- bucket ID

Here is an example filtering by flow name:

![Flows Filter By Name](https://nifi.apache.org/docs/nifi-registry-docs/html/images/flows_filter_by_name.png)

### Delete a Flow

To delete a flow from the registry:

1. Click on the flow to see its details.

2. Select the "Actions" drop-down and click the "Delete" menu option.

   ![Flow Delete Action](https://nifi.apache.org/docs/nifi-registry-docs/html/images/flow_delete_action.png)

3. Select "Delete" to confirm.

   ![Flow Delete Confirm](https://nifi.apache.org/docs/nifi-registry-docs/html/images/flow_delete_confirm.png)

|      | It is possible to delete a flow that is actively being used in NiFi. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

## Manage Buckets

To manage buckets, enter the Administration section of the Registry by clicking the Settings button (![Settings Icon](https://nifi.apache.org/docs/nifi-registry-docs/html/images/iconSettings.png)) on the top right of the UI. The Buckets window appears by default.

### Sorting & Filtering Buckets

Buckets can be sorted alphabetically by Name (ascending or descending) using the up/down arrows.

![Buckets Sort By Name](https://nifi.apache.org/docs/nifi-registry-docs/html/images/buckets_sort_by_name.png)

The buckets listed can be filtered by:

- bucket name
- bucket description
- bucket ID

Here is an example filtering by bucket name:

![Buckets Filter By Name](https://nifi.apache.org/docs/nifi-registry-docs/html/images/buckets_filter_by_name.png)

### Create a Bucket

1. Select the "New Bucket" button.

   ![New Bucket Button](https://nifi.apache.org/docs/nifi-registry-docs/html/images/new_bucket_button.png)

2. Enter the desired bucket name and select the "Create" button.

   ![New Bucket Dialog](https://nifi.apache.org/docs/nifi-registry-docs/html/images/new_bucket_dialog.png)

|      | To quickly create multiple buckets, check "Keep this dialog open after creating bucket". |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

### Delete a Bucket

1. Select the Delete button (![Delete Icon](https://nifi.apache.org/docs/nifi-registry-docs/html/images/iconDelete.png)) in the row of the bucket.

   ![Delete Single Bucket](https://nifi.apache.org/docs/nifi-registry-docs/html/images/delete_bucket_single.png)

2. From the Delete Bucket dialog, select "Delete".

   ![Delete Bucket Dialog](https://nifi.apache.org/docs/nifi-registry-docs/html/images/delete_bucket_dialog.png)

### Delete Multiple Buckets

1. Select the checkboxes in the rows of the desired buckets to delete.

   ![Check Multiple Buckets](https://nifi.apache.org/docs/nifi-registry-docs/html/images/check_multiple_buckets.png)

2. Select the "Actions" drop-down and click the "Delete" option.

   ![Delete Multiple Buckets](https://nifi.apache.org/docs/nifi-registry-docs/html/images/delete_multiple_buckets.png)

3. From the Delete Buckets dialog, select "Delete".

   ![Delete Buckets Dialog](https://nifi.apache.org/docs/nifi-registry-docs/html/images/delete_buckets_dialog.png)

### Edit a Bucket Name

1. Select the Manage button (![Manage Icon](https://nifi.apache.org/docs/nifi-registry-docs/html/images/iconManage.png)) in the row of the bucket.

   ![Manage Bucket](https://nifi.apache.org/docs/nifi-registry-docs/html/images/manage_bucket.png)

2. Enter a new name for the bucket and select the "Save" button.

   ![Edit Bucket Name](https://nifi.apache.org/docs/nifi-registry-docs/html/images/bucket_nav_name_edit.png)

### Bucket Policies

Bucket policies define user privileges on buckets/flows in the Registry and in NiFi. The available permissions are:

- **All** - In the Registry, the assigned user is able to view and delete flows in the bucket. In NiFi, the selected user is able to import flows from the bucket and commit changes to flows in the bucket.
- **Read** - In the Registry, the assigned user is able to view flows in the bucket. In NiFi, the selected user is able to import flows from the bucket.
- **Write** - In NiFi, the assigned user is able to commit changes to flows in the bucket.
- **Delete** - In the Registry, the assigned user is able to delete flows in the bucket.

|      | Users would typically have Read permissions at a minimum. A user with Write permission would not commit changes to a flow if they were not able to import it initially. A user with Delete permission would not delete a flow if they could not view it. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

|      | If a user has a bucket policy and the group that the user is in also has a policy, all policies are used to determine access. For example, assume User1 is in Group1, User1 has READ privileges on Bucket1 and Group1 has READ privileges on Bucket2. In this scenario, User1 will have READ privileges on both Bucket1 and Bucket2. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

#### Create a Bucket Policy

1. Select the Manage button (![Manage Icon](https://nifi.apache.org/docs/nifi-registry-docs/html/images/iconManage.png)) in the row of the bucket.

2. Select the "New Policy" button.

   ![Create New Bucket Policy](https://nifi.apache.org/docs/nifi-registry-docs/html/images/new_bucket_policy_create.png)

3. Select a user, check the desired permissions and select the "Apply" button:

   ![New Bucket Policy User and Permissions](https://nifi.apache.org/docs/nifi-registry-docs/html/images/new_bucket_policy_user_permission.png)

4. The policy is added to the bucket:

   ![New Bucket Policy Added](https://nifi.apache.org/docs/nifi-registry-docs/html/images/new_bucket_policy_added.png)

#### Delete a Bucket Policy

1. Select the Manage button (![Manage Icon](https://nifi.apache.org/docs/nifi-registry-docs/html/images/iconManage.png)) in the row of the bucket.

2. Select the Delete button (![Delete Icon](https://nifi.apache.org/docs/nifi-registry-docs/html/images/iconDelete.png)) in the row of the policy.

   ![Delete Policy](https://nifi.apache.org/docs/nifi-registry-docs/html/images/delete_bucket_policy.png)

3. From the Delete Policy dialog, select "Delete".

   ![Delete Policy Dialog](https://nifi.apache.org/docs/nifi-registry-docs/html/images/delete_bucket_policy_dialog.png)

## Manage Users & Groups

To manage users/groups, enter the Administration section of the Registry by clicking the Settings button (![Settings Icon](https://nifi.apache.org/docs/nifi-registry-docs/html/images/iconSettings.png)) on the top right of the UI. Select Users from the top menu to open the Users window.

### Sorting & Filtering Users/Groups

Users/groups can be sorted alphabetically by Name (ascending or descending) using the up/down arrows.

![Users Sort By Name](https://nifi.apache.org/docs/nifi-registry-docs/html/images/users_sort_by_name.png)

The Users/groups listed can be filtered by:

- user name
- user ID
- group name
- group ID

Here is an example of filtering by user name:

![Users Filter By Name](https://nifi.apache.org/docs/nifi-registry-docs/html/images/users_filter_by_name.png)

### Add a User

1. Select the "Add User" button.

   ![Add User](https://nifi.apache.org/docs/nifi-registry-docs/html/images/add_user_button.png)

2. Enter the desired username or appropriate Identity information. Select the "Add" button.

   ![New User Dialog](https://nifi.apache.org/docs/nifi-registry-docs/html/images/add_user_dialog.png)

|      | To quickly create multiple users, check "Keep this dialog open after adding user". |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

### Delete a User

1. Select the Delete button (![Delete Icon](https://nifi.apache.org/docs/nifi-registry-docs/html/images/iconDelete.png)) in the row of the user.

   ![Delete Single User](https://nifi.apache.org/docs/nifi-registry-docs/html/images/delete_user_single.png)

2. From the Delete User dialog, select "Delete".

   ![Delete User Dialog](https://nifi.apache.org/docs/nifi-registry-docs/html/images/delete_user_dialog.png)

### Delete Multiple Users

1. Select the checkboxes in the rows of the desired users to delete.

   ![Check Multiple Users](https://nifi.apache.org/docs/nifi-registry-docs/html/images/check_multiple_users.png)

2. Select the "Actions" drop-down and click the "Delete" option.

   ![Delete Multiple Users](https://nifi.apache.org/docs/nifi-registry-docs/html/images/delete_multiple_users.png)

3. From the Delete Users dialog, select "Delete".

   ![Delete Users Dialog](https://nifi.apache.org/docs/nifi-registry-docs/html/images/delete_users_groups_dialog.png)

### Edit a User Name

1. Select the Manage button (![Manage Icon](https://nifi.apache.org/docs/nifi-registry-docs/html/images/iconManage.png)) in the row of the user.

   ![Manage User](https://nifi.apache.org/docs/nifi-registry-docs/html/images/manage_user.png)

2. Enter a new user name and select the "Save" button.

   ![Edit User Name](https://nifi.apache.org/docs/nifi-registry-docs/html/images/user_nav_name_edit.png)

|      | Some users cannot have their names edited. For example, those defined by LDAP. These users will be specially highlighted in the list. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

![Non-configurable Users](https://nifi.apache.org/docs/nifi-registry-docs/html/images/users_non_configurable.png)

### Special Privileges

Special privileges are additional permissions that allow a user to manage or access certain aspects of the Registry. The special privileges are:

- **Can manage buckets** - Allow a user to manage all buckets in the registry, as well as provide the user access to all buckets from a connected system (e.g., NiFi).
- **Can manage users** - Allow a user to manage all registry users and groups.
- **Can manage policies** - Allow a user to grant all registry users read, write, and delete permission to a bucket.
- **Can proxy user requests** - Allow a connected system (e.g., NiFi) to process requests of authorized users of that system.

#### Grant Special Privileges to a User

1. Select the Manage button (![Manage Icon](https://nifi.apache.org/docs/nifi-registry-docs/html/images/iconManage.png)) in the row of the user.

   ![Manage User](https://nifi.apache.org/docs/nifi-registry-docs/html/images/manage_user.png)

2. Check the desired privileges:

   ![User Special Privileges](https://nifi.apache.org/docs/nifi-registry-docs/html/images/user_special_privileges.png)

3. Changes made to special privileges are automatically saved.

## Manage Groups

### Add an Empty Group

1. With no users checked, select the "Actions" drop-down and click the "Create new group" option.

   ![Create New Group](https://nifi.apache.org/docs/nifi-registry-docs/html/images/create_new_group.png)

2. Enter a name for the Group and select the "Create" button.

   ![Create New Group Dialog](https://nifi.apache.org/docs/nifi-registry-docs/html/images/create_new_group_dialog.png)

|      | To quickly create multiple empty groups, check the "Keep this dialog open after creating user" checkbox. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

### Add User to a Group

1. Select the Manage button (![Manage Icon](https://nifi.apache.org/docs/nifi-registry-docs/html/images/iconManage.png)) in the row of the user.

2. Select the "Add To Group" button.

   ![Add User to Group](https://nifi.apache.org/docs/nifi-registry-docs/html/images/user_nav_add_to_group.png)

3. In the "Add User to Groups" dialog, select the group(s) to add the user to. Select the "Add" button when all desired groups have been selected.

   ![Add User to Groups Dialog](https://nifi.apache.org/docs/nifi-registry-docs/html/images/add_user_to_groups_dialog.png)

4. The user is added to the group:

   ![Group Added](https://nifi.apache.org/docs/nifi-registry-docs/html/images/group_added.png)

|      | Groups cannot contain other groups. |
| ---- | ----------------------------------- |
|      |                                     |

### Create a New Group with Selected Users

1. Select the checkboxes in the rows of the desired users. From the "Actions" drop-down, click the "Create new group" option.

   ![Select Users for New Group](https://nifi.apache.org/docs/nifi-registry-docs/html/images/select_users_create_new_group.png)

2. Enter a name for the Group and select the "Create" button.

   ![Create New Group Dialog](https://nifi.apache.org/docs/nifi-registry-docs/html/images/select_users_create_new_group_dialog.png)

3. The new group is created with the selected users as members:

   ![New Group Added with Selected Users](https://nifi.apache.org/docs/nifi-registry-docs/html/images/select_users_new_group_added.png)

### Remove a User from a Group

There are two ways to remove a user from a group.

#### User Window

1. Select the Manage button (![Manage Icon](https://nifi.apache.org/docs/nifi-registry-docs/html/images/iconManage.png)) in the row of the user.

2. In the Membership section of the window, select the Remove button (![Delete Icon](https://nifi.apache.org/docs/nifi-registry-docs/html/images/iconDelete.png)) in the row of the group.

   ![Remove Group From User](https://nifi.apache.org/docs/nifi-registry-docs/html/images/remove_group_from_user.png)

#### Group Window

1. Select the Manage button (![Manage Icon](https://nifi.apache.org/docs/nifi-registry-docs/html/images/iconManage.png)) in the row of the group. The Members tab is selected by default.

2. In the Membership section of the window, select the Remove button (![Delete Icon](https://nifi.apache.org/docs/nifi-registry-docs/html/images/iconDelete.png)) in the row of the user.

   ![Remove User From Group](https://nifi.apache.org/docs/nifi-registry-docs/html/images/remove_user_from_group.png)

### Other Group Level Actions

Editing group names, deleting groups, adding policies to/deleting policies from groups and granting special privileges to groups follow similar procedures described earlier for corresponding user level actions.

Last updated 2018-06-16 08:37:12 -04:00