from qutebrowser.api import interceptor

# Youtube
def filterYoutube(info: interceptor.Request):
    """Block the given request if necessary."""
    # and url.path() == "/get_video_info"

    url = info.request_url
    if "youtube.com" in url.host() and "&adformat=" in url.query():
        info.block()


interceptor.register(filterYoutube)
