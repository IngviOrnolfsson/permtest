function ltxFormat(figs)

arguments
    figs = findobj('Type','figure');
end

if isempty(figs)
    figs = findobj('Type','figure');
end
nF = numel(figs);
[~,sidx] = sort([figs.Number]);
sfigs = figs(sidx);

for f = 1:nF
    fig = sfigs(f);
    axes = findall(fig.Children,'type','Axes');
    nAx = numel(axes);

    for ax = 1:nAx
        axe = axes(ax);
        axe.YLabel.Interpreter = 'latex';
        axe.XLabel.Interpreter = 'latex';
        axe.ZLabel.Interpreter = 'latex';
        axe.TickLabelInterpreter = 'latex';

        if ~isempty(axe.Legend)
            axe.Legend.Interpreter = 'latex';
            axe.Legend.String = cellfun(@(x) strrep(x,'%','\%'),axe.Legend.String,'UniformOutput',false);
        end

        if ~isempty(axe.Title.String)
            axe.Title.Interpreter = 'latex';
            axe.Title.String = strrep(axe.Title.String,'%','\%');
        end

        axe.XLabel.String = strrep(axe.XLabel.String,'%','\%');
        axe.YLabel.String = strrep(axe.YLabel.String,'%','\%');
        axe.ZLabel.String = strrep(axe.ZLabel.String,'%','\%');

        
        if ~isempty(axe.XTickLabel)
            axe.XTick = axe.XTick;
            axe.XTickLabel = cellfun(@(x) strrep(x,'%','\%'),axe.XTickLabel,'UniformOutput',false);
        end
        if ~isempty(axe.YTickLabel)
            axe.YTick = axe.YTick;
            axe.YTickLabel = cellfun(@(x) strrep(x,'%','\%'),axe.YTickLabel,'UniformOutput',false);
        end
        if ~isempty(axe.ZTickLabel)
            axe.ZTick = axe.ZTick;
            axe.ZTickLabel = cellfun(@(x) strrep(x,'%','\%'),axe.ZTickLabel,'UniformOutput',false);
        end
    end

end
