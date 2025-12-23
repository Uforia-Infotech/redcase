
# Redcase - Redmine 6.0 Compatible

Test case management plugin for Redmine - Updated for Redmine 6.0
-----------------------------------------------------------------

This is an **upgraded version** of the original Redcase plugin found at [https://github.com/bugzinga/redcase](https://github.com/bugzinga/redcase), updated to be compatible with **Redmine 6.0**.

Redcase allows you to create, manage, and execute test cases, group them into test suites, link them with the native Redmine issues, work with multiple test environments, create reports, and more.

## Credits

- **Original Plugin**: [Bugzinga Redcase](https://github.com/bugzinga/redcase)
- **Redmine 6.0 Upgrade**: [Uforia Infotech](https://uforiainfotech.com)
- **Developer Page** [Usman Shaukat](https://github.com/usmanpakistan)

## Features

- Create and manage test cases
- Group test cases into test suites
- Execute test cases and track results
- Link test cases with Redmine issues
- Work with multiple test environments
- Generate test reports
- Export test data
- Drag and drop functionality for test case organization

## Requirements

- Redmine 6.0+
- Ruby 3.0+
- Rails 7.0+

## Installation

1. **Download and extract**: Download or clone this plugin into your Redmine plugins directory:
   ```bash
   cd /path/to/redmine/plugins
   git clone https://github.com/Uforia-Infotech/redcase.git
   ```

2. **Rename the folder**: Ensure the plugin folder is named exactly `redcase`:
   ```bash
   mv redcase-main redcase  # if downloaded as zip
   ```

3. **Install dependencies**: Install any required gems:
   ```bash
   cd /path/to/redmine
   bundle install
   ```

4. **Database migration**: Run the database migration to create necessary tables (make a backup first!):
   ```bash
   bundle exec rake redmine:plugins:migrate RAILS_ENV=production
   ```

5. **Restart your application server**: Restart Puma, Passenger, or your web server:
   ```bash
   # For Puma
   sudo systemctl restart puma
   
   # Or restart your specific application server
   ```

## Configuration

After installation:

1. **Add Trackers**: Go to Administration → Trackers and ensure you have:
    - "Test Case" tracker (required for test cases)
    - "Bug" tracker (useful for reporting bugs from failed tests)

2. **Project Setup**: In your project settings:
    - Enable the "Test Case" tracker for your projects
    - Assign appropriate permissions to users/roles:
        - `view_test_cases` - View test cases
        - `edit_test_cases` - Create/edit test cases
        - `execute_test_cases` - Execute test cases

3. **Permissions**: Configure user permissions under Administration → Roles and permissions

## Usage

1. Navigate to your project
2. Click on the "Test cases" tab in the project menu
3. Start creating test environments, test suites, and test cases
4. Execute test cases and track results

**Important Note**: To drag and drop test cases in the "Test Case" tab, the test cases need to have the status "In Progress".

## Changes from Original Plugin

This version includes several updates to ensure compatibility with Redmine 6.0:

- **Rails 7 Compatibility**: Updated code to work with Rails 7.x
- **Ruby 3+ Support**: Compatible with Ruby 3.0 and higher
- **API Updates**: Updated to use Redmine 6.0 APIs and deprecated method replacements
- **Security Enhancements**: Updated to follow Redmine 6.0 security practices
- **Database Schema**: Updated migration files for compatibility
- **UI Improvements**: Updated views to work with Redmine 6.0 theme system
- **Dependency Updates**: Updated gem dependencies and removed obsolete requirements

## Support

For issues related to this upgraded version, please contact [Uforia Infotech](https://github.com/Uforia-Infotech).

For general plugin documentation and usage, refer to the original [Redcase Wiki](https://bitbucket.org/bugzinga/redcase/wiki).

## License

This plugin maintains the same license as the original Redcase plugin. Please see the LICENSE file for details.

---

**Français**

À installer comme un plugin classique, décompresser l'archive dans le répertoire plugin et renommer le dossier simplement "redcase".
Ensuite lancer la mise à jour de la base de données (faire un backup auparavant !) pour ajouter les tables nécessaires au plugin avec cette commande :

*bundle exec rake redmine:plugins:migrate RAILS_ENV=production*

Redémarrer le serveur applicatif (Puma ou autre)

Ensuite, ajouter les trackers "Test Case" à vos projets et aussi le tracker "Bug" si vous ne l'avez pas (utile pour rapporter un bug sur un test non concluant).

Bon à savoir : Pour déplacer les cas de tests dans l'onglet "Test Case", il est nécessaire que ces derniers soient au statut "In Progress".
