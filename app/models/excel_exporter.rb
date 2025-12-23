
require 'csv'
class Excel_Exporter

	unloadable

	def self.exportTestResults(project_id, suite_id, version_id, environment_id)
		issues = Issue
			.where({ project_id: project_id })
			.order(id: :asc)
			.pluck(:id)
		test_cases = TestCase.where({ issue_id: issues })
		versions = Version.find(version_id)
		environments = ExecutionEnvironment.find(environment_id)
		rows = []
		rows << [
			'ID',
			'Suite',
			'Title',
			"#{versions.name}(#{environments.name})",
			'Comment'
		]
		test_cases = test_cases.sort { |a, b|
			(a.test_suite.name <=> b.test_suite.name)
		}
		test_cases.each { |test_case|
			if (suite_id.to_i < 0) || test_case.in_suite?(suite_id.to_i, project_id)
				row = []
				row << "##{test_case.issue.id}"
				row << test_case.test_suite.name
				row << "#{test_case.issue.subject}"
				found = ExecutionJournal
					.where(test_case_id: test_case.id, environment_id: environments.id, version_id: versions.id)
					.order(created_on: :desc)
					.first
				row << (!found ? 'Not Executed' : found.result.name)
				if found.present?
					if found.comment.present?
						row << found.comment
					else
						# TODO: Is it needed?
						row << ''
					end
				else
					# TODO: What's the point of this?
					row << ''
				end
				rows << row.clone
			end
		}
		bom = "\357\273\277"
		bom + rows.inject('') { |buffer, row|
			buffer += CSV.generate_line(row)
			buffer
		}.force_encoding('utf-8')
	end

end


# Zeitwerk (Rails 6+) expects this file to define ExcelExporter.
# Keep backward compatibility by aliasing the original class name.
ExcelExporter = Excel_Exporter unless defined?(ExcelExporter)
