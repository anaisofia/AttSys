ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel 'Recently confirmed courses' do
          ul do
            Course.active.last(10).map do |course|
              li link_to(course.title, admin_course_path(course))
            end
          end
        end
      end

      column do
        panel 'Courses Status' do
          li "In Progress: #{Course.active.count}"
          li "Paused: #{Course.inactive.count}"
          # li "To Reassign Courses: #{Course.active.count}"
        end
      end

      column do
        panel 'Students' do
          li "Individuals: #{User.count}"
          # li "Companies: #{Companies.count}"
        end
      end
    end

    panel "Graphs" do
      render 'shared/chart'
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
