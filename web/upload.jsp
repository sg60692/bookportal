<div class="container-login100">
                    <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                        <form id="up-form" action="uploadServlet" method="post" class="login100-form validate-form" <% if (x == 0) {
                                out.print("style=\"dislpay:none;\"");
                            }%>>
                            <span class="login100-form-title p-b-49">
                                Upload Book
                            </span>

                            <div class="wrap-input100 validate-input m-b-23" data-validate = "Bookname is reauired">
                                <span class="label-input100" style="font-weight:bold;">Book name</span>
                                <input class="input100" type="text" name="bookname" placeholder="Type book name">
                            </div>

                            <div class="wrap-input100 validate-input m-b-23" data-validate="Author is required">
                                <span class="label-input100" style="font-weight:bold;">Author</span>
                                <input class="input100" type="text" name="author" placeholder="Type author">
                            </div>
                            <div class="wrap-input100 validate-input" data-validate="Link is required">
                                <span class="label-input100" style="font-weight:bold;">Link</span>
                                <input class="input100" type="text" name="link" placeholder="Please provide Link">
                            </div>

                            <div class="text-right p-t-8 p-b-31">
                            </div>
                            <div class="container-login100-form-btn">
                                <div class="wrap-login100-form-btn">
                                    <div class="login100-form-bgbtn"></div>
                                    <button id="sub-but" class="login100-form-btn">
                                        upload
                                    </button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>