function warnOncePerSession(message)
    persistent shown_messages
    if isempty(shown_messages)
        shown_messages = {};
    end

    if ~ismember(message, shown_messages)
        warning(message)
        shown_messages = [shown_messages, message];
    end
end
