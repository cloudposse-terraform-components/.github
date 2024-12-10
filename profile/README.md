[![Banner](https://github.com/cloudposse-terraform-components/.github/blob/main/profile/banner/image.png?raw=true)](https://cpco.io/homepage)
<p align="right">
  <a href="https://cloudposse.com/slack" title="Slack Community"><img src="https://slack.cloudposse.com/for-the-badge.svg" alt="Slack Community"></a>
  <a href="https://cloudposse.com/office-hours/" title="Office Hours"><img src="https://img.shields.io/badge/Office_Hours-2891E8.svg?style=for-the-badge" alt="Office Hours"></a>
  <a href="https://cloudposse.com/quiz/" title="Request Quote"><img src="https://img.shields.io/badge/Request_Quote-success.svg?style=for-the-badge" alt="Request Quote"></a>
</p>

This is organization hosts a registry of [Terraform components](https://atmos.tools/core-concepts/components/) for provisioning infrastructure used by the Cloud Posse [reference architectures](https://docs.cloudposse.com). They work really well with [Atmos](https://atmos.tools), our open-source tool for managing infrastructure as code with Terraform.

> [!TIP]
> ## 👽 Check out the Demo of Atmos with Terraform
> Cloud Posse uses [`atmos`](https://atmos.tools) to easily orchestrate multiple environments using Terraform. <br/>
>
> When you design cloud architectures with Atmos, you will first break them apart into pieces called components. Then, you will implement Terraform "root modules" for each of those components. Finally, compose your components in any way you like using stacks, without the need to write any code or messy templates for code generation.
>
> <img src="https://github.com/cloudposse/atmos/blob/main/docs/demo.gif?raw=true"/><br/>
> <i>Example of running <a href="https://atmos.tools"><code>atmos</code></a> to manage infrastructure from our <a href="https://atmos.tools/quick-start/">Quick Start</a> tutorial.</i>

## Helpful resources

* [Component Library Documentation](https://docs.cloudposse.com/components/)
* [Component Best Practices](https://atmos.tools/best-practices/components)
* [Terraform Best Practices](https://docs.cloudposse.com/best-practices/terraform/)

<details>
<summary>Learn More</summary>

## Usage

Please take a look at each [component's README](https://docs.cloudposse.com/components/) for specific usage.

Generally, you can use these components in [Atmos](https://atmos.tools/core-concepts/components/) by adding something like the following code into your [stack manifest](https://atmos.tools/core-concepts/stacks/):

```yaml
components:                      # List of components to include in the stack
  terraform:                     # The toolchain being used for configuration
    vpc:                         # The name of the component (e.g. terraform "root" module)
      vars:                      # Terraform variables (e.g. `.tfvars`)
        cidr_block: 10.0.0.0/16  # A variable input passed to terraform via `.tfvars`
```

## Automated Updates of Components using GitHub Actions

Leverage our [GitHub Action](https://atmos.tools/integrations/github-actions/component-updater) to automate the creation and management of pull requests for component updates.

This is done by creating a new file (e.g. `atmos-component-updater.yml`) in the `.github/workflows` directory of your repository.

The file should contain the following:

```yaml
jobs:
update:
  runs-on:
    - "ubuntu-latest"
  steps:
    - name: Checkout Repository
      uses: actions/checkout@v4
      with:
        fetch-depth: 1

    - name: Update Atmos Components
      uses: cloudposse/github-action-atmos-component-updater@v2
      env:
        # https://atmos.tools/cli/configuration/#environment-variables
        ATMOS_CLI_CONFIG_PATH: ${{ github.workspace }}/rootfs/usr/local/etc/atmos/
      with:
        github-access-token: ${{ secrets.GITHUB_TOKEN }}
        log-level: INFO
        max-number-of-prs: 10

    - name: Delete abandoned update branches
      uses: phpdocker-io/github-actions-delete-abandoned-branches@v2
      with:
        github_token: ${{ github.token }}
        last_commit_age_days: 0
        allowed_prefixes: "component-update/"
        dry_run: no
```

For the full documentation on how to use the Component Updater GitHub Action, please see the [Atmos Integrations](https://atmos.tools/integrations/github-actions/component-updater) documentation.

## Related Projects

Check out these related projects.

- [Cloud Posse Terraform Modules](https://docs.cloudposse.com/modules/) - Our collection of reusable Terraform modules used by our [reference architectures](https://docs.cloudposse.com).
- [Atmos](https://atmos.tools) - Atmos is like docker-compose but for your infrastructure

## References

For additional context, refer to some of these links.

- [Cloud Posse Documentation](https://docs.cloudposse.com) - Complete documentation for the Cloud Posse solution
- [Reference Architectures](https://cloudposse.com/) - Launch effortlessly with our turnkey reference architectures, built either by your team or ours.

## ✨ Contributing

This components in this organization are under active development, and we encourage contributions from our community.

## References

For additional context, refer to some of these links.

- [Cloud Posse Documentation](https://docs.cloudposse.com) - Complete documentation for the Cloud Posse solution
- [Reference Architectures](https://cloudposse.com/) - Launch effortlessly with our turnkey reference architectures, built either by your team or ours.

### 🐛 Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/cloudposse-terraform-components/.github/issues) to report any bugs or file feature requests.

### 💻 Developing

If you are interested in being a contributor and want to get involved in developing this project or help out with Cloud Posse's other projects, we would love to hear from you!
Hit us up in [Slack](https://cpco.io/slack?utm_source=github&utm_medium=readme&utm_campaign=cloudposse-terraform-components/.github&utm_content=slack), in the `#cloudposse` channel.

### 🌎 Slack Community

Join our [Open Source Community](https://cpco.io/slack?utm_source=github&utm_medium=readme&utm_campaign=cloudposse-terraform-components/.github&utm_content=slack) on Slack. It's **FREE** for everyone! Our "SweetOps" community is where you get to talk with others who share a similar vision for how to rollout and manage infrastructure. This is the best place to talk shop, ask questions, solicit feedback, and work together as a community to build totally *sweet* infrastructure.

### 📰 Newsletter

Sign up for [our newsletter](https://cpco.io/newsletter?utm_source=github&utm_medium=readme&utm_campaign=cloudposse-terraform-components/.github&utm_content=newsletter) and join 3,000+ DevOps engineers, CTOs, and founders who get insider access to the latest DevOps trends, so you can always stay in the know.
Dropped straight into your Inbox every week — and usually a 5-minute read.

### 📆 Office Hours <a href="https://cloudposse.com/office-hours?utm_source=github&utm_medium=readme&utm_campaign=cloudposse-terraform-components/.github&utm_content=office_hours"><img src="https://img.cloudposse.com/fit-in/200x200/https://cloudposse.com/wp-content/uploads/2019/08/Powered-by-Zoom.png" align="right" /></a>

[Join us every Wednesday via Zoom](https://cloudposse.com/office-hours?utm_source=github&utm_medium=readme&utm_campaign=cloudposse-terraform-components/.github&utm_content=office_hours) for your weekly dose of insider DevOps trends, AWS news and Terraform insights, all sourced from our SweetOps community, plus a _live Q&A_ that you can’t find anywhere else.
It's **FREE** for everyone!


</details>

[![README Footer][readme_footer_img]][readme_footer_link]
[![Beacon][beacon]][website]

  [logo]: https://cloudposse.com/logo-300x69.svg
  [docs]: https://cpco.io/docs?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=docs
  [website]: https://cpco.io/homepage?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=website
  [github]: https://cpco.io/github?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=github
  [jobs]: https://cpco.io/jobs?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=jobs
  [hire]: https://cpco.io/hire?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=hire
  [slack]: https://cpco.io/slack?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=slack
  [linkedin]: https://cpco.io/linkedin?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=linkedin
  [twitter]: https://cpco.io/twitter?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=twitter
  [testimonial]: https://cpco.io/leave-testimonial?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=testimonial
  [office_hours]: https://cloudposse.com/office-hours?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=office_hours
  [newsletter]: https://cpco.io/newsletter?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=newsletter
  [discourse]: https://ask.sweetops.com/?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=discourse
  [email]: https://cpco.io/email?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=email
  [commercial_support]: https://cpco.io/commercial-support?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=commercial_support
  [we_love_open_source]: https://cpco.io/we-love-open-source?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=we_love_open_source
  [terraform_modules]: https://cpco.io/terraform-modules?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=terraform_modules
  [readme_header_img]: https://cloudposse.com/readme/header/img
  [readme_header_link]: https://cloudposse.com/readme/header/link?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=readme_header_link
  [readme_footer_img]: https://cloudposse.com/readme/footer/img
  [readme_footer_link]: https://cloudposse.com/readme/footer/link?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=readme_footer_link
  [readme_commercial_support_img]: https://cloudposse.com/readme/commercial-support/img
  [readme_commercial_support_link]: https://cloudposse.com/readme/commercial-support/link?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=readme_commercial_support_link
  [beacon]: https://ga-beacon.cloudposse.com/UA-76589703-4/cloudposse/.github?pixel&cs=github&cm=readme&an=.github
