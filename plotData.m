function [thePlot] = plot_line(x,y,type,t,x_label,y_label,x_lim,y_lim)
    %General code, similar to Lab 5
    %Provided by instructors for use in Lab 7
    thePlot = axes('units','normalized','Position',[0.2 0.26 0.63 0.69]);
    thePlot = plot(x,y,type);
    title(t);
    xlabel(x_label);
    ylabel(y_label);
    xlim(x_lim);
    ylim(y_lim);
end
